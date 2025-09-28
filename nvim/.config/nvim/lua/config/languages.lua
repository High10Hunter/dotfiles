-- set language based on vim mode
-- requires im-select https://github.com/daipeihust/im-select
-- recommend installing it by brew
local is_mac = vim.loop.os_uname().sysname == "Darwin"
if is_mac then
  local function get_current_layout()
    local f = io.popen("im-select")
    local layout = nil
    if f ~= nil then
      layout = f:read("*all"):gsub("\n", "")
      f:close()
    end
    return layout
  end

  -- Save current layout
  local last_insert_layout = get_current_layout()
  local english_layout = "com.apple.keylayout.ABC"

  -- If exit insert mode, in command mode -> eng layout,
  -- save the current layout to the variable, then use it for the
  -- next insert time
  vim.api.nvim_create_autocmd("InsertLeave", {
    callback = function()
      local current = get_current_layout()
      last_insert_layout = current
      os.execute("im-select " .. english_layout)
    end,
  })

  -- mode change to normal -> eng layout
  vim.api.nvim_create_autocmd({ "CmdlineEnter" }, {
    pattern = "*:*n",
    callback = function()
      os.execute("im-select " .. english_layout)
    end,
  })

  -- when back to nvim, restore prev layout
  vim.api.nvim_create_autocmd("InsertEnter", {
    callback = function()
      os.execute("im-select " .. last_insert_layout)
    end,
  })

  vim.api.nvim_create_autocmd({ "FocusGained" }, {
    callback = function()
      os.execute("im-select " .. last_insert_layout)
    end,
  })
end
