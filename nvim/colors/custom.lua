-- Vitesse Dark theme for Neovim
-- Ported from vscode-theme-vitesse

vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") then
  vim.cmd("syntax reset")
end
vim.g.colors_name = "custom"
vim.o.background = "dark"

-- Vitesse Dark palette
-- Note: VSCode uses 8-digit hex (with alpha), Neovim only supports 6-digit.
-- Alpha values have been approximated as solid colors blended against bg #121212.
local palette = {
  bg           = "#121212",
  bg_float     = "#121212",
  bg_dark      = "#181818",
  bg_darker    = "#191919",
  fg           = "#dbd7ca",
  fg_dim       = "#bfbaaa",
  fg_subtle    = "#959da5",
  fg_muted     = "#6e6d68",
  fg_faint     = "#444440",

  green        = "#4d9375",
  green_dim    = "#80a665",
  green_soft   = "#85e89d",

  red          = "#cb7676",
  red_bright   = "#fdaeb7",

  blue         = "#6394bf",
  blue_bright  = "#79b8ff",

  yellow       = "#e6cc77",
  orange       = "#d4976c",
  brown        = "#c98a7d",
  brown_dark   = "#c4704f",

  cyan         = "#5eaab5",
  teal         = "#4C9A91",
  type_teal    = "#5DA994",

  pink         = "#db889a",
  purple       = "#6872ab",
  lavender     = "#b392f0",

  gold         = "#b8a965",
  gold_dim     = "#5e5432",
  amber        = "#bd976a",
  copper       = "#c99076",

  comment      = "#5a6a5a",
  delimiter    = "#666666",

  border       = "#191919",
  line_bg      = "#181818",
  gutter       = "#444440",
  gutter_active= "#bfbaaa",
  indent       = "#222222",
  indent_active= "#3a3a3a",
  selection    = "#2c2c2c",
  selection_inactive = "#1e1e1e",
  search       = "#35301e",
  search_cur   = "#2d2a1a",
  matchparen   = "#1e3029",
}

local function hl(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

-- ── Base ──────────────────────────────────────────────
hl("Normal",           { fg = palette.fg, bg = palette.bg })
hl("NormalFloat",      { fg = palette.fg, bg = palette.bg_float })
hl("FloatBorder",      { fg = palette.bg_darker, bg = palette.bg_float })
hl("NormalNC",         { fg = palette.fg, bg = palette.bg })
hl("CursorLine",       { bg = palette.line_bg })
hl("CursorColumn",     { bg = palette.line_bg })
hl("ColorColumn",      { bg = palette.line_bg })
hl("LineNr",           { fg = palette.gutter })
hl("CursorLineNr",     { fg = palette.gutter_active })
hl("SignColumn",       { fg = palette.fg, bg = palette.bg })
hl("EndOfBuffer",      { fg = palette.fg_faint })

-- ── Visual & Selection ───────────────────────────────
hl("Visual",           { bg = palette.selection })
hl("VisualNOS",        { bg = palette.selection_inactive })
hl("Search",           { bg = palette.search })
hl("IncSearch",        { bg = palette.search_cur })
hl("CurSearch",        { bg = palette.search_cur })
hl("MatchParen",       { bg = palette.matchparen })
hl("Substitute",       { fg = palette.bg, bg = palette.green })

-- ── Popup Menu ───────────────────────────────────────
hl("Pmenu",            { fg = palette.fg, bg = palette.bg_dark })
hl("PmenuSel",         { bg = palette.selection })
hl("PmenuSbar",        { bg = palette.bg_darker })
hl("PmenuThumb",       { bg = palette.fg_subtle })
hl("PmenuKind",        { fg = palette.type_teal })
hl("PmenuKindSel",     { fg = palette.type_teal, bg = palette.selection })
hl("PmenuExtra",       { fg = palette.fg_muted })
hl("PmenuExtraSel",    { fg = palette.fg_muted, bg = palette.selection })

-- ── Whitespace & Folding ─────────────────────────────
hl("Whitespace",       { fg = palette.indent })
hl("NonText",          { fg = palette.indent })
hl("SpecialKey",       { fg = palette.indent })
hl("Folded",           { fg = palette.fg_subtle, bg = palette.line_bg })
hl("FoldColumn",       { fg = palette.fg_subtle })

-- ── UI Chrome ────────────────────────────────────────
hl("Directory",        { fg = palette.green })
hl("Title",            { fg = palette.green, bold = true })
hl("ModeMsg",          { fg = palette.dim })
hl("MoreMsg",          { fg = palette.green })
hl("Question",         { fg = palette.green })
hl("WarningMsg",       { fg = palette.orange })
hl("ErrorMsg",         { fg = palette.red })

-- ── Window & Status ──────────────────────────────────
hl("WinSeparator",     { fg = palette.bg_darker })
hl("StatusLine",       { fg = palette.fg_dim, bg = palette.bg })
hl("StatusLineNC",     { fg = palette.fg_subtle, bg = palette.bg })
hl("WinBar",           { fg = palette.fg, bg = palette.bg })
hl("WinBarNC",         { fg = palette.fg_subtle, bg = palette.bg })
hl("TabLine",          { fg = palette.fg_subtle, bg = palette.bg })
hl("TabLineFill",      { fg = palette.fg_subtle, bg = palette.bg })
hl("TabLineSel",       { fg = palette.fg, bg = palette.bg })

-- ── Cursor & Term ────────────────────────────────────
hl("TermCursor",       { bg = palette.fg, fg = palette.bg })
hl("TermCursorNC",     { bg = palette.fg_subtle })
hl("Cursor",           { bg = palette.fg, fg = palette.bg })
hl("lCursor",          { bg = palette.fg, fg = palette.bg })
hl("CursorIM",         { bg = palette.fg, fg = palette.bg })

-- ── Syntax: Comments ─────────────────────────────────
hl("Comment",          { fg = palette.comment, italic = true })
hl("SpecialComment",   { fg = palette.comment, italic = true })
hl("Todo",             { fg = palette.bg, bg = palette.orange, bold = true })

-- ── Syntax: Constants ────────────────────────────────
hl("Constant",         { fg = palette.copper })
hl("String",           { fg = palette.brown })
hl("Character",        { fg = palette.brown })
hl("Number",           { fg = palette.teal })
hl("Boolean",          { fg = palette.green })
hl("Float",            { fg = palette.teal })

-- ── Syntax: Identifiers ──────────────────────────────
hl("Identifier",       { fg = palette.amber })
hl("Function",         { fg = palette.green_dim })

-- ── Syntax: Statements & Keywords ────────────────────
hl("Statement",        { fg = palette.green })
hl("Conditional",      { fg = palette.green })
hl("Repeat",           { fg = palette.green })
hl("Label",            { fg = palette.green })
hl("Operator",         { fg = palette.red })
hl("Keyword",          { fg = palette.green })
hl("Exception",        { fg = palette.green })

-- ── Syntax: Preprocessor ─────────────────────────────
hl("PreProc",          { fg = palette.green })
hl("Include",          { fg = palette.green })
hl("Define",           { fg = palette.green })
hl("Macro",            { fg = palette.green })
hl("PreCondit",        { fg = palette.green })

-- ── Syntax: Types ────────────────────────────────────
hl("Type",             { fg = palette.type_teal })
hl("StorageClass",     { fg = palette.red })
hl("Structure",        { fg = palette.type_teal })
hl("Typedef",          { fg = palette.type_teal })

-- ── Syntax: Special ──────────────────────────────────
hl("Special",          { fg = palette.orange })
hl("Tag",              { fg = palette.green })
hl("Delimiter",        { fg = palette.delimiter })
hl("SpecialChar",      { fg = palette.orange })
hl("Debug",            { fg = palette.orange })
hl("Underlined",       { fg = palette.blue, underline = true })
hl("Ignore",           { fg = palette.fg_faint })
hl("Error",            { fg = palette.red_bright, bold = true })

-- ── Diagnostics ──────────────────────────────────────
hl("DiagnosticError",  { fg = palette.red })
hl("DiagnosticWarn",   { fg = palette.orange })
hl("DiagnosticHint",   { fg = palette.green })
hl("DiagnosticInfo",   { fg = palette.blue })
hl("DiagnosticOk",     { fg = palette.green_dim })

hl("DiagnosticFloatingError", { fg = palette.red })
hl("DiagnosticFloatingWarn",  { fg = palette.orange })
hl("DiagnosticFloatingHint",  { fg = palette.green })
hl("DiagnosticFloatingInfo",  { fg = palette.blue })

hl("DiagnosticSignError", { fg = palette.red })
hl("DiagnosticSignWarn",  { fg = palette.orange })
hl("DiagnosticSignHint",  { fg = palette.green })
hl("DiagnosticSignInfo",  { fg = palette.blue })

hl("DiagnosticUnderlineError", { undercurl = true, sp = palette.red })
hl("DiagnosticUnderlineWarn",  { undercurl = true, sp = palette.orange })
hl("DiagnosticUnderlineHint",  { undercurl = true, sp = palette.green })
hl("DiagnosticUnderlineInfo",  { undercurl = true, sp = palette.blue })

-- ── Treesitter ───────────────────────────────────────
hl("@variable",            { fg = palette.amber })
hl("@variable.builtin",    { fg = palette.copper })
hl("@variable.parameter",  { fg = palette.fg })
hl("@variable.member",     { fg = palette.gold })

hl("@property",            { fg = palette.gold })
hl("@field",               { fg = palette.gold })
hl("@method",              { fg = palette.green_dim })
hl("@method.call",         { fg = palette.green_dim })
hl("@function",            { fg = palette.green_dim })
hl("@function.call",       { fg = palette.green_dim })
hl("@function.builtin",    { fg = palette.green_dim })
hl("@constructor",         { fg = palette.purple })

hl("@constant",            { fg = palette.copper })
hl("@constant.builtin",    { fg = palette.copper })
hl("@constant.macro",      { fg = palette.copper })
hl("@module",              { fg = palette.pink })
hl("@namespace",           { fg = palette.pink })
hl("@label",               { fg = palette.green })

hl("@string",              { fg = palette.brown })
hl("@string.regexp",       { fg = palette.brown_dark })
hl("@string.escape",       { fg = palette.yellow })
hl("@string.special",      { fg = palette.orange })
hl("@character",           { fg = palette.brown })
hl("@character.special",   { fg = palette.orange })
hl("@boolean",             { fg = palette.green })
hl("@number",              { fg = palette.teal })
hl("@float",               { fg = palette.teal })

hl("@keyword",             { fg = palette.green })
hl("@keyword.function",    { fg = palette.green })
hl("@keyword.operator",    { fg = palette.red })
hl("@keyword.return",      { fg = palette.green })
hl("@keyword.conditional", { fg = palette.green })
hl("@keyword.repeat",      { fg = palette.green })
hl("@keyword.exception",   { fg = palette.green })
hl("@keyword.import",      { fg = palette.green })
hl("@keyword.storage",     { fg = palette.red })
hl("@keyword.type",        { fg = palette.red })
hl("@keyword.directive",   { fg = palette.green })
hl("@keyword.debug",       { fg = palette.orange })

hl("@operator",            { fg = palette.red })

hl("@type",                { fg = palette.type_teal })
hl("@type.builtin",        { fg = palette.red })
hl("@type.definition",     { fg = palette.type_teal })
hl("@class",               { fg = palette.purple })
hl("@interface",           { fg = palette.type_teal })
hl("@struct",              { fg = palette.purple })
hl("@enum",                { fg = palette.purple })

hl("@attribute",           { fg = palette.gold })
hl("@parameter",           { fg = palette.fg })
hl("@parameter.reference", { fg = palette.fg })

hl("@comment",             { fg = palette.comment, italic = true })
hl("@comment.todo",        { fg = palette.bg, bg = palette.orange, bold = true })
hl("@comment.error",       { fg = palette.red_bright })
hl("@comment.warning",     { fg = palette.orange })
hl("@comment.note",        { fg = palette.blue })
hl("@comment.hint",        { fg = palette.green })

hl("@punctuation",         { fg = palette.delimiter })
hl("@punctuation.bracket", { fg = palette.delimiter })
hl("@punctuation.special", { fg = palette.delimiter })
hl("@punctuation.delimiter",{ fg = palette.delimiter })

hl("@tag",                 { fg = palette.green })
hl("@tag.attribute",       { fg = palette.gold })
hl("@tag.delimiter",       { fg = palette.delimiter })

hl("@text",                { fg = palette.fg })
hl("@text.underline",      { underline = true })
hl("@text.strike",         { strikethrough = true })
hl("@text.title",          { fg = palette.green, bold = true })
hl("@text.literal",        { fg = palette.green })
hl("@text.quote",          { fg = palette.type_teal })
hl("@text.uri",            { fg = palette.fg_muted, underline = true })
hl("@text.reference",      { fg = palette.brown })
hl("@text.emphasis",       { italic = true })
hl("@text.strong",         { bold = true })
hl("@text.diff.add",       { fg = palette.green_dim })
hl("@text.diff.delete",    { fg = palette.red_bright })

hl("@markup.heading",      { fg = palette.green, bold = true })
hl("@markup.list",         { fg = palette.orange })
hl("@markup.link",         { fg = palette.brown })
hl("@markup.link.label",   { fg = palette.brown })
hl("@markup.link.url",     { fg = palette.fg_muted, underline = true })
hl("@markup.raw",          { fg = palette.green })
hl("@markup.italic",       { italic = true })
hl("@markup.bold",         { bold = true })
hl("@markup.strikethrough",{ strikethrough = true })
hl("@markup.underline",    { underline = true })

hl("@diff.plus",           { fg = palette.green_dim })
hl("@diff.minus",          { fg = palette.red_bright })
hl("@diff.delta",          { fg = palette.lavender })

-- ── LSP Semantic Tokens ──────────────────────────────
hl("@lsp.type.variable",   { fg = palette.amber })
hl("@lsp.type.parameter",  { fg = palette.fg })
hl("@lsp.type.function",   { fg = palette.green_dim })
hl("@lsp.type.method",     { fg = palette.green_dim })
hl("@lsp.type.property",   { fg = palette.gold })
hl("@lsp.type.constant",   { fg = palette.copper })
hl("@lsp.type.class",      { fg = palette.purple })
hl("@lsp.type.enum",       { fg = palette.purple })
hl("@lsp.type.interface",  { fg = palette.type_teal })
hl("@lsp.type.struct",     { fg = palette.purple })
hl("@lsp.type.type",       { fg = palette.type_teal })
hl("@lsp.type.typeParameter",{ fg = palette.type_teal })
hl("@lsp.type.namespace",  { fg = palette.pink })
hl("@lsp.type.module",     { fg = palette.pink })
hl("@lsp.type.keyword",    { fg = palette.green })
hl("@lsp.type.string",     { fg = palette.brown })
hl("@lsp.type.number",     { fg = palette.teal })
hl("@lsp.type.boolean",    { fg = palette.green })
hl("@lsp.type.operator",   { fg = palette.red })
hl("@lsp.type.comment",    { fg = palette.comment, italic = true })
hl("@lsp.type.macro",      { fg = palette.green })
hl("@lsp.type.decorator",  { fg = palette.green })
hl("@lsp.type.event",      { fg = palette.orange })
hl("@lsp.type.regexp",     { fg = palette.brown_dark })

-- ── Snacks / Telescope / FZF ─────────────────────────
hl("SnacksPickerDir",        { fg = palette.fg_muted })
hl("SnacksPickerFile",       { fg = palette.fg })
hl("SnacksPickerCursorLine", { bg = palette.selection })
hl("SnacksPickerMatch",      { fg = palette.yellow })
hl("SnacksPickerBorder",     { fg = palette.bg_darker })
hl("SnacksPickerTitle",      { fg = palette.green })
hl("SnacksPickerSelected",   { fg = palette.green })
hl("SnacksPickerComment",    { fg = palette.comment })

-- ── Git Signs ────────────────────────────────────────
hl("GitSignsAdd",          { fg = palette.green })
hl("GitSignsChange",       { fg = palette.blue })
hl("GitSignsDelete",       { fg = palette.red })
hl("GitSignsAddLn",        { fg = palette.green, bg = palette.line_bg })
hl("GitSignsChangeLn",     { fg = palette.blue, bg = palette.line_bg })
hl("GitSignsDeleteLn",     { fg = palette.red, bg = palette.line_bg })

hl("GitGutterAdd",         { fg = palette.green })
hl("GitGutterChange",      { fg = palette.blue })
hl("GitGutterDelete",      { fg = palette.red })

-- ── Diff ─────────────────────────────────────────────
hl("DiffAdd",              { fg = palette.green_dim, bg = "#144620" })
hl("DiffDelete",           { fg = palette.red_bright, bg = "#86181d" })
hl("DiffChange",           { fg = palette.orange, bg = "#c24e00" })
hl("DiffText",             { bg = palette.line_bg })
hl("diffAdded",            { fg = palette.green_dim })
hl("diffRemoved",          { fg = palette.red_bright })
hl("diffChanged",          { fg = palette.orange })
hl("diffOldFile",          { fg = palette.red_bright })
hl("diffNewFile",          { fg = palette.green_dim })
hl("diffLine",             { fg = palette.lavender, bold = true })
hl("diffIndexLine",        { fg = palette.blue_bright })

-- ── Blink Cmp ────────────────────────────────────────
hl("BlinkCmpDoc",          { fg = palette.fg, bg = palette.bg_float })
hl("BlinkCmpDocBorder",    { fg = palette.bg_darker })
hl("BlinkCmpGhostText",    { fg = palette.fg_faint })
hl("BlinkCmpKind",         { fg = palette.type_teal })
hl("BlinkCmpKindFunction", { fg = palette.green_dim })
hl("BlinkCmpKindVariable", { fg = palette.amber })
hl("BlinkCmpKindConstant", { fg = palette.copper })
hl("BlinkCmpKindProperty", { fg = palette.gold })
hl("BlinkCmpKindKeyword",  { fg = palette.green })
hl("BlinkCmpKindClass",    { fg = palette.purple })
hl("BlinkCmpKindInterface",{ fg = palette.type_teal })
hl("BlinkCmpKindModule",   { fg = palette.pink })
hl("BlinkCmpKindMethod",   { fg = palette.green_dim })
hl("BlinkCmpKindField",    { fg = palette.gold })
hl("BlinkCmpKindSnippet",  { fg = palette.orange })
hl("BlinkCmpKindFile",     { fg = palette.fg_dim })
hl("BlinkCmpKindFolder",   { fg = palette.fg_dim })
hl("BlinkCmpKindText",     { fg = palette.fg })
hl("BlinkCmpKindEvent",    { fg = palette.orange })
hl("BlinkCmpKindEnum",     { fg = palette.purple })
hl("BlinkCmpKindColor",    { fg = palette.yellow })
hl("BlinkCmpKindReference",{ fg = palette.amber })
hl("BlinkCmpKindStruct",   { fg = palette.purple })
hl("BlinkCmpKindTypeParameter",{ fg = palette.type_teal })
hl("BlinkCmpKindUnit",     { fg = palette.copper })
hl("BlinkCmpKindValue",    { fg = palette.copper })
hl("BlinkCmpKindEnumMember",{ fg = palette.copper })

-- ── Indent Blankline / Snacks Indent ─────────────────
hl("IndentLine",           { fg = palette.indent })
hl("IndentLineCurrent",    { fg = palette.indent_active })
hl("IblIndent",            { fg = palette.indent })
hl("IblScope",             { fg = palette.indent_active })
hl("SnacksIndent",         { fg = palette.indent })
hl("SnacksIndentScope",    { fg = palette.indent_active })

-- ── Mason ────────────────────────────────────────────
hl("MasonHeader",          { fg = palette.bg, bg = palette.green, bold = true })
hl("MasonHeaderSecondary", { fg = palette.bg, bg = palette.orange, bold = true })
hl("MasonHighlight",       { fg = palette.green })
hl("MasonHighlightBlock",  { fg = palette.bg, bg = palette.green })
hl("MasonHighlightBlockBold",{ fg = palette.bg, bg = palette.green, bold = true })
hl("MasonHighlightSecondary",{ fg = palette.orange })
hl("MasonMuted",           { fg = palette.fg_subtle })
hl("MasonMutedBlock",      { fg = palette.bg, bg = palette.fg_subtle })

-- ── Lazygit ──────────────────────────────────────────
hl("LazyGitBorder",        { fg = palette.bg_darker })
hl("LazyGitFloat",         { fg = palette.fg, bg = palette.bg_float })

-- ── Misc ─────────────────────────────────────────────
hl("Conceal",              { fg = palette.fg_faint })
hl("CursorLineFold",       { fg = palette.fg_muted })
hl("QuickFixLine",         { bg = palette.selection })
hl("HealthSuccess",        { fg = palette.green })
hl("HealthError",          { fg = palette.red })
hl("HealthWarning",        { fg = palette.orange })
