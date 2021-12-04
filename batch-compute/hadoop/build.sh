img="hadoop:v1.0"
docker rmi -f $img
docker build -t $img . 
