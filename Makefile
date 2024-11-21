include $(TOPDIR)/rules.mk

# اطلاعات پکیج
PKG_NAME:=peditxmaker
PKG_VERSION:=1.0
PKG_RELEASE:=1

include $(INCLUDE_DIR)/package.mk

# توضیحات پکیج
define Package/peditxmaker
  SECTION:=admin
  CATEGORY:=LuCI
  SUBMENU:=3. Applications
  TITLE:=PeDitX-Maker
  DEPENDS:=+luci-base
endef

# توضیحات نصب
define Package/peditxmaker/description
  A LuCI application for installing PassWall2.
endef

# اسکریپت نصب
define Build/Prepare
	$(CP) ./src/* $(1)/
endef

# دستورات نصب
define Package/peditxmaker/install
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/controller
	$(INSTALL_DATA) ./src/controller/*.lua $(1)/usr/lib/lua/luci/controller/

	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/model/cbi/peditxmaker
	$(INSTALL_DATA) ./src/model/cbi/*.lua $(1)/usr/lib/lua/luci/model/cbi/peditxmaker/

	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) ./src/bin/* $(1)/usr/bin/
endef

# اضافه کردن به Makefile اصلی
$(eval $(call BuildPackage,peditxmaker))
