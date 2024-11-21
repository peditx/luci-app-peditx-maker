include $(TOPDIR)/rules.mk

# Package Info
PKG_NAME:=luci-app-peditx-maker
PKG_VERSION:=1.0
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)

# Package Description
define Package/luci-app-peditxmaker
  SECTION:=luci
  CATEGORY:=Utilities
  DEPENDS:=+luci +libuci +lucihttp
  TITLE:=PeDitX-Maker
  DESCRIPTION:=A tool for installing PassWall and related scripts
endef

# Define the 'compile' target (empty in this case)
define Package/luci-app-peditxmaker/compile
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
