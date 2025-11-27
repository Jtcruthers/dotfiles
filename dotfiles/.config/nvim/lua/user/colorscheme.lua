local colorscheme = 'everforest'
vim.opt.termguicolors = true

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found")
  return
end

if colorscheme == 'catppuccin' then
  print("hey")
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
elseif colorscheme == 'everforest' then
  vim.o.background = dark
  local status_ok, everforest = pcall(require, "everforest")
  if not status_ok then
    return
  end
end
