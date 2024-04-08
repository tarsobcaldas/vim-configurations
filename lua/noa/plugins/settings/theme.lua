---@diagnostic disable: missing-fields
local lualine    = require('lualine')
local tsconfig   = require("nvim-treesitter.configs")
local tsinstall  = require('nvim-treesitter.install')
local tsrainbow  = require('ts-rainbow')
local bufferline = require('bufferline')
local tokyonight = require("tokyonight")

tokyonight.setup {
  style = "night"
}

local default_colorscheme = tokyonight

default_colorscheme.load()

lualine.setup {
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch', 'diff' },
    lualine_c = { 'filename', 'lsp_progress' },
    lualine_x = {
      { 'diagnostics', sources = { 'nvim_diagnostic', 'ale' } },
      'copilot', 'encoding', 'fileformat', 'filetype'
    },
    lualine_y = { 'progress' },
    lualine_z = { 'location' }
  },
}

bufferline.setup {
  options = {
    separator_style = "slant",
  }
}

tsinstall.compilers = { "gcc" }
tsconfig.setup({
  ensure_installed = {
    "latex", "bibtex", "markdown", "c", "lua", "vim", "cpp", "perl", "yaml", "todotxt",
    "html", "json", "make", "python", "regex", "bash", "haskell"
  },
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
  playground = {
    enable = true,
    disable = {},
    updatetime = 25,         -- Debounced time for highlighting nodes in the playground from source code
    persist_queries = false, -- Whether the query persists across vim sessions
    keybindings = {
      toggle_query_editor = "o",
      toggle_hl_groups = "i",
      toggle_injected_languages = "t",
      toggle_anonymous_nodes = "a",
      toggle_language_display = "I",
      focus_language = "f",
      unfocus_language = "F",
      update = "R",
      goto_node = "<cr>",
      show_help = "?",
    },
  },
  textobjects = {
    select = {
      enable = true,

      lookahead = true,

      keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
        ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
      },
      selection_modes = {
        ['@parameter.outer'] = 'v', -- charwise
        ['@function.outer'] = 'V',  -- linewise
        ['@class.outer'] = '<c-v>', -- blockwise
      },
      include_surrounding_whitespace = true,
    },
  },
  rainbow = {
    enable = true,
    query = 'rainbow-parens',
    -- Highlight the entire buffer all at once
    strategy = tsrainbow.strategy.global,
    -- hlgroups = kanagawa_dragon_rainbow
  }
})
