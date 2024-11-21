local m, s, btn_install

-- Define the form
m = Map("peditxmaker", "PeDitX-Maker", "A tool for installing PassWall2")

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

return m
