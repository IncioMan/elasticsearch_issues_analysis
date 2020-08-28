cd $1
if ! [ -d $2 ] 
then
    echo "Creating folder $2..."
    mkdir $2
fi
for i in {1..10}
do
    if ! [ -d "$2/$i" ] 
    then
        echo "Creating folder $2/$i..."
        mkdir $2/$i
    fi
    docker run -it -w /elasticsearch/ -v "/Users/alexincerti/Code/elasticsearch/test_reports/$2/$i:/tmp/test_reports/" -v "/Users/alexincerti/.gradle/wrapper:/root/.gradle/wrapper" -v "/Users/alexincerti/.gradle/caches:/root/.gradle/caches" elastic/$3 /bin/bash -c "git checkout tags/$2 -b $2 &&\
    ./gradlew --stop && ./gradlew :server:test --build-cache --tests org.apache.lucene.queries.DoubleRandomBinaryDocValuesRangeQueryTests &&\
    cp -r /elasticsearch/server/build/reports/tests/test /tmp/test_reports"
done