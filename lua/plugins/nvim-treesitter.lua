return
{
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ':TSUpdate',
  branch = 'main',
  config = function()
    local nvim_treesitter = require "nvim-treesitter"

    local install_dir = vim.fn.stdpath('data') .. '/site'

    if not string.find(vim.o.runtimepath, install_dir, 1, true) then
    vim.opt.runtimepath:append(install_dir)
    end

    nvim_treesitter.setup({
        install_dir = install_dir
    })

    local ensure_installed = {
        'c',
        'cpp',
        'c_sharp',
        'rust',
        'javascript',
        'typescript',
        'python',
        'lua'
    }
    
    for _, parser in ipairs(ensure_installed) do
      if not pcall(vim.treesitter.language.inspect, parser) then
        nvim_treesitter.install(parser)
      end
    end

    vim.api.nvim_create_autocmd("FileType", {
        callback = function(args)
            local ft = vim.bo[args.buf].filetype

            local ok, lang = pcall(vim.treesitter.language.get_lang, ft)
            if not ok or not lang then
                return
            end

            if not pcall(vim.treesitter.language.inspect, lang) then
                return
            end

            vim.treesitter.start(args.buf, lang)
        end,
    })

  end,
}