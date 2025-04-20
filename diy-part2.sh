#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate

# Modify default theme
#sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# Modify hostname
#sed -i 's/OpenWrt/P3TERX-Router/g' package/base-files/files/bin/config_generate

sed -i \
  -e '/^CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDE_NONE_V2RAY=y/s/^/#/' \
  -e '/^CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDE_Shadowsocks_NONE_Client=y/s/^/#/' \
  -e '/^CONFIG_PACKAGE_luci-app-ssr-plus_INCLUDE_Shadowsocks_NONE_Server=y/s/^/#/' \
  .config

cat << EOF >> .config
CONFIG_ALL_KMODS=y
#Custom
CONFIG_PACKAGE_luci-app-ddns=y
CONFIG_PACKAGE_luci-app-frps=y
CONFIG_PACKAGE_luci-app-wireguard=y
CONFIG_PACKAGE_luci-app-wol=y
CONFIG_PACKAGE_tailscale=y
CONFIG_PACKAGE_cloudflared=y
CONFIG_PACKAGE_snmpd=y
EOF
