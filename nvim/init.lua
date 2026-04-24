vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- ╭──────────────────────────────────────────────╮
-- │ Options                                      │
-- ╰──────────────────────────────────────────────╯

vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.updatetime = 300
vim.opt.timeoutlen = 500
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"
vim.opt.laststatus = 3
vim.opt.winborder = "rounded"
vim.opt.undofile = true
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.signcolumn = "yes"
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
vim.opt.inccommand = "split"
vim.opt.cursorline = true
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.breakindent = true
vim.opt.wrap = false
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.textwidth = 80

-- ╭──────────────────────────────────────────────╮
-- │ Keymaps                                      │
-- ╰──────────────────────────────────────────────╯

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

keymap("n", "<leader>r", ":source %<CR>", opts)
keymap("n", "S", ":silent w<CR>", opts)
keymap("n", "Q", ":q<CR>", opts)
keymap("n", "s", "<NOP>", opts)
keymap("n", ";", ":", { noremap = true })
keymap("n", "j", "gj", opts)
keymap("n", "k", "gk", opts)
keymap({ "n", "v" }, "J", "5gj", opts)
keymap({ "n", "v" }, "K", "5gk", opts)
keymap({ "n", "v" }, "H", "0", opts)
keymap({ "n", "v" }, "L", "$", opts)
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
keymap("n", "<leader>sv", "<C-w>v", opts)
keymap("n", "<leader>sh", "<C-w>s", opts)
keymap("n", "<leader>se", "<C-w>=", opts)
keymap("n", "<leader>sx", "<cmd>close<CR>", opts)
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)
keymap("i", "jk", "<ESC>", opts)
keymap("n", "<M-a>", "gg<S-v>G", opts)
keymap("x", "<leader>p", [["_dP]], opts)
keymap("n", "-", "<cmd>bp<CR>", opts)
keymap("n", "=", "<cmd>bn<CR>", opts)

-- ╭──────────────────────────────────────────────╮
-- │ Treesitter                                   │
-- ╰──────────────────────────────────────────────╯

vim.pack.add({ "https://github.com/nvim-treesitter/nvim-treesitter" }, { confirm = false })

vim.api.nvim_create_autocmd("FileType", {
  desc = "Start Treesitter highlighting when a parser is available",
  callback = function(args)
    if vim.bo[args.buf].buftype ~= "" then
      return
    end
    pcall(vim.treesitter.start, args.buf)
  end,
})

-- ╭──────────────────────────────────────────────╮
-- │ Completion (blink.cmp)                       │
-- ╰──────────────────────────────────────────────╯

vim.pack.add({ "https://github.com/saghen/blink.cmp" }, { confirm = false })
require("blink.cmp").setup({
  keymap = {
    preset = "default",
    ["<CR>"] = { "accept", "fallback" },
  },
  appearance = {
    nerd_font_variant = "mono",
  },
  completion = {
    documentation = { auto_show = true },
    menu = {
      draw = {
        columns = {
          { "label",      "label_description", gap = 1 },
          { "kind_icon",  "kind",              gap = 1 },
          { "source_name" },
        },
      },
    },
  },
  sources = {
    default = { "lsp", "path", "snippets", "buffer" },
  },
  fuzzy = {
    implementation = "prefer_rust_with_warning",
  },
})

-- ╭──────────────────────────────────────────────╮
-- │ LSP                                          │
-- ╰──────────────────────────────────────────────╯

vim.pack.add({
  "https://github.com/neovim/nvim-lspconfig",
  "https://github.com/mason-org/mason.nvim",
}, { confirm = false })

require("mason").setup()

-- diagnostic config
vim.diagnostic.config({
  underline = true,
  virtual_text = false,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "✘",
      [vim.diagnostic.severity.WARN]  = "▲",
      [vim.diagnostic.severity.HINT]  = "⚑",
      [vim.diagnostic.severity.INFO]  = "»",
    },
  },
  update_in_insert = false,
  severity_sort = true,
  float = {
    border = "rounded",
    source = "if_many",
    header = "",
    prefix = "",
  },
})

-- show diagnostics on hover
vim.api.nvim_create_autocmd("CursorHold", {
  callback = function()
    vim.diagnostic.open_float({
      focusable = false,
      close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
      border = "rounded",
      source = "if_many",
      prefix = "",
    })
  end,
})

-- lsp keymaps (set on attach)
vim.api.nvim_create_autocmd("LspAttach", {
  desc = "LSP actions",
  callback = function(event)
    local buf_opts = { buffer = event.buf, noremap = true, silent = true }
    vim.keymap.set("n", "<leader>k", vim.lsp.buf.hover, buf_opts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, buf_opts)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, buf_opts)
    vim.keymap.set("n", "<leader>f", function()
      vim.lsp.buf.format({ async = true })
    end, buf_opts)
    vim.keymap.set("n", "grd", vim.lsp.buf.definition,
      { buffer = event.buf, desc = "vim.lsp.buf.definition()" })
    vim.keymap.set("n", "grf", vim.lsp.buf.format,
      { buffer = event.buf, desc = "vim.lsp.buf.format()" })
    vim.keymap.set("n", "<leader>ih", function()
      vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }), { bufnr = event.buf })
    end, { buffer = event.buf, desc = "Toggle Inlay Hints" })
    vim.lsp.inlay_hint.enable(false, { bufnr = event.buf })
  end,
})

-- --- servers ---

vim.lsp.config("lua_ls", {
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
  root_markers = { ".luarc.json", ".luarc.jsonc", ".luacheckrc", ".stylua.toml", "stylua.toml", ".git" },
  settings = {
    Lua = {
      runtime = { version = "LuaJIT" },
      diagnostics = { globals = { "vim" } },
      workspace = {
        checkThirdParty = false,
        library = { vim.env.VIMRUNTIME },
      },
      completion = { callSnippet = "Replace" },
    },
  },
})
vim.lsp.enable("lua_ls")

vim.lsp.config("ts_ls", {
  cmd = { "typescript-language-server", "--stdio" },
  filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
  root_markers = { "package.json", "tsconfig.json", "jsconfig.json", ".git" },
  init_options = {
    preferences = {
      includeInlayParameterNameHints = "all",
      includeInlayFunctionParameterTypeHints = true,
      includeInlayVariableTypeHints = true,
      includeInlayVariableTypeHintsWhenTypeMatchesName = false,
      includeInlayPropertyDeclarationTypeHints = true,
      includeInlayEnumMemberValueHints = true,
    },
  },
})
vim.lsp.enable("ts_ls")

vim.lsp.config("eslint", {
  cmd = { "vscode-eslint-language-server", "--stdio" },
  filetypes = {
    "javascript", "javascriptreact", "javascript.jsx",
    "typescript", "typescriptreact", "typescript.tsx",
    "vue", "svelte", "astro", "htmlangular",
  },
  root_markers = {
    ".eslintrc", ".eslintrc.js", ".eslintrc.cjs",
    ".eslintrc.yaml", ".eslintrc.yml", ".eslintrc.json",
    "eslint.config.js", "eslint.config.mjs", "eslint.config.cjs",
    "eslint.config.ts", "eslint.config.mts", "eslint.config.cts",
  },
})
vim.lsp.enable("eslint")

vim.lsp.config("gopls", {
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_markers = { "go.work", "go.mod", ".git" },
  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
      analyses = { unusedparams = true },
      hints = {
        assignVariableTypes = true,
        compositeLiteralFields = true,
        compositeLiteralTypes = true,
        constantValues = true,
        functionTypeParameters = true,
        parameterNames = true,
        rangeVariableTypes = true,
      },
    },
  },
})
vim.lsp.enable("gopls")

vim.lsp.config("html", {
  cmd = { "vscode-html-language-server", "--stdio" },
  filetypes = { "html" },
  root_markers = { "package.json", ".git" },
  init_options = {
    configurationSection = { "html", "css", "javascript" },
    embeddedLanguages = { css = true, javascript = true },
    provideFormatter = true,
  },
})
vim.lsp.enable("html")

vim.lsp.config("cssls", {
  cmd = { "vscode-css-language-server", "--stdio" },
  filetypes = { "css", "scss", "less" },
  root_markers = { "package.json", ".git" },
  settings = {
    css = { validate = true },
    less = { validate = true },
    scss = { validate = true },
  },
})
vim.lsp.enable("cssls")

vim.lsp.config("jsonls", {
  cmd = { "vscode-json-language-server", "--stdio" },
  filetypes = { "json", "jsonc" },
  root_markers = { "package.json", ".git" },
  init_options = { provideFormatter = true },
})
vim.lsp.enable("jsonls")

vim.lsp.config("tailwindcss", {
  cmd = { "tailwindcss-language-server", "--stdio" },
  filetypes = {
    "html", "css", "scss", "less", "javascript", "javascriptreact",
    "typescript", "typescriptreact", "vue", "svelte", "astro",
    "markdown", "mdx", "handlebars", "hbs",
  },
  root_markers = {
    "tailwind.config.js", "tailwind.config.cjs", "tailwind.config.mjs",
    "tailwind.config.ts", "postcss.config.js", "postcss.config.cjs",
    "postcss.config.mjs", "postcss.config.ts", "package.json", ".git",
  },
})
vim.lsp.enable("tailwindcss")

vim.lsp.config("marksman", {
  cmd = { "marksman", "server" },
  root_markers = { ".marksman.toml", ".git" },
  filetypes = { "markdown", "markdown.mdx" },
  single_file_support = true,
})
vim.lsp.enable("marksman")

vim.lsp.config("astro", {
  cmd = { "astro-ls", "--stdio" },
  filetypes = { "astro" },
  root_markers = { "package.json", "tsconfig.json", "jsconfig.json", ".git" },
})
vim.lsp.enable("astro")

-- ╭──────────────────────────────────────────────╮
-- │ UI & Navigation (Snacks)                     │
-- ╰──────────────────────────────────────────────╯

vim.pack.add({ "https://github.com/nvim-tree/nvim-web-devicons" }, { confirm = false })
require("nvim-web-devicons").setup({
  default = true,
  strict = true,
  override_by_filename = {
    [".env"] = {
      icon = "󰒓",
      color = "#F1E05A",
      name = "Env",
    },
    ["Dockerfile"] = {
      icon = "󰡨",
      color = "#458EE6",
      name = "Dockerfile",
    },
  },
  override_by_extension = {
    env = {
      icon = "󰒓",
      color = "#F1E05A",
      name = "Env",
    },
    toml = {
      icon = "",
      color = "#6D8086",
      name = "Toml",
    },
  },
})

vim.pack.add({ "https://github.com/folke/snacks.nvim" }, { confirm = false })
require("snacks").setup({
  explorer = { enabled = true },
  indent = { enabled = true },
  picker = {
    enabled = true,
    sources = {
      explorer = {
        auto_close = true,
        layout = {
          layout = {
            position = "right",
          },
        },
      },
    },
  },
})

vim.keymap.set("n", "<leader>ff", function() Snacks.picker.smart() end, { desc = "Smart Find Files" })
vim.keymap.set("n", "<leader>,", function() Snacks.picker.buffers() end, { desc = "Buffers" })
vim.keymap.set("n", "<leader>/", function() Snacks.picker.grep() end, { desc = "Grep" })
vim.keymap.set("n", "<leader>e", function() Snacks.explorer() end, { desc = "File Explorer" })
vim.keymap.set("n", "<leader>fb", function() Snacks.picker.buffers() end, { desc = "Buffers" })
vim.keymap.set("n", "<leader><leader>", function() Snacks.picker.files() end, { desc = "Find Files" })
vim.keymap.set("n", "<leader>fr", function() Snacks.picker.recent() end, { desc = "Recent" })
vim.keymap.set("n", "<leader>sh", function() Snacks.picker.help() end, { desc = "Help Pages" })
vim.keymap.set("n", "<leader>sk", function() Snacks.picker.keymaps() end, { desc = "Keymaps" })
vim.keymap.set("n", "<leader>la", function() Snacks.lazygit() end, { desc = "Lazygit" })
vim.keymap.set("n", "<leader>lh", function() Snacks.picker.highlights() end, { desc = "Search Highlight" })
vim.keymap.set("n", "gd", function() Snacks.picker.lsp_definitions() end, { desc = "Goto Definition" })
vim.keymap.set("n", "gD", function() Snacks.picker.lsp_declarations() end, { desc = "Goto Declaration" })
vim.keymap.set("n", "gi", function() Snacks.picker.lsp_implementations() end, { desc = "Goto Implementation" })
vim.keymap.set("n", "gr", function() Snacks.picker.lsp_references() end, { nowait = true, desc = "References" })
vim.keymap.set("n", "go", function() Snacks.picker.lsp_type_definitions() end, { desc = "Goto Type Definition" })
vim.keymap.set("n", "<leader>fw", function() Snacks.picker.grep({ search = vim.fn.expand("<cword>") }) end,
  { desc = "Find Word" })

-- ╭──────────────────────────────────────────────╮
-- │ Statusline                                   │
-- ╰──────────────────────────────────────────────╯

function _G.custom_statusline()
  local diag_severities = {
    [vim.diagnostic.severity.ERROR] = "✘",
    [vim.diagnostic.severity.WARN]  = "▲",
    [vim.diagnostic.severity.HINT]  = "⚑",
    [vim.diagnostic.severity.INFO]  = "»",
  }

  local parts = {}

  -- filename
  local fname = vim.fn.expand("%:t")
  if fname == "" then fname = "[No Name]" end
  local mod = vim.bo.modified and " ●" or ""
  local ro = vim.bo.readonly and " 🔒" or ""
  table.insert(parts, "%#StatusLine# " .. fname .. mod .. ro .. " ")

  -- filetype
  local ft = vim.bo.filetype
  if ft ~= "" then
    table.insert(parts, "%#StatusLineNC# " .. ft .. " ")
  end

  -- diagnostics count
  local diags = vim.diagnostic.get(0)
  if #diags > 0 then
    local counts = {}
    for _, s in ipairs({ 1, 2, 3, 4 }) do
      local n = #vim.tbl_filter(function(d) return d.severity == s end, diags)
      if n > 0 then
        table.insert(counts, diag_severities[s] .. n)
      end
    end
    table.insert(parts, "%#DiagnosticWarn# " .. table.concat(counts, " ") .. " ")
  end

  -- separator (push right section to the end)
  table.insert(parts, "%=")

  -- right section: cwd
  local cwd = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
  table.insert(parts, "%#StatusLineNC# " .. cwd .. " ")

  -- line:col
  local cursor = vim.api.nvim_win_get_cursor(0)
  table.insert(parts, "%#StatusLine# " .. cursor[1] .. ":" .. (cursor[2] + 1) .. " ")

  return table.concat(parts)
end

vim.o.statusline = "%!v:lua.custom_statusline()"

-- ╭──────────────────────────────────────────────╮
-- │ Bufferline                                   │
-- ╰──────────────────────────────────────────────╯

vim.o.showtabline = 2

function _G.custom_bufferline()
  local line = ""
  local bufs = vim.fn.getbufinfo({ buflisted = 1 })
  local cur = vim.api.nvim_get_current_buf()
  local devicons_ok, devicons = pcall(require, "nvim-web-devicons")

  for _, b in ipairs(bufs) do
    local name = vim.fn.fnamemodify(b.name, ":t")
    if name == "" then name = "[No Name]" end
    local ext = vim.fn.fnamemodify(b.name, ":e")
    local mod = vim.bo[b.bufnr].modified and " ●" or ""

    local icon = ""
    if devicons_ok then
      local ic = devicons.get_icon(name, ext, { default = true })
      icon = ic and ic .. " " or ""
    end

    if b.bufnr == cur then
      line = line .. "%#TabLineSel# " .. icon .. name .. mod .. " "
    else
      line = line .. "%#TabLine# " .. icon .. name .. mod .. " "
    end
  end

  return line .. "%#TabLineFill#"
end

vim.o.tabline = "%!v:lua.custom_bufferline()"

keymap("n", "<leader>bd", "<cmd>bdelete<CR>", vim.tbl_extend("force", opts, { desc = "Delete Buffer" }))
keymap("n", "<leader>bo", "<cmd>%bdelete|edit #<CR>", vim.tbl_extend("force", opts, { desc = "Close Other Buffers" }))

-- ╭──────────────────────────────────────────────╮
-- │ Editing                                      │
-- ╰──────────────────────────────────────────────╯

vim.pack.add({ "https://github.com/folke/flash.nvim" }, { confirm = false })
vim.keymap.set({ "n", "x", "o" }, "\\", function() require("flash").jump() end, { desc = "Flash" })

vim.pack.add({ "https://github.com/echasnovski/mini.pairs" }, { confirm = false })
require("mini.pairs").setup()

vim.pack.add({ "https://github.com/windwp/nvim-ts-autotag" }, { confirm = false })
require("nvim-ts-autotag").setup({})

vim.pack.add({ "https://github.com/folke/todo-comments.nvim" }, { confirm = false })
require("todo-comments").setup({})

vim.pack.add({ "https://github.com/ray-x/go.nvim" }, { confirm = false })
require("go").setup({})
local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
    require("go.format").goimports()
  end,
  group = format_sync_grp,
})

-- ╭──────────────────────────────────────────────╮
-- │ Utilities                                    │
-- ╰──────────────────────────────────────────────╯

local function color_debug()
  local pos = vim.inspect_pos(0, nil, nil, { extmarks = "all" })
  local cursor = vim.api.nvim_win_get_cursor(0)
  local file = vim.fn.expand("%:.")
  local buf = vim.api.nvim_get_current_buf()
  local ft = vim.bo[buf].filetype
  local ts_active = vim.treesitter.highlighter.active[buf] ~= nil
  local parser_ok = pcall(vim.treesitter.get_parser, buf)

  local lines = {
    string.format("Color debug: %s:%d:%d", file, cursor[1], cursor[2] + 1),
    string.format("filetype: %s", ft ~= "" and ft or "(none)"),
    string.format("treesitter active: %s", ts_active and "yes" or "no"),
    string.format("treesitter parser: %s", parser_ok and "yes" or "no"),
    "",
  }

  local seen = {}
  local ordered_groups = {}

  local function record_group(name)
    if not name or name == "" or seen[name] then
      return
    end
    seen[name] = true
    table.insert(ordered_groups, name)
  end

  local function append_section(title, items, render)
    if #items == 0 then
      return
    end
    table.insert(lines, title .. ":")
    for _, item in ipairs(items) do
      render(item)
    end
    table.insert(lines, "")
  end

  local function append_group(prefix, group, link, detail)
    table.insert(lines, string.format("  - %s", prefix))
    table.insert(lines, string.format("    group: %s", group))
    if link and link ~= "" and link ~= group then
      table.insert(lines, string.format("    links to: %s", link))
      record_group(link)
    end
    if detail then
      table.insert(lines, string.format("    %s", detail))
    end
    record_group(group)
  end

  append_section("Treesitter", pos.treesitter, function(item)
    local priority = item.metadata.priority
        or (item.metadata[item.id] and item.metadata[item.id].priority)
        or vim.hl.priorities.treesitter
    append_group(
      string.format("@%s (%s)", item.capture, item.lang),
      item.hl_group,
      item.hl_group_link,
      string.format("priority: %s", priority)
    )
  end)

  append_section("Semantic tokens", pos.semantic_tokens, function(item)
    append_group(
      item.opts.hl_group,
      item.opts.hl_group,
      item.opts.hl_group_link,
      string.format("priority: %s  ns: %s", item.opts.priority or "?", item.ns)
    )
  end)

  append_section("Syntax", pos.syntax, function(item)
    append_group(item.hl_group, item.hl_group, item.hl_group_link)
  end)

  append_section("Extmarks", pos.extmarks, function(item)
    if item.opts.hl_group then
      append_group(
        item.opts.hl_group,
        item.opts.hl_group,
        item.opts.hl_group_link,
        string.format("priority: %s  ns: %s", item.opts.priority or "?", item.ns)
      )
    else
      table.insert(lines, string.format("  - ns: %s", item.ns))
      if item.opts.end_row or item.opts.end_col then
        table.insert(lines,
          string.format("    range: %d:%d -> %d:%d", item.row + 1, item.col + 1, (item.end_row or item.row) + 1,
            (item.end_col or item.col) + 1))
      end
    end
  end)

  if #ordered_groups == 0 then
    table.insert(lines, "No highlight groups found at cursor.")
  else
    table.insert(lines, "Resolved highlight definitions:")
    for _, group in ipairs(ordered_groups) do
      local ok, result = pcall(vim.api.nvim_exec2, "silent verbose hi " .. group, { output = true })
      table.insert(lines, string.format("  [%s]", group))
      if ok and result.output ~= "" then
        for _, line in ipairs(vim.split(result.output, "\n", { trimempty = true })) do
          table.insert(lines, "    " .. line)
        end
      else
        table.insert(lines, "    unable to resolve with :verbose hi")
      end
      table.insert(lines, "")
    end
  end

  vim.cmd("botright new")
  local report_buf = vim.api.nvim_get_current_buf()
  vim.bo[report_buf].buftype = "nofile"
  vim.bo[report_buf].bufhidden = "wipe"
  vim.bo[report_buf].swapfile = false
  vim.bo[report_buf].modifiable = true
  vim.bo[report_buf].filetype = "text"
  vim.api.nvim_buf_set_name(report_buf, "color-debug://report")
  vim.api.nvim_buf_set_lines(report_buf, 0, -1, false, lines)
  vim.bo[report_buf].modifiable = false
  vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = report_buf, silent = true })
end

vim.api.nvim_create_user_command("ColorDebug", color_debug, { desc = "Inspect highlight groups at cursor" })
vim.keymap.set("n", "<leader>ld", color_debug, { desc = "Color Debug" })
vim.keymap.set("n", "zS", vim.show_pos, { desc = "Inspect Highlight Stack" })

-- ╭──────────────────────────────────────────────╮
-- │ Colorscheme                                  │
-- ╰──────────────────────────────────────────────╯

vim.cmd("colorscheme custom")

-- uncomment to enable automatic plugin updates
-- vim.pack.update()
