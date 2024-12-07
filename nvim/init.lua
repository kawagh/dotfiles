local Plug = vim.fn["plug#"]
vim.call("plug#begin")

Plug("https://github.com/tomasr/molokai")
Plug("https://github.com/catppuccin/nvim")
Plug("https://github.com/junegunn/fzf")
Plug("https://github.com/junegunn/fzf.vim")
Plug("https://github.com/nvim-treesitter/nvim-treesitter")
Plug("https://github.com/machakann/vim-highlightedyank")
Plug("https://github.com/lambdalisue/vim-fern")
Plug("https://github.com/lewis6991/gitsigns.nvim")
Plug("https://github.com/akinsho/bufferline.nvim")
Plug("https://github.com/nvim-tree/nvim-web-devicons")
Plug("https://github.com/iamcco/markdown-preview.nvim")
Plug("https://github.com/mattn/vim-maketable")
Plug("https://github.com/mattn/vim-sonictemplate")
Plug("https://github.com/tpope/vim-surround")
Plug("https://github.com/tpope/vim-commentary")
Plug("https://github.com/tpope/vim-fugitive")
Plug("https://github.com/tpope/vim-rhubarb")
Plug("https://github.com/shumphrey/fugitive-gitlab.vim")
Plug("https://github.com/inside/vim-search-pulse")
Plug("https://github.com/cohama/lexima.vim")
Plug("https://github.com/neovim/nvim-lspconfig")
Plug("https://github.com/williamboman/mason.nvim")
Plug("https://github.com/vim-denops/denops.vim")
Plug("https://github.com/Shougo/ddc.vim")
Plug("https://github.com/Shougo/ddc-ui-native")
Plug("https://github.com/LumaKernel/ddc-source-file")
Plug("https://github.com/delphinus/ddc-source-tmux")
Plug("https://github.com/Shougo/ddc-source-lsp")
Plug("https://github.com/Shougo/ddc-source-around")
Plug("https://github.com/Shougo/ddc-filter-matcher_head")
Plug("https://github.com/Shougo/ddc-filter-sorter_rank")
Plug("https://github.com/matsui54/denops-popup-preview.vim")
Plug("https://github.com/kat0h/bufpreview.vim", { ["do"] = "deno task prepare" })
Plug("https://github.com/ckipp01/stylua-nvim")
Plug("https://github.com/mattn/emmet-vim")
Plug("https://github.com/ethancarlsson/nvim-hurl.nvim")
vim.call("plug#end")

vim.fn["ddc#custom#patch_global"]({
	ui = "native",
	sources = {
		"lsp",
		"file",
		"tmux",
		"around",
	},
	sourceOptions = {
		_ = {
			sorters = { "sorter_rank" },
		},
		lsp = {
			mark = "[LSP]",
			forceCompletionPattern = "\\.\\w*|:\\w*|->\\w*",
		},
		tmux = {
			mark = "[T]",
			forceCompletionPattern = "\\S/\\S*",
			matchers = { "matcher_head" },
		},
		file = {
			mark = "[F]",
			forceCompletionPattern = "\\S/\\S*",
			matchers = { "matcher_head" },
		},
		around = {
			mark = "[A]",
			matchers = { "matcher_head" },
		},
	},
})
vim.fn["ddc#enable"]()
vim.fn["popup_preview#enable"]()

vim.cmd("colorscheme catppuccin")

vim.api.nvim_create_augroup("lua", {})
vim.api.nvim_create_autocmd("BufWritePre", {
	group = "lua",
	pattern = { "*.lua" },
	callback = function()
		require("stylua-nvim").format_file()
	end,
})
vim.opt.number = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.termguicolors = true
vim.opt.clipboard:append("unnamedplus")
vim.opt.laststatus = 0
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.g.mapleader = " "

local function is_inside_git_repository()
	local handle = io.popen("git rev-parse --is-inside-work-tree 2>/dev/null")
	local result = handle:read("*a")
	handle:close()
	return result ~= ""
end

if is_inside_git_repository() then
	vim.keymap.set("n", "<Leader>f", "<cmd>GFiles<CR>", { noremap = true })
else
	vim.keymap.set("n", "<Leader>f", "<cmd>Files<CR>", { noremap = true })
end
vim.keymap.set("n", "<Leader>F", "<cmd>Rg<CR>", { noremap = true })
vim.keymap.set("n", "<Tab>", "<cmd>bnext<CR>", { noremap = true })
vim.keymap.set("n", "<S-Tab>", "<cmd>bprevious<CR>", { noremap = true })
vim.keymap.set("n", "<C-e>", "<cmd>Fern . -drawer -toggle<CR>", { noremap = true })
vim.keymap.set("n", "gd", "<cmd>:lua vim.lsp.buf.definition()<CR>")
vim.keymap.set("n", "gr", "<cmd>:lua vim.lsp.buf.references()<CR>")
vim.keymap.set("n", "K", "<cmd>:lua vim.lsp.buf.hover()<CR>")
vim.keymap.set("n", "L", "<Plug>(fern-action-expand-tree)")

require("bufferline").setup({})
require("gitsigns").setup()
require("mason").setup()
require("lspconfig").pyright.setup({})
require("lspconfig").volar.setup({})
require("lspconfig").ts_ls.setup({})
require("lspconfig").rust_analyzer.setup({})
