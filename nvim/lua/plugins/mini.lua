return {
  {
    'echasnovski/mini.ai',
    version = false ,
    config = function ()
    require('mini.ai').setup({})
    end
  },
  {
    'echasnovski/mini.pairs',
    version = false ,
    config = function ()
      require('mini.pairs').setup()
    end
  }
}

