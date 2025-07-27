return {
  "yetone/avante.nvim",
  build = "make",
  event = "VeryLazy",
  version = false, -- 永远不要将此值设置为 "*"！永远不要！
  opts = {
    provider = "moonshot",
    providers = {
      -- claude = {
      --   endpoint = "https://api.anthropic.com",
      --   model = "claude-sonnet-4-20250514",
      --   timeout = 30000, -- Timeout in milliseconds
      --   extra_request_body = {
      --     temperature = 0.75,
      --     max_tokens = 20480,
      --   },
      -- },
      moonshot = {
        endpoint = "https://api.moonshot.cn/v1",
        model = "kimi-k2-0711-preview",
        timeout = 30000, -- 超时时间（毫秒）
        extra_request_body = {
          temperature = 0.75,
          max_tokens = 32768,
        },
      },
    },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
  },
}
