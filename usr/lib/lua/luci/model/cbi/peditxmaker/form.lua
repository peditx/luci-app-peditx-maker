local m, s, btn_install, btn_install_passwall, btn_install_passwalldue, btn_install_extrapack, btn_install_warpplus

-- Define the form
m = Map("peditxmaker", "PeDitX-Maker", "A tool for installing PassWall2, PassWall, PassWall1+2, PassWall Extra Pack, and CloudFlare Warp-Plus")

-- Define a section
s = m:section(TypedSection, "settings", "Settings")
s.addremove = false
s.anonymous = true

-- Button for installing PassWall2
btn_install = s:option(Button, "_install_passwall2", "Install PassWall2")
btn_install.inputtitle = "Install PassWall2"
btn_install.inputstyle = "apply"
function btn_install.write(self, section)
    luci.sys.call("wget -O /tmp/passwall2.sh 'https://raw.githubusercontent.com/peditx/iranIPS/refs/heads/main/.files/passwall2.sh' && chmod +x /tmp/passwall2.sh && sh /tmp/passwall2.sh &")
end

-- Button for installing PassWall
btn_install_passwall = s:option(Button, "_install_passwall", "Install PassWall")
btn_install_passwall.inputtitle = "Install PassWall"
btn_install_passwall.inputstyle = "apply"
function btn_install_passwall.write(self, section)
    luci.sys.call("wget -O /tmp/passwall.sh 'https://raw.githubusercontent.com/peditx/iranIPS/refs/heads/main/.files/passwall.sh' && chmod +x /tmp/passwall.sh && sh /tmp/passwall.sh &")
end

-- Button for installing both PassWall1 and PassWall2
btn_install_passwalldue = s:option(Button, "_install_passwalldue", "Install PassWall1+2")
btn_install_passwalldue.inputtitle = "Install PassWall1+2"
btn_install_passwalldue.inputstyle = "apply"
function btn_install_passwalldue.write(self, section)
    luci.sys.call("wget -O /tmp/passwalldue.sh 'https://raw.githubusercontent.com/peditx/iranIPS/refs/heads/main/.files/passwalldue.sh' && chmod +x /tmp/passwalldue.sh && sh /tmp/passwalldue.sh &")
end

-- Button for installing PassWall Extra Pack
btn_install_extrapack = s:option(Button, "_install_extrapack", "Install PassWall Extra Pack")
btn_install_extrapack.inputtitle = "Install PassWall Extra Pack"
btn_install_extrapack.inputstyle = "apply"
function btn_install_extrapack.write(self, section)
    luci.sys.call("wget -O /tmp/expass.sh 'https://raw.githubusercontent.com/peditx/iranIPS/refs/heads/main/.files/extras/expass.sh' && chmod +x /tmp/expass.sh && sh /tmp/expass.sh &")
end

-- Button for installing CloudFlare Warp-Plus
btn_install_warpplus = s:option(Button, "_install_warpplus", "Install CloudFlare Warp-Plus")
btn_install_warpplus.inputtitle = "Install CloudFlare Warp-Plus"
btn_install_warpplus.inputstyle = "apply"
function btn_install_warpplus.write(self, section)
    luci.sys.call("wget -O /tmp/warpplus.sh 'https://raw.githubusercontent.com/peditx/iranIPS/refs/heads/main/.files/extras/warpplus.sh' && chmod +x /tmp/warpplus.sh && sh /tmp/warpplus.sh &")
end

return m
