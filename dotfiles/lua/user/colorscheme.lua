local colorscheme = 'catppuccin'

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found")
  return
end

local status_ok, catppuccin = pcall(require, "catppuccin")
if not status_ok then
  return
end

catppuccin.setup {
  flavor = "mocha",
  integrations = {
    alpha = true,
    cmp = true,
    gitsigns = true,
    treesitter = true,
    telescope = {
      enabled = true,
    }
  }
}
