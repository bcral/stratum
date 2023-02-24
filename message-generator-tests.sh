search_dir="../../test/message-generator/test/"
message_generator_dir="./utils/message-generator/"

cd $message_generator_dir

for entry in `ls $search_dir`; do
    echo $entry
    cargo llvm-cov --no-report run ../$search_dir$entry || { echo 'mg test failed' ; exit 1; }
done

cargo llvm-cov --cobertura --ignore-filename-regex "utils/|experimental/" --output-path ../../target/cobertura.xml report