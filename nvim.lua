--==============================================================================
--                              Section : Plugins                                
--==============================================================================

-----------------------------    Plugins install    ----------------------------

local use = require('packer').use
require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Collection of configurations for built-in LSP client
    use 'neovim/nvim-lspconfig'

    -- Autocompletion plugin
    use 'hrsh7th/nvim-cmp'

    -- cmp LSP completion
    use 'hrsh7th/cmp-nvim-lsp'

    -- Display progress info about lsp server
    use 'j-hui/fidget.nvim'

    -- Fuzzy finder
    use 'junegunn/fzf'
end)

-- Plugins config

-- lsp

local cmp = require 'cmp'
cmp.setup {
    sources = {
        { name = 'nvim_lsp' },
        { name = 'buffer' }
    },
    mapping = {
        ['<CR>'] = function(fallback)
            if cmp.visible() then
                cmp.confirm({ select = true })
            else
                fallback()
            end
        end,
        ['<TAB>'] = function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            else
                fallback()
            end
        end,
        ['<S-TAB>'] = function()
            if cmp.visible() then
                cmp.select_prev_item()
            else
                fallback()
            end
        end,
        ['<C-d>'] = cmp.mapping(function() cmp.scroll_docs(4) end, {'i'}),
        ['<C-u>'] = cmp.mapping(function() cmp.scroll_docs(-4) end, {'i'}),
    }
}

local capabilities = require('cmp_nvim_lsp').default_capabilities()

require('lspconfig').rust_analyzer.setup({
    capabilities = capabilities,
})
require('lspconfig').tsserver.setup({
    capabilities = capabilities,
})

require("fidget").setup({})

vim.opt.completeopt = "menuone,noinsert,noselect"

-- Fuzzy finder

vim.env.FZF_DEFAULT_COMMAND = 'rg --files'
vim.keymap.set("n", "gz", ":FZF<CR>")

--==============================================================================
--                         Section : personnal maps
--==============================================================================

--------------------------------    Mapleader    -------------------------------
local mapleader = "-"

--==============================================================================
--                              Section : Vim appearance
--==============================================================================

---------------------------------    Others    ---------------------------------

--==============================================================================
--                             Section : Editor
--==============================================================================

-- Disable mouse
vim.opt.mouse = nil

-- Indentation stuff
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab  = true

-- Indentation
vim.opt.cindent = true

-- Line numbers
vim.opt.number = true

-- Show first occurence when search
vim.opt.incsearch = true

-- Disable hlsearch
vim.opt.hlsearch = false

--==============================================================================
--                             Section : Others
--==============================================================================

-- Vi no compatible
-- set nocompatible

-- Directory tree
vim.g.netrw_liststyle = 3
vim.g.netrw_banner = false

-- Commands autocomplete like bash
vim.opt.wildmode = { 'longest', 'list' } 
vim.opt.wildmenu = true

