include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-netcheck
PKG_VERSION=1.0.0
PKG_RELEASE:=1


include $(INCLUDE_DIR)/package.mk

define Package/luci-app-netcheck
	SECTION:=luci
	CATEGORY:=LuCI
	SUBMENU:=3. Applications
	TITLE:=Diagnose Your Network Connection Issues.
	PKGARCH:=all
endef

define Package/luci-app-netcheck/description
	Diagnose Your Network Connection Issues.
endef

define Build/Prepare
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/luci-app-netcheck/install
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/controller/
	$(INSTALL_DIR) $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/model/cbi/diagnostics/
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/view/diagnostics/
	
	
	$(INSTALL_BIN) ./controller/* $(1)/usr/lib/lua/luci/controller/
	$(INSTALL_BIN) ./model/* $(1)/usr/lib/lua/luci/model/cbi/diagnostics/
	$(INSTALL_BIN) ./view/* $(1)/usr/lib/lua/luci/view/diagnostics/
	$(INSTALL_BIN) ./usr/bin/* $(1)/usr/bin/
endef

$(eval $(call BuildPackage,luci-app-netcheck))
