--==============================================================================
--                              Section : Plugins                                
--==============================================================================

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
end)

-----------------------------    Plugins install    ----------------------------

-- Plugins config

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

--==============================================================================
--                         Section : personnal maps
--==============================================================================

--------------------------------    Mapleader    -------------------------------
local mapleader = "-"

--==============================================================================
--                              Section : Vim appearance
--==============================================================================

---------------------------------    Others    ---------------------------------

-- Remove the second bottom line, which become useless with the fancy one
vim.opt.showmode = false
vim.opt.laststatus = 2

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

-- Colon at 80 chars
-- set colorcolumn=81
-- highlight ColorColumn ctermbg=darkgray guibg=darkgrey
-- set textwidth=0

-- Show first occurence when search
vim.opt.incsearch = true

-- Disable hlsearch
vim.opt.hlsearch = false

-- Usefull to know where the cursor is
-- set cursorline

--==============================================================================
--                             Section : Others
--==============================================================================

-- Vi no compatible
-- set nocompatible

-- Directory tree
-- let g:netrw_liststyle = 3
-- let g:netrw_banner = 0

-- Enabling :E shortcut by removing useless :ELP
-- let g:loaded_logipat = 1

-- Commands autocomplete like bash
vim.opt.wildmode = { 'longest', 'list' } 
vim.opt.wildmenu = true

-- remove dellay when go back to normal mode
-- set ttimeoutlen=10

