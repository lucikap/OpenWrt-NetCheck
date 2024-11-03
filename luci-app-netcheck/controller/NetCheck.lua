module("luci.controller.NetCheck", package.seeall)

function index()
    entry({"admin", "diagnostics"}, alias("admin", "diagnostics"), _("故障诊断"), 90).index = true
    entry({"admin", "diagnostics", "status"}, cbi("diagnostics/status"), _("网络诊断"), 10)
    --template\call\
    --entry({"admin", "diagnostics", "Advanced"}, cbi("diagnostics/Advanced"), _("高级功能"), 20)
    --entry({"admin", "diagnostics", "contact"}, cbi("diagnostics/contact"), _("关于插件"), 30)
    --定义一个请求，用于获取网络诊断的结果并以json格式返回给前端
    entry({"admin", "diagnostics", "get_result"}, call("get_result"), nil)
    entry({"admin", "diagnostics", "get_result_all"}, call("diag_shell_script"), nil)
end

function get_result()
    local e = {}
    local sites = {"www.baidu.com", "www.google.com", "www.github.com", "www.qq.com"}
    local results = {}

    for _, site in ipairs(sites) do
        local cmd = string.format("ping -c 1 -W 1 %s | grep 'time='", site)
        local result = luci.sys.exec(cmd)

        if result ~= "" then
            -- 提取时间值
            local time_value = result:match("time=([%d%.]+) ms")
            if time_value then
                results[site] = time_value .. " ms"
            else
                results[site] = "请求超时"
            end
        else
            results[site] = "请求超时"
        end
    end

    e.results = results
    luci.http.prepare_content("application/json")
    luci.http.write_json(e)
end

function diag_shell_script()
    -- 检查脚本路径是否有效
    script_path = "/usr/bin/netcheck"  
        luci.http.prepare_content("text/plain")

        -- 执行 shell 脚本并读取输出
        local util = io.popen(script_path .. " 2>&1")  -- 确保标准错误也被捕获
        if util then
            -- 循环读取输出
            while true do
                local line = util:read("*l")
                if not line then break end
                luci.http.write(line)  -- 将每行输出写入 HTTP 响应
                luci.http.write("\n")   -- 添加换行符
            end

            util:close() 
        end

        return

end
