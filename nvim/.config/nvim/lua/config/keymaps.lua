-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--

local opts = { noremap = true, silent = true }

-- delete single character without copying into register
vim.keymap.set("n", "x", '"_x', opts)

-- Resize with arrows
-- vim.keymap.set("n", "<Up>", ":resize -2<CR>", opts)
-- vim.keymap.set("n", "<Down>", ":resize +2<CR>", opts)
vim.keymap.set("n", "<Left>", ":vertical resize -2<CR>", opts)
vim.keymap.set("n", "<Right>", ":vertical resize +2<CR>", opts)

-- Buffers
vim.keymap.set("n", "<Tab>", ":bnext<CR>", opts)

-- Toggle line wrapping
vim.keymap.set("n", "<leader>lw", "<cmd>set wrap!<CR>", opts)

-- Keep last yanked when pasting
vim.keymap.set("v", "p", '"_dP', opts)

vim.keymap.set("n", "<leader>p", '<cmd>lua require("cmp").setup { enabled = true }<cr>', { desc = "Enable completion" })
vim.keymap.set(
  "n",
  "<leader>P",
  '<cmd>lua require("cmp").setup { enabled = false }<cr>',
  { desc = "Disable completion" }
)

-- map esc to jk for laptop use
-- vim.keymap.set("i", "jk", "<Esc>", { desc = "Escape jk" })

-- insert the date in my desired configuration
vim.keymap.set("n", "<leader>d", "<cmd>r!gendate<cr>", { desc = "Insert date" })
vim.keymap.set("n", "<leader>h1", "<cmd>r!gendate h 1<cr>", { desc = "Insert date h1" })
vim.keymap.set("n", "<leader>h2", "<cmd>r!gendate h 2<cr>", { desc = "Insert date h2" })

-- lsp
vim.keymap.set("n", "<leader>S", "<cmd>LspStop<CR>", { desc = "LspStop" })

-- surrounding words
vim.keymap.set("n", "<leader>wsq", 'ciw""<Esc>P', { desc = "Word Surround Quotes" })

-- replaces
vim.keymap.set("n", "<leader>rbs", "<cmd>%s/\\//g<CR>", { desc = "Replace Backward Slash" })

-- telescope symbols
vim.keymap.set("n", "<leader>fs", "<cmd>Telescope symbols<cr>", { desc = "Find Symbols" })

-- convert Current line to title cases
vim.keymap.set(
  "n",
  "<leader>rlt",
  "<cmd>lua require('textcase').current_word('to_title_case')<CR>",
  { desc = "Replace Line Title" }
)
-- vim.keymap.set("n", "<leader>rlt", "<cmd>s/<./\u&/g<cr>", { desc = "Replace Line Title" })

-- these keep the cursor in the middle when scrolling with ctrl d and u
-- from https://github.com/ThePrimeagen/init.lua
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- and these are for searching
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- nvim go related
vim.keymap.set("n", "<leader>gt", "<cmd>GoTest<CR>", { desc = "Go Test" })

-- quit file
vim.keymap.set("n", "<C-q>", "<cmd> q <CR>", opts)

-- show full error
vim.keymap.set("n", "<leader>se", vim.diagnostic.open_float, { desc = "Show Full Error" })

-- copy error
vim.keymap.set("n", "<leader>ce", function()
  local diagnostics = vim.diagnostic.get(0, { lnum = vim.fn.line(".") - 1 })
  if #diagnostics > 0 then
    local message = diagnostics[1].message
    vim.fn.setreg("+", message)
    print("Copied diagnostic: " .. message)
  else
    print("No diagnostic at cursor")
  end
end, { noremap = true, silent = true, desc = "Copy the error message" })

-- go to errors in a file :/
vim.keymap.set("n", "<leader>ne", vim.diagnostic.goto_next, { desc = "Jump to next error" }) -- next err
vim.keymap.set("n", "<leader>pe", vim.diagnostic.goto_prev, { desc = "Jump to previous error" }) -- previous err

-- move selected lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- aider plugin
vim.api.nvim_set_keymap("n", "<leader>ao", ":AiderOpen<CR>", { noremap = true, silent = true, desc = "Open Aider" })
vim.api.nvim_set_keymap(
  "n",
  "<leader>am",
  ":AiderAddModifiedFiles<CR>",
  { noremap = true, silent = true, desc = "Add modified files Aider" }
)

-- CodeCompanion plugin
vim.api.nvim_set_keymap(
  "n",
  "<leader>ac",
  ":CodeCompanionChat Toggle<CR>",
  { noremap = true, silent = true, desc = "Open CodeCompanion Chat" }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>al",
  ":CodeCompanionActions<CR>",
  { noremap = true, silent = true, desc = "Open CodeCompanion Action Palette" }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>ap",
  ":CodeCompanion<CR>",
  { noremap = true, silent = true, desc = "Open CodeCompanion Prompt" }
)
