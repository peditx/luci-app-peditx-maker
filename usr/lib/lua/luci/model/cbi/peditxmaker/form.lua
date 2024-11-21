local m, s, btn_install

-- تعریف فرم
m = Map("peditxmaker", "PeDitX-Maker", "برنامه PeDitX-Maker با دکمه نصب PassWall2")

-- تعریف سکشن
s = m:section(TypedSection, "settings", "تنظیمات")
s.addremove = false
s.anonymous = true

-- دکمه نصب PassWall2
btn_install = s:option(Button, "_install_passwall2", "Install PassWall2")
btn_install.inputtitle = "نصب PassWall2"
btn_install.inputstyle = "apply"
function btn_install.write(self, section)
    luci.sys.call("wget -O /tmp/passwall2.sh 'https://raw.githubusercontent.com/peditx/iranIPS/refs/heads/main/.files/passwall2.sh' && chmod +x /tmp/passwall2.sh && sh /tmp/passwall2.sh &")
end

return m
