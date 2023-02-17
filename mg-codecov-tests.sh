message_generator_dir="./utils/message-generator/"

cd $message_generator_dir

RUST_BACKTRACE=1 cargo run -- ../../../test/message-generator/test/cov/cov_test.json
