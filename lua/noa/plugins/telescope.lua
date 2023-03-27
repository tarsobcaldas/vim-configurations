local actions = require('telescope.actions')
local telescope = require('telescope')
local previewers = require("telescope.previewers")

-- Dropdown list theme using a builtin theme definitions :
local center_list = require "telescope.themes".get_dropdown({
  winblend = 10,
  width = 0.5,
  prompt = " ",
  results_height = 15,
  previewer = false,
})


telescope.setup {
  defaults = {
    prompt_prefix = " >",
    color_devicons = true,
    layout_config = { prompt_position = "top" },
    sorting_strategy = "ascending",
    highlight = { enable = true },
    preview = { treesitter = "true" },
    file_previewer = previewers.vim_buffer_cat.new,
    grep_previewer = previewers.vim_buffer_vimgrep.new,
    qflist_previewer = previewers.vim_buffer_qflist.new,
  },
  pickers = {
    buffers = {
      mappings = {
        i = {
          ["<C-x>"] = actions.delete_buffer,
          ["<C-s>"] = actions.select_horizontal,
        },
        n = {
          ["x"] = actions.delete_buffer,
        },
      },
    },
    colorscheme = {
      enable_preview = true
    },
  },

  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_dropdown {},
    },
    file_browser = {
      theme = "ivy",
      filetypes = {"png", "jpg", "mp4", "webm", "pdf"}
    },
    media_files = {
      find_cmd = "rg"
    },
    project = {
      theme = "dropdown"
      -- display_type = "minimal",
      -- layout_config = { center_list },
      -- enable_preview = true
    }
  }
}

telescope.load_extension('gh')
telescope.load_extension('packer')
telescope.load_extension('project')
telescope.load_extension('arecibo')
telescope.load_extension('ui-select')
telescope.load_extension('media_files')
telescope.load_extension('file_browser')
telescope.load_extension('file_browser')
