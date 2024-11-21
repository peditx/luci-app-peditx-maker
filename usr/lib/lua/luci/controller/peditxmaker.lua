module("luci.controller.peditxmaker", package.seeall)

function index()
    entry({"admin", "services", "peditxmaker"}, cbi("peditxmaker/form"), _("PeDitX-Maker"), 60).dependent = true
end
