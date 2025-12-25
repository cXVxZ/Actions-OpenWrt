#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
#echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
#echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default

cat << EOF >>package/kernel/mt76/patches/001-wifi-mt76-wake-queues-after-reconfig.patch
--- a/mt76x02_mmio.c
+++ b/mt76x02_mmio.c
@@ -534,6 +534,7 @@ void mt76x02_reconfig_complete(struct ieee80211_hw *hw,
		return;

	clear_bit(MT76_RESTART, &dev->mphy.state);
+	ieee80211_wake_queues(hw);
}
EXPORT_SYMBOL_GPL(mt76x02_reconfig_complete);

EOF
