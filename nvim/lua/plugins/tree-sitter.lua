return {
    "nvim-treesitter/nvim-treesitter", 
    build = ":TSUpdate",
    event = { "VeryLazy" },
    cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
    opts = {
        ensure_installed = {
            "lua",
            "luadoc",
        } 
    }
}
