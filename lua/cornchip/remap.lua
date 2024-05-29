vim.g.mapleader = " "

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
--vim.keymap.set("n", "<C-m>", vim.cmd.MpvToggle)
vim.keymap.set("i", "<C-s>", function()
    vim.cmd("w")
end)

--[[ Notes: ]]
-- 
-- <C-o> = The next command will run in normal mode, but then swap back to the previous mode (or insert not sure)
--
--[[ End Notes ]]

vim.keymap.set("n", "<C-Del>", "dw")
vim.keymap.set("i", "<C-Del>", "<C-o>dw")

-- "h" in this case represents BS (backspace) which isn't properly sent when you're pressing control.
vim.keymap.set("i", "<C-h>", "<C-o>dvb")

vim.keymap.set("n", "<leader>l", ":LazyGitCurrentFile<CR>")

-- Lists all errors/warnings in the project
vim.keymap.set("n", "<leader>le", ":lua vim.diagnostic.setqflist()<CR>")
