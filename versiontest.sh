cd $1
echo "ciao $1"
if ! [ -d $2 ] 
then
    echo "Creating folder $2..."
    mkdir $2
fi
for i in {1..1}
do
    if ! [ -d "$2/$i" ] 
    then
        echo "Creating folder $2/$i..."
        mkdir $2/$i
    else
        echo "Emptying folder $2/$i..."
        rm $2/$i/*
    fi
    docker run -it -w /elasticsearch/ -v "$1/$2/$i:/tmp/test_reports/" -v "$4/.gradle/wrapper:/root/.gradle/wrapper" -v "$4/.gradle/caches:/root/.gradle/caches" elastic/$3 /bin/bash -c "git checkout tags/$2 -b $2 &&\
    ./gradlew --stop && ./gradlew :server:test --build-cache --tests org.apache.lucene.queries.DoubleRandomBinaryDocValuesRangeQueryTests &&\
    cp -r /elasticsearch/server/build/reports/tests/test /tmp/test_reports"
done