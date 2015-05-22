ntp-service:
  file.managed:
    - name: /etc/ntp.conf
    - source: salt://openstack/init/files/ntp.conf
    - user: root
    - group: root
    - mode: 644
  pkg.installed:
    - name: ntp
  service.running:
    - name: ntpd
    - enable: True
    - reload: True

yum_repo_release:
  pkg.installed:
    - sources:
      - epel-release: http://mirrors.aliyun.com/epel/6/x86_64/epel-release-6-8.noarch.rpm
      - rdo-release-icehouse-4: http://repos.fedorapeople.org/repos/openstack/openstack-icehouse/rdo-release-icehouse-4.noarch.rpm
    - unless: rpm -qa | grep epel-release-6-8 && rpm -qa | grep rdo-release-icehouse-4

pkg-base:
  pkg.installed:
    - names:
      - lrzsz
      - MySQL-python
      - python-crypto
