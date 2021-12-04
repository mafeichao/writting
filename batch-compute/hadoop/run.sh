#设置hadoop集群局域网（host网络不支持固定ip）
docker network inspect hadoopnet > /dev/null
if [ $? -ne 0 ];then
    docker network create --subnet=172.18.0.0/16 hadoopnet
fi

id=1
if [ $# -eq 1 ];then
    id=$1
fi

host=hadoop$id
name=hadoop$id
ip=172.18.0.$((id+1))

#http://127.0.0.1:9001
#http://127.0.0.1:9002
docker rm -f $name
if [ $id -eq 1 ];then
    docker run -d \
        -p 9001:9001 \
        -p 9002:9002 \
        -p 9003:9003 \
        -p 9004:9004 \
        -p 9005:9005 \
        --privileged \
        -h $host \
        --name $name \
        --net hadoopnet \
        --ip $ip \
        hadoop:v1.0 \
        /usr/sbin/init
else
    docker run -d \
        --privileged \
        -h $host \
        --name $name \
        --net hadoopnet \
        --ip $ip \
        hadoop:v1.0 \
        /usr/sbin/init

fi
