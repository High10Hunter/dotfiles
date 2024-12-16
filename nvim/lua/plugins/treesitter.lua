return {

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "lua",
        "python",
        "javascript",
        "typescript",
        "vimdoc",
        "vim",
        "regex",
        "terraform",
        "sql",
        "dockerfile",
        "toml",
        "json",
        "java",
        "groovy",
        "go",
        "gitignore",
        "graphql",
        "yaml",
        "make",
        "cmake",
        "markdown",
        "markdown_inline",
        "bash",
        "tsx",
        "css",
        "html",
        "c_sharp",
      },
      -- Disable terraform treesitter on fixture files
      highlight = {
        disable = function(lang)
          local buf_name = vim.fn.expand("%")
          if lang == "terraform" and string.find(buf_name, "fixture") then
            return true
          end
        end,
      },
      -- Autoinstall languages that are not installed
      auto_install = true,
      indent = { enable = true, disable = { "ruby" } },
    },
  },
}
