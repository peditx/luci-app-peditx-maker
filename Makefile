include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-peditxmaker
PKG_VERSION:=1.0
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)

define Package/luci-app-peditxmaker
  SECTION:=luci
  CATEGORY:=Utilities
  DEPENDS:=+luci +libuci +lucihttp
  TITLE:=PeDitX-Maker
  DESCRIPTION:=A tool for installing PassWall and related scripts
endef

define Package/luci-app-peditxmaker/compile
	$(CP) ./files/* $(1)/
endef

# Define installation paths
define Package/luci-app-peditxmaker/install
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/controller
	$(INSTALL_DATA) ./files/controller/*.lua $(1)/usr/lib/lua/luci/controller/

	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/model/cbi/peditxmaker
	$(INSTALL_DATA) ./files/model/cbi/*.lua $(1)/usr/lib/lua/luci/model/cbi/peditxmaker/

	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) ./files/bin/*.sh $(1)/usr/bin/
endef

$(eval $(call BuildPackage,luci-app-peditxmaker))
