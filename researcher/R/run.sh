docker build -t renv ./

docker run -it --rm \
    -v $(pwd)/test.r:/test.r \
    renv
