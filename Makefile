include $(TOPDIR)/rules.mk

# Package Info
PKG_NAME:=luci-app-peditx-maker
PKG_VERSION:=1.0
PKG_RELEASE:=1

# Define build directory
PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)

# Package Description
define Package/luci-app-peditx-maker
  SECTION:=luci
  CATEGORY:=Utilities
  DEPENDS:=+luci +libuci +lucihttp
  TITLE:=PeDitX-Maker
  DESCRIPTION:=A tool for installing PassWall and related scripts
endef

# Install the package files directly
define Package/luci-app-peditx-maker/install
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/controller
	$(INSTALL_DATA) ./src/controller/*.lua $(1)/usr/lib/lua/luci/controller/

	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/model/cbi/peditxmaker
	$(INSTALL_DATA) ./src/model/cbi/*.lua $(1)/usr/lib/lua/luci/model/cbi/peditxmaker/

	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) ./src/bin/* $(1)/usr/bin/
endef

$(eval $(call BuildPackage,luci-app-peditx-maker))
