local m, s, btn_install, btn_install_passwall

-- Define the form
m = Map("peditxmaker", "PeDitX-Maker", "A tool for installing PassWall2 and PassWall")

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

return m
