f = SimpleForm("netcheck", translate("网络诊断助手"), translate([[
    <label style='justify-content:center;display:flex;align-items:center;font-size:16px;font-weight:bold;'>
    网络延迟列表
    </label><br>]]))

f.submit = false
f.reset = false

o1 = f:section(SimpleSection, "")
o1.template = "diagnostics/status"

o2 = f:section(SimpleSection, "")
o2.template = "diagnostics/netcheck"

return f

