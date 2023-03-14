search_dir="../../test/message-generator/test/"
message_generator_dir="./utils/message-generator/"

cd $message_generator_dir

cargo llvm-cov clean --workspace

for entry in `ls $search_dir`; do
    echo $entry
    cargo run -- ../$search_dir$entry || { echo 'mg test failed' ; exit 1; }
done

cd ../../

cargo llvm-cov --ignore-filename-regex "utils/|experimental/|protocols/" --cobertura --output-path "target/mg-coverage.xml" report