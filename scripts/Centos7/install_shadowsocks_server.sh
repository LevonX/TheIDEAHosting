cd /etc/yum.repos.d
curl -O https://copr.fedorainfracloud.org/coprs/librehat/shadowsocks/repo/epel-7/librehat-shadowsocks-epel-7.repo
yum -y install shadowsocks-libev
setcap CAP_NET_BIND_SERVICE=+eip /usr/bin/ss-server
cat > /etc/shadowsocks-libev/config.json << 'EOF'
{
  "server": "IP_Address",
  "server_port": PORT,
  "password": "PASS",
  "method": "aes-256-cfb"
}
EOF
systemctl enable shadowsocks-libev --now
systemctl enable firewalld --now
firewall-cmd --add-port=8388/tcp --permanent
systemctl restart firewalld
