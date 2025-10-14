return {
  "mbbill/undotree",
  config = function()
    vim.keymap.set("n", "<leader>tu", vim.cmd.UndotreeToggle, { desc = "Toggle UndoTree" })
    vim.keymap.set("n", "<leader>fu", vim.cmd.UndotreeFocus, { desc = "Focus UndoTree" })
  end,
}
