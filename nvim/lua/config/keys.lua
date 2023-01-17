local utils = require("utils")

local function clear()
  vim.cmd("nohlsearch")
  vim.lsp.buf.clear_references()
  utils.if_has("notify", function(notify)
    notify.dismiss()
  end)
  utils.if_has("hlslens.main", function(hlslens)
    hlslens.stop()
  end)
end

local opts = { remap = false, silent = true }
-- window naviagtion
vim.keymap.set("n", "<c-k>", "<c-w>k", opts)
vim.keymap.set("n", "<c-j>", "<c-w>j", opts)
vim.keymap.set("n", "<c-h>", "<c-w>h", opts)
vim.keymap.set("n", "<c-l>", "<c-w>l", opts)

-- window resize
vim.keymap.set("n", "<s-up>", "<cmd>resize +2<cr>", opts)
vim.keymap.set("n", "<s-down>", "<cmd>resize -2<cr>", opts)
vim.keymap.set("n", "<s-left>", "<cmd>vertical resize -2<cr>", opts)
vim.keymap.set("n", "<s-right>", "<cmd>vertical resize +2<cr>", opts)

-- quickfix
vim.keymap.set("n", "<up>", ":copen<cr>", opts)
vim.keymap.set("n", "<down>", ":cclose<cr>", opts)
vim.keymap.set("n", "]b", ":cnext<cr>", opts)
vim.keymap.set("n", "[b", ":cprevious<cr>", opts)

-- move lines
vim.keymap.set("n", "∆", ":m .+1<cr>==", opts)
vim.keymap.set("v", "∆", ":m '>+1<cr>gv=gv", opts)
vim.keymap.set("i", "∆", "<esc>:m .+1<cr>==gi", opts)
vim.keymap.set("n", "˚", ":m .-2<cr>==", opts)
vim.keymap.set("v", "˚", ":m '<-2<cr>gv=gv", opts)
vim.keymap.set("i", "˚", "<esc>:m .-2<cr>==gi", opts)

-- jump buffers
vim.keymap.set("n", "]b", ":bn<cr>", opts)
vim.keymap.set("n", "[b", ":bp<cr>", opts)

-- jump list
vim.keymap.set("n", "]j", "<c-i>", opts)
vim.keymap.set("n", "[j", "<c-o>", opts)

-- page up/down
vim.keymap.set("n", "]p", "<pagedown>", opts)
vim.keymap.set("n", "[p", "<pageup>", opts)

-- esc setting
vim.keymap.set("n", "<esc>", clear, opts)
-- vim.keymap.set("i", "<esc>", "", opts)
vim.keymap.set("t", "<esc>", [[<c-\><c-n>]], opts)
vim.keymap.set("t", "jk", [[<c-\><c-n>]], opts)

-- add undo break
vim.keymap.set("i", ",", ",<c-g>u", opts)
vim.keymap.set("i", ".", ".<c-g>u", opts)
vim.keymap.set("i", ";", ";<c-g>u", opts)

-- better indent
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)
vim.keymap.set("n", "<c-c>", "<esc>ciw", opts)
vim.keymap.set("n", "0", [[getline('.')[0 : col('.') - 2] =~# '^\\s\\+$' ? '0' : '^']], { expr = true })
vim.keymap.set({ "n", "x" }, "j", [[(v:count > 1 ? 'm`' . v:count : '') . 'gj']], { expr = true })
vim.keymap.set({ "n", "x" }, "k", [[(v:count > 1 ? 'm`' . v:count : '') . 'gk']], { expr = true })

vim.keymap.set("c", "<c-t>", [[<c-r>=expand("%:p:h")<cr>/]], { silent = false })
vim.keymap.set("c", "<c-b>", "<left>", { silent = false })
vim.keymap.set("c", "<c-f>", "<right>", { silent = false })

vim.keymap.set("i", "<c-b>", "<esc>^i", { desc = "begin of line" })
vim.keymap.set("i", "<c-e>", "<end>", { desc = "end of line" })
vim.keymap.set("i", "<c-o>", "<esc>o", { desc = "next line" })
vim.keymap.set("i", "<c-s-o>", "<esc>O", { desc = "prev line" })

vim.keymap.set("i", "<c-h>", "<left>", { desc = "move left" })
vim.keymap.set("i", "<c-j>", "<down>", { desc = "move down" })
vim.keymap.set("i", "<c-k>", "<up>", { desc = "move up" })
vim.keymap.set("i", "<c-l>", "<right>", { desc = "move right" })

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
