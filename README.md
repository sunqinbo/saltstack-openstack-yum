# SaltStack 自动化部署OpenStack Icehouse
前言
====

**诞生记**

    首先：之前编写了SaltStack自动化部署OpenStackI版：使用的源码包的方式[https://github.com/unixhot/saltstack-openstack-source]（"点这里"）
    因为：有用户反映安装起来比较繁琐，加上pip源网络的问题，很多朋友自动化部署有问题。
    所以：本次重新使用yuan安装的方式重新编写了一遍。
    最后：如有建议欢迎反馈。QQ：57459267

**友情提示**

    本文的使用对象为熟悉OpenStack，可以手动完成OpenStack的部署的用户。
    如果不熟悉OpenStack的用户，可以参考我录制的
    [http://edu.51cto.com/course/course_id-2187.html]("《OpenStack企业私有云实践》课程"]


使用方式
====

**1.OpenStack架构**

![架构图](https://github.com/unixhot/saltstack-openstack-yum/blob/master/openstack-arch.png)  

**2.介绍**

    - 1.每个服务均有一个目录存放SLS文件。每个目录下均有files目录，用来存放源文件。
    - 2.每个服务均有一个Pillar文件，主要定义和配置相关的如IP地址、网络接口、用户名和密码等。

**使用步骤**

***1.下载SLS和源码安装包***
```ObjectiveC
# git clone https://github.com/unixhot/saltstack-openstack-yum
```

**2.修改Pillar目录的各个服务的配置**

**3.修改top.sls**

**All-In-One(所有服务均安装在一台服务器)**

```ObjectiveC
base:
  '*':
    - openstack.all-in-one
```

***控制节点+计算节点***

```ObjectiveC
base:
  'control':
      - openstack.control
  'compute':
      - openstack.compute
```

***多节点***

```ObjectiveC
base:
  'mysql':
    - openstack.mysql.server
  'rabbitmq':
    - openstack.rabbitmq-server
  'keystone':
    - openstack.keystone.server
  'glance':
    - openstack.glance.server
  'nova-control':
    - openstack.nova.control
  'nova-compute':
    - openstack.nova.compute
    - openstack.neutron.linuxbridge_agent
  'neutron-server':
    - openstack.neutron.server
  'cinder-server':
    - opensack.cinder.server
  'horizon':
    - openstack.horizon.server
  
