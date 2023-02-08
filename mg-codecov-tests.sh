message_generator_dir="./utils/message-generator/"

cd $message_generator_dir

cargo run -- ../../../test/message-generator/test/cov/cov_test.json
