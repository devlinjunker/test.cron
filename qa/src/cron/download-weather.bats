#!/usr/bin/env ../../..libs/bats/bin/bats
load '../../../lib/bats-support/load'
load '../../../lib/bats-assert/load'

SCRIPT_DIR="$BATS_TEST_DIRNAME"/../../../src/cron/

TEST_PREFIX="download-image.sh -";

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