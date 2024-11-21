include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-peditx-maker
PKG_VERSION:=1.0
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)

define Package/luci-app-peditx-maker
  SECTION:=luci
  CATEGORY:=Utilities
  DEPENDS:=+luci +libuci +lucihttp
  TITLE:=PeDitX-Maker
  DESCRIPTION:=A tool for installing PassWall and related scripts
endef

# Define the installation process
define Package/luci-app-peditx-maker/install
    $(INSTALL_DIR) $(1)/usr/lib/lua/luci/controller
    $(INSTALL_DATA) ./files/usr/lib/lua/luci/controller/*.lua $(1)/usr/lib/lua/luci/controller/

    $(INSTALL_DIR) $(1)/usr/lib/lua/luci/model/cbi/peditxmaker
    $(INSTALL_DATA) ./files/usr/lib/lua/luci/model/cbi/peditxmaker/*.lua $(1)/usr/lib/lua/luci/model/cbi/peditxmaker/

    $(INSTALL_DIR) $(1)/usr/bin
    $(INSTALL_BIN) ./files/usr/bin/* $(1)/usr/bin/

    $(INSTALL_DIR) $(1)/etc/init.d
    $(INSTALL_BIN) ./files/etc/init.d/peditxmaker $(1)/etc/init.d/
endef

$(eval $(call BuildPackage,luci-app-peditx-maker))
