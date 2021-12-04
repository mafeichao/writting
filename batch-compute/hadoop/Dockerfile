# This is hadoop Dockerfile
# Version 1.0

# Base images 基础镜像
FROM centos:7.2.1511

#MAINTAINER 维护者信息
MAINTAINER AIKnowledge

#RUN 安装基础软件
RUN yum install -y net-tools.x86_64 git vim sudo which wget openssh openssh-server openssh-clients

#RUN 设置root密码为hadoop 
RUN echo "root:hadoop" | chpasswd

#RUN 启动sshd服务（此处无法以privileged模式执行）
#RUN systemctl start sshd

#RUN 生成ssh认证秘钥
RUN ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa

#ADD hadoop和jdk安装包，拷过去会自动解压
ADD hadoop-2.8.5 /apps/hadoop-2.8.5
ADD jdk-8u202-linux-x64.tar.gz /apps/

#ENV 设置环境变量
ENV JAVA_HOME /apps/jdk1.8.0_202
ENV CLASSPATH .:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
ENV PATH $JAVA_HOME/bin:$PATH

ENV HADOOP_HOME /apps/hadoop-2.8.5
ENV PATH $HADOOP_HOME/bin:$HADOOP_HOME/sbin:$PATH

#RUN mkdir准备hadoop目录
RUN mkdir -p /home/hadoop/tmp /home/hadoop/hdfs_name /home/hadoop/hdfs_data

#ADD master节点的启动脚本
ADD master.sh /apps
#普及一下sshd和init
