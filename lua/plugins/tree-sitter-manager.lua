-- nvim-treesitter has been archived, but neovim has added the experimental treesitter
-- support to the core program. it does however not offer adding further languages,
-- so adding the tree sitter manager to replace the original nvim-treesitter
-- functionality with the core treesitter and downloading via manager
return {
    "romus204/tree-sitter-manager.nvim",
    -- tree-sitter CLI must be installed system-wide.
    -- cargo binstall tree-sitter-cli
    -- https://github.com/tree-sitter/tree-sitter/blob/master/crates/cli/README.md
    dependencies = {}, 
    config = function()
        require("tree-sitter-manager").setup({
            ensure_installed = {
				"c", "cpp",
				"hlsl", "glsl", "wgsl",
				"java",
				"lua", "vim", --"help",
				"javascript", "html", "json", "xml", "yaml",
				"rust", "toml",
				"python",
				"make", "cmake",
            }
        })
    end
}
