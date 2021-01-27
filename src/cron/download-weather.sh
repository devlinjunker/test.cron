#! /bin/bash
#
# Basic Shell Script to expirement with cron jobs
#
# Downloads North Pacific Satellite image from a URL
# Also downloads the forecast from 7timer Weather Forecast API
#
# How often should this run? 8am, 12pm, 4pm, 8pm? 
# 4 times a day will add 1GB every 6 months...
# For sure don't need more than 2 years.. 
# realistically we can try to make files smaller/less detail after 1 month


# TODO: This doesn't work if we type like `src/cron/download-weather.sh` (must include ./ )
# works for ./download-weather.sh and /bin/bash ./download-weather.sh
# Get Directory of this Script so we can execute relative to it
DIR=$(dirname "${BASH_SOURCE[0]}")
PWD=$(pwd)
if [[ "$DIR" != *"$PWD"* ]] && ! [[ "$DIR" =~ "^\/" ]]; then # prepend PWD if it is not in DIR and not absolute path
    DIR="$PWD/$(echo "$DIR" | sed s/^\\.\\/?// )" # to make sure this is becomes an absolute path
fi

# Locate JQ Version (based on OS)
JQ_BIN="$DIR/../../lib/jq-"
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    JQ_BIN+="linux64"
elif [[ "$OSTYPE" == "darwin"* ]]; then
    JQ_BIN+="osx-amd64"
else
    echo "Error: OS not supported ($OSTYPE)"
    exit 1
fi

# TODO: Maybe use zippopotamus to get LAT/LONG
# e.g. https://api.zippopotam.us/us/97202
LAT="45.50"
LONG="-122.6"

IMG_URL="https://cdn.star.nesdis.noaa.gov/GOES17/ABI/SECTOR/np/GEOCOLOR/1800x1080.jpg"
WEATHER_URL="http://www.7timer.info/bin/civillight.php?lon=$LONG&lat=$LAT&ac=0&unit=british&output=json&tzshift=0"


# TODO: Rename to get_geocolor
# Image is about 1.6MB, so 1GB after 660 images or so. 2 years at 1 photo a day
get_image() {
    # TODO: Should we "|| exit" these? with non-zero?
    curl $IMG_URL > "geocolor.jpg"
}

# Get forecast from 7timer forecast API and print to files
get_weather() {
    # shellcheck disable=SC2207
    WEATHER=( $(curl "$WEATHER_URL" | $JQ_BIN -c '.dataseries[] | { weather: .weather, tempmin: .temp2m.min, tempmax: .temp2m.max, date: .date }') )

    echo "${WEATHER[@]}" > weather.json

    # echo $WEATHER
    for OBJ in "${WEATHER[@]}"; do 
        DATE=$(echo "$OBJ" | $JQ_BIN .date)
        MIN=$(echo "$OBJ" | $JQ_BIN .tempmin)
        MAX=$(echo "$OBJ" | $JQ_BIN .tempmax)
        TYPE=$(echo "$OBJ" | $JQ_BIN .weather | sed s/\"//g) 
        touch "$DATE-$MIN$TYPE$MAX"
    done
}

# TODO: get_daylight? to return daylight hours for that day
# seems like this depends on us creating a directory for each day (with 1 forecast, and multiple images)


# TODO: get_isobar? maybe just in get_image function?

main() {
    # Create weather/ Directory
    if [ ! -d "$DIR/../../weather" ]; then
        mkdir "$DIR/../../weather"
    fi

    cd "$DIR/../../weather" || exit

    # Get Current Weather stuff
    CURRENT=$(date "+%Y%m%d.%H%M")
    if [ ! -d "$CURRENT" ]; then
        mkdir "$CURRENT"
        (
        cd "$CURRENT" || exit
        
        get_image
        get_weather
        )
    fi

    # Add Image Link to imgs/ dir
    if [ ! -d imgs ]; then
        mkdir imgs
    fi
   
    (
    cd imgs || exit
    if [ ! -f "$CURRENT.jpg" ]; then
        ln -s "../$CURRENT/geocolor.jpg" "$CURRENT.jpg"
    fi
    )
    

    # TODO: Archive older than 1 month?
    # Doesn't seem like compressing the image with tar really helps..
    # Maybe we can make it smaller? less detail? run another jpg compression?
}

main "$@"
