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

$(eval $(call BuildPackage,luci-app-peditxmaker))
