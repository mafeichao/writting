#配置集群节点间ssh免密登录
host=$(hostname)
if [ $host == "hadoop1" ];then
    cat ~/.ssh/id_rsa.pub > ~/.ssh/authorized_keys

    ssh root@hadoop2 "cat ~/.ssh/id_rsa.pub" >> ~/.ssh/authorized_keys
    ssh root@hadoop3 "cat ~/.ssh/id_rsa.pub" >> ~/.ssh/authorized_keys

    scp ~/.ssh/authorized_keys root@hadoop2:~/.ssh/
    scp ~/.ssh/authorized_keys root@hadoop3:~/.ssh/
fi

#格式化hdfs
hdfs namenode -format

#启动集群（会通过ssh命令到slaves机器上执行启动命令）
start-all.sh

#启动historyserver
mr-jobhistory-daemon.sh start historyserver
