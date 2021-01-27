#!/usr/bin/env ../../..libs/bats/bin/bats
load '../../../lib/bats-support/load'
load '../../../lib/bats-assert/load'

SCRIPT_DIR="$BATS_TEST_DIRNAME"/../../../src/cron/

TEST_PREFIX="download-image.sh -";

# Examples
# @test "$TEST_PREFIX should not.." {
#     # function git() {
#     #     echo "abc/test-name";
#     # }
#     # export -f git


#     run "$SCRIPT_DIR"/download-image.sh

#     assert_failure
# } 

# @test "$TEST_PREFIX should.." {
#     # function git() {
#     #     echo "abc/test-name";
#     # }
#     # export -f git


#     run "$SCRIPT_DIR"/download-image.sh

#     assert_success
# } 

# @test "$TEST_PREFIX should create weather and imgs dir if not exist" {}

# @test "$TEST_PREFIX should create date dir" {}

# @test "$TEST_PREFIX should NOT create date dir if exists" {}

# @test "$TEST_PREFIX should create 7 files + json file (8 total) for forecast" {}

# @test "$TEST_PREFIX should create image files for geocolor and isobar" {}

# @test "$TEST_PREFIX should add new file to imgs/ dir" {}