return {
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files Telescope" },
      {
        "<leader>fh",
        "<cmd>Telescope live_grep vimgrep_arguments=rg,--color=never,--no-heading,--no-heading,--line-number,--column,--smart-case,--hidden,--no-ignore<cr>",
        desc = "Find in hidden files",
      },
    },
    opts = {
      pickers = {
        find_files = {
          hidden = true,
          find_command = { "rg", "--files", "--glob", "!**/.git/*", "-L" },
        },
        grep_string = {
          additional_args = { "--hidden", "--smart-case" },
        },
        live_grep = {
          additional_args = { "--hidden", "--smart-case" },
        },
      },
    },
  },
  {
    "telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      config = function()
        require("telescope").load_extension("fzf")
      end,
    },
  },
  {
    "nvim-telescope/telescope-symbols.nvim",
  },
}
