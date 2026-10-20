local shell = "pwsh"
if GetOS() == "Windows" then
    shell = "powershell.exe"
end

return {
    "TheLeoP/powershell.nvim",
    ---@type powershell.user_config
    opts = {
        shell = shell,
        bundle_path = vim.fn.stdpath "data" .."/mason/packages/powershell-editor-services",
    }
}
