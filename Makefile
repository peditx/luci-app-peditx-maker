include $(TOPDIR)/rules.mk

# Package Info
PKG_NAME:=luci-app-peditxmaker
PKG_VERSION:=1.0
PKG_RELEASE:=1

include $(INCLUDE_DIR)/package.mk

# Package Description
define Package/luci-app-peditxmaker
  SECTION:=admin
  CATEGORY:=LuCI
  SUBMENU:=3. Applications
  TITLE:=PeDitX-Maker
  DEPENDS:=+luci-base
endef

define Package/luci-app-peditxmaker/description
  A LuCI application for installing PassWall2.
endef

# Prepare the package
define Build/Prepare
	$(CP) ./src/* $(1)/
endef

# Install the package
define Package/luci-app-peditxmaker/install
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/controller
	$(INSTALL_DATA) ./src/controller/*.lua $(1)/usr/lib/lua/luci/controller/

	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/model/cbi/peditxmaker
	$(INSTALL_DATA) ./src/model/cbi/*.lua $(1)/usr/lib/lua/luci/model/cbi/peditxmaker/

	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) ./src/bin/* $(1)/usr/bin/
endef

$(eval $(call BuildPackage,luci-app-peditxmaker))
