require("mycode.myconfig.personal-config")
local moonfly = require("mycode.style.themes.moonfly")

--- Apply Pmenu (autocomplete popup) highlights coherent with the active theme.
-- @param p table  { bg, fg, sel_bg, sel_fg, sbar, thumb }
local function applyPmenu(p)
  vim.api.nvim_set_hl(0, "Pmenu", { bg = p.bg, fg = p.fg })
  vim.api.nvim_set_hl(0, "PmenuSel", { bg = p.sel_bg, fg = p.sel_fg, bold = true })
  vim.api.nvim_set_hl(0, "PmenuSbar", { bg = p.sbar })
  vim.api.nvim_set_hl(0, "PmenuThumb", { bg = p.thumb })
end

--- Morning theme configuration (tema claro)
local function Morning()
  local P = {
    -- Fondo y texto
    bg          = "#ffffff",
    bg_inactive = "#f6f8fa",
    bg_focus    = "#fafbfc",
    line_bg     = "#f0f2f5",
    fg          = "#1f2328",
    fg_dim      = "#59636e",
    comment     = "#68717a",
    faint       = "#8b959e",

    -- Acentos (accesibles sobre fondo claro)
    blue        = "#0969da",
    blue_light  = "#54aeff",
    blue_sel    = "#c8e1ff",
    sel_fg      = "#0a3069",
    green       = "#1a7f37",
    green_sel   = "#dafbe1",
    green_fg    = "#116329",
    orange      = "#bc4c00",
    yellow      = "#9a6700",
    yellow_sel  = "#fff8c5",
    highlight   = "#ffdf5d",
    purple      = "#8250df",
    cyan        = "#1b7c83",
    red         = "#cf222e",
    red_sel     = "#ffebe9",
    red_fg      = "#82071e",

    -- UI
    cursor_bg   = "#1f2328",
    border      = "#d1d9e0",
    sbar        = "#d1d9e0",
    thumb       = "#8c959f",
  }

  Config.setNeotreeBgColor(P.bg, P.bg_inactive)
  Config.windowBackgroundColorToFocus(P.bg, P.bg_inactive)
  Config.BackgroundColorWindowToFocus(P.bg, P.bg_inactive)
  Config.setGutterBgColor(P.bg, P.bg_inactive)
  Config.ColorSelectedText(P.blue_sel)
  Config.CursorColor(P.cursor_bg, P.blue, P.blue, P.cursor_bg)
  Config.RowColorCursor(P.line_bg, P.orange)
  applyPmenu({
    bg = P.bg_focus,
    fg = P.fg,
    sel_bg = P.blue,
    sel_fg = P.bg,
    sbar = P.sbar,
    thumb = P.thumb,
  })

  local syntax = {
    Comment = { fg = P.comment, italic = true },
    Constant = { fg = P.blue },
    String = { fg = P.green },
    Character = { fg = P.green },
    Number = { fg = P.blue },
    Boolean = { fg = P.blue },
    Float = { fg = P.blue },
    Function = { fg = P.purple },
    Identifier = { fg = P.fg },
    Keyword = { fg = P.orange },
    ["@keyword.return"] = { fg = P.purple },
    Conditional = { fg = P.orange },
    Repeat = { fg = P.orange },
    Label = { fg = P.orange },
    Operator = { fg = P.fg },
    PreProc = { fg = P.green },
    Include = { fg = P.green },
    Define = { fg = P.green },
    Macro = { fg = P.green },
    Type = { fg = P.orange },
    StorageClass = { fg = P.orange },
    Structure = { fg = P.orange },
    Typedef = { fg = P.orange },
    Special = { fg = P.comment },
    SpecialChar = { fg = P.green },
    Tag = { fg = P.blue },
    Delimiter = { fg = P.fg },
    SpecialComment = { fg = P.comment },
    Debug = { fg = P.orange },
    Underlined = { fg = P.blue, underline = true },
    Bold = { bold = true },
    Italic = { italic = true },
    Ignore = { fg = P.bg },
    Error = { fg = P.red, bold = true },
    Todo = { fg = P.yellow, bg = P.highlight, bold = true },
  }
  for group, opts in pairs(syntax) do
    vim.api.nvim_set_hl(0, group, opts)
  end

  local ui = {
    Normal = { bg = P.bg, fg = P.fg },
    NormalFloat = { bg = P.bg_focus },
    FloatBorder = { fg = P.blue, bg = P.bg_focus },
    FloatTitle = { fg = P.blue, bg = P.bg_focus, bold = true },
    LineNr = { fg = P.fg_dim },
    CursorLineNr = { fg = P.orange, bold = true },
    CursorLine = { bg = P.line_bg },
    Cursor = { bg = P.cursor_bg, fg = P.bg },
    Visual = { bg = P.blue_sel },
    VisualNOS = { bg = P.blue_sel },
    Search = { bg = P.highlight, fg = P.fg },
    IncSearch = { bg = P.blue, fg = P.bg },
    CurSearch = { link = "IncSearch" },
    MatchParen = { fg = P.orange, bg = P.line_bg, bold = true },
    VertSplit = { fg = P.border, bg = P.bg },
    WinSeparator = { fg = P.border, bg = P.bg },
    Folded = { bg = P.bg_inactive, fg = P.fg_dim },
    FoldColumn = { bg = P.bg, fg = P.fg_dim },
    SignColumn = { bg = P.bg },
    StatusLine = { bg = P.blue, fg = P.bg, bold = true },
    StatusLineNC = { bg = P.bg_inactive, fg = P.fg_dim },
    TabLine = { bg = P.bg_inactive, fg = P.fg_dim },
    TabLineFill = { bg = P.bg_inactive },
    TabLineSel = { bg = P.blue, fg = P.bg, bold = true },
    Title = { fg = P.blue, bold = true },
    NonText = { fg = P.fg_dim },
    SpecialKey = { fg = P.fg_dim },
    Whitespace = { fg = P.border },
    Conceal = { fg = P.comment },
    EndOfBuffer = { fg = P.bg },
    Directory = { fg = P.blue },
    ErrorMsg = { fg = P.red, bold = true },
    WarningMsg = { fg = P.orange, bold = true },
    MoreMsg = { fg = P.blue },
    ModeMsg = { fg = P.fg },
    Question = { fg = P.blue },
    SpellBad = { undercurl = true, sp = P.red },
    SpellCap = { undercurl = true, sp = P.blue },
    SpellLocal = { undercurl = true, sp = P.cyan },
    SpellRare = { undercurl = true, sp = P.purple },
    ColorColumn = { bg = P.line_bg },
    DiffAdd = { bg = P.green_sel, fg = P.green_fg },
    DiffChange = { bg = P.blue_sel, fg = P.blue },
    DiffDelete = { bg = P.red_sel, fg = P.red_fg },
    DiffText = { bg = P.blue_sel, fg = P.sel_fg },
    DiagnosticError = { fg = P.red },
    DiagnosticWarn = { fg = P.yellow },
    DiagnosticInfo = { fg = P.blue },
    DiagnosticHint = { fg = P.comment },
    DiagnosticVirtualTextError = { bg = P.red_sel, fg = P.red },
    DiagnosticVirtualTextWarn = { bg = P.yellow_sel, fg = P.yellow },
    DiagnosticVirtualTextInfo = { bg = P.blue_sel, fg = P.blue },
    DiagnosticVirtualTextHint = { bg = P.green_sel, fg = P.green },
    DiagnosticUnderlineError = { undercurl = true, sp = P.red },
    DiagnosticUnderlineWarn = { undercurl = true, sp = P.yellow },
    DiagnosticUnderlineInfo = { undercurl = true, sp = P.blue },
    DiagnosticUnderlineHint = { undercurl = true, sp = P.comment },
    LspReferenceText = { bg = P.blue_sel },
    LspReferenceRead = { bg = P.blue_sel },
    LspReferenceWrite = { bg = P.blue_sel },
    LspInlayHint = { bg = P.bg_focus, fg = P.fg_dim },
    SnacksIndent = { fg = P.border },
    SnacksIndentScope = { fg = P.blue_light },
  }
  for group, opts in pairs(ui) do
    vim.api.nvim_set_hl(0, group, opts)
  end

  -- Neo-tree: colores vivos sobre fondo claro
  local nt = {
    NeoTreeFileName = { fg = P.fg },
    NeoTreeFileNameOpened = { fg = P.sel_fg, italic = true },
    NeoTreeDirectoryName = { fg = P.blue },
    NeoTreeDirectoryIcon = { fg = P.blue },
    NeoTreeRootName = { fg = P.blue, bold = true },
    NeoTreeTitleBar = { fg = P.bg, bg = P.blue, bold = true },
    NeoTreeDotfile = { fg = P.comment },
    NeoTreeHiddenByName = { fg = P.comment },
    NeoTreeIndentMarker = { fg = P.border },
    NeoTreeExpander = { fg = P.fg_dim },
    NeoTreeCursorLine = { bg = P.line_bg },
    NeoTreeModified = { fg = P.orange },
    NeoTreeGitAdded = { fg = P.green },
    NeoTreeGitModified = { fg = P.yellow },
    NeoTreeGitDeleted = { fg = P.red },
    NeoTreeGitRenamed = { fg = P.purple },
    NeoTreeGitUntracked = { fg = P.blue },
    NeoTreeGitStaged = { fg = P.green },
    NeoTreeGitUnstaged = { fg = P.yellow },
    NeoTreeGitConflict = { fg = P.red, bold = true },
    NeoTreeGitIgnored = { fg = P.faint },
  }
  for group, opts in pairs(nt) do
    vim.api.nvim_set_hl(0, group, opts)
  end
end

--- Solarized Osaka theme configuration
local function configSolarizedOsaka()
  local C = ColorsSolarizedOsaka

  Config.setNeotreeBgColor(C.Base04, C.Base03)
  Config.windowBackgroundColorToFocus(C.Base04, C.Base03)
  Config.BackgroundColorWindowToFocus(C.Base04, C.Base03)
  Config.setGutterBgColor(C.Base04, C.Base03)
  Config.ColorSelectedText(C.Base02)
  Config.CursorColor(C.Base04, C.Blue, C.Blue, C.Base03)
  Config.RowColorCursor(C.Row, C.Orange)
  applyPmenu({
    bg = C.Base03,
    fg = C.Base0,
    sel_bg = C.Base02,
    sel_fg = C.Base1,
    sbar = C.Base04,
    thumb = C.Base01,
  })

  local syntax = {
    Comment = { fg = C.Base01, italic = true },
    Constant = { fg = C.Yellow },
    String = { fg = C.Green },
    Character = { fg = C.Green },
    Number = { fg = C.Yellow },
    Boolean = { fg = C.Yellow },
    Float = { fg = C.Yellow },
    Function = { fg = C.Cyan },
    Identifier = { fg = C.Base0 },
    Keyword = { fg = C.Blue },
    ["@keyword.return"] = { fg = C.Orange },
    Conditional = { fg = C.Blue },
    Repeat = { fg = C.Blue },
    Label = { fg = C.Base1 },
    Operator = { fg = C.Base1 },
    PreProc = { fg = C.Orange },
    Include = { fg = C.Orange },
    Define = { fg = C.Orange },
    Macro = { fg = C.Orange },
    Type = { fg = C.Yellow },
    StorageClass = { fg = C.Blue },
    Structure = { fg = C.Yellow },
    Typedef = { fg = C.Yellow },
    Special = { fg = C.Orange },
    SpecialChar = { fg = C.Green },
    Tag = { fg = C.Blue },
    Delimiter = { fg = C.Base1 },
    SpecialComment = { fg = C.Base01 },
    Debug = { fg = C.Red },
    Underlined = { fg = C.Blue, underline = true },
    Bold = { bold = true },
    Italic = { italic = true },
    Ignore = { fg = C.Base03 },
    Error = { fg = C.Red, bold = true },
    Todo = { fg = C.Yellow, bg = C.Base02, bold = true },
  }
  for group, opts in pairs(syntax) do
    vim.api.nvim_set_hl(0, group, opts)
  end

  local ui = {
    Normal = { bg = C.Base03, fg = C.Base0 },
    NormalFloat = { bg = C.Base03 },
    FloatBorder = { fg = C.Cyan, bg = C.Base03 },
    FloatTitle = { fg = C.Cyan, bg = C.Base03, bold = true },
    LineNr = { fg = C.Base01 },
    CursorLine = { bg = C.Row },
    Cursor = { bg = C.Base04, fg = C.Base0 },
    Visual = { bg = C.Base02 },
    VisualNOS = { bg = C.Base02 },
    Search = { bg = C.Base02, fg = C.Yellow },
    IncSearch = { bg = C.Yellow, fg = C.Base03 },
    CurSearch = { link = "IncSearch" },
    MatchParen = { fg = C.Orange, bg = C.Base02, bold = true },
    VertSplit = { fg = C.Base02, bg = C.Base03 },
    WinSeparator = { fg = C.Base02, bg = C.Base03 },
    Folded = { bg = C.Base04, fg = C.Base01 },
    FoldColumn = { bg = C.Base03, fg = C.Base01 },
    SignColumn = { bg = C.Base03 },
    StatusLine = { bg = C.Base02, fg = C.Base1, bold = true },
    StatusLineNC = { bg = C.Base04, fg = C.Base01 },
    TabLine = { bg = C.Base04, fg = C.Base01 },
    TabLineFill = { bg = C.Base04 },
    TabLineSel = { bg = C.Base02, fg = C.Cyan, bold = true },
    Title = { fg = C.Cyan, bold = true },
    NonText = { fg = C.Base01 },
    SpecialKey = { fg = C.Base01 },
    Whitespace = { fg = C.Base02 },
    Conceal = { fg = C.Base01 },
    EndOfBuffer = { fg = C.Base03 },
    Directory = { fg = C.Blue },
    ErrorMsg = { fg = C.Red, bold = true },
    WarningMsg = { fg = C.Orange, bold = true },
    MoreMsg = { fg = C.Cyan },
    ModeMsg = { fg = C.Base1 },
    Question = { fg = C.Cyan },
    SpellBad = { undercurl = true, sp = C.Red },
    SpellCap = { undercurl = true, sp = C.Blue },
    SpellLocal = { undercurl = true, sp = C.Cyan },
    SpellRare = { undercurl = true, sp = C.Magenta },
    ColorColumn = { bg = C.Base04 },
    DiffAdd = { bg = "#073642", fg = C.Green },
    DiffChange = { bg = "#073642", fg = C.Blue },
    DiffDelete = { bg = "#073642", fg = C.Red },
    DiffText = { bg = C.Base02, fg = C.Cyan },
    DiagnosticError = { fg = C.Red },
    DiagnosticWarn = { fg = C.Yellow },
    DiagnosticInfo = { fg = C.Cyan },
    DiagnosticHint = { fg = C.Base01 },
    DiagnosticVirtualTextError = { bg = C.Base04, fg = C.Red },
    DiagnosticVirtualTextWarn = { bg = C.Base04, fg = C.Yellow },
    DiagnosticVirtualTextInfo = { bg = C.Base04, fg = C.Cyan },
    DiagnosticVirtualTextHint = { bg = C.Base04, fg = C.Base01 },
    DiagnosticUnderlineError = { undercurl = true, sp = C.Red },
    DiagnosticUnderlineWarn = { undercurl = true, sp = C.Yellow },
    DiagnosticUnderlineInfo = { undercurl = true, sp = C.Cyan },
    DiagnosticUnderlineHint = { undercurl = true, sp = C.Base01 },
    LspReferenceText = { bg = C.Base02 },
    LspReferenceRead = { bg = C.Base02 },
    LspReferenceWrite = { bg = C.Base02 },
    LspInlayHint = { bg = C.Base04, fg = C.Base01 },
    SnacksIndent = { fg = C.Base02 },
    SnacksIndentScope = { fg = C.Cyan },
  }
  for group, opts in pairs(ui) do
    vim.api.nvim_set_hl(0, group, opts)
  end

  local nt = {
    NeoTreeFileName = { fg = C.Base0 },
    NeoTreeFileNameOpened = { fg = C.Cyan, italic = true },
    NeoTreeDirectoryName = { fg = C.Blue },
    NeoTreeDirectoryIcon = { fg = C.Blue },
    NeoTreeRootName = { fg = C.Cyan, bold = true },
    NeoTreeTitleBar = { fg = C.Base03, bg = C.Cyan, bold = true },
    NeoTreeDotfile = { fg = C.Base01 },
    NeoTreeHiddenByName = { fg = C.Base01 },
    NeoTreeIndentMarker = { fg = C.Base02 },
    NeoTreeExpander = { fg = C.Base01 },
    NeoTreeCursorLine = { bg = C.Base04 },
    NeoTreeModified = { fg = C.Orange },
    NeoTreeGitAdded = { fg = C.Green },
    NeoTreeGitModified = { fg = C.Yellow },
    NeoTreeGitDeleted = { fg = C.Red },
    NeoTreeGitRenamed = { fg = C.Magenta },
    NeoTreeGitUntracked = { fg = C.Blue },
    NeoTreeGitStaged = { fg = C.Green },
    NeoTreeGitUnstaged = { fg = C.Yellow },
    NeoTreeGitConflict = { fg = C.Red, bold = true },
    NeoTreeGitIgnored = { fg = C.Base01 },
  }
  for group, opts in pairs(nt) do
    vim.api.nvim_set_hl(0, group, opts)
  end

  vim.api.nvim_set_hl(0, "CmpDocNormal", { bg = C.Base03 })
  vim.api.nvim_set_hl(0, "CmpDocBorder", { fg = C.Cyan, bg = C.Base03 })
end

--- EverGarden theme configuration
local function EverGarden()
  Config.setNeotreeBgColor(EverForest.bg_dim, EverForest.bg0)
  Config.windowBackgroundColorToFocus(EverForest.bg_dim, EverForest.bg0)
  Config.BackgroundColorWindowToFocus(EverForest.bg_dim, EverForest.bg0)
  Config.setGutterBgColor(EverForest.bg_dim, EverForest.bg0)
  Config.ColorSelectedText(EverForest.bg_yellow)
  Config.CursorColor(EverForest.bg0, "#ff6600", "#ff6600", "#ff6600")
  Config.RowColorCursor(EverForest.bg_blue, EverForest.yellow)
  applyPmenu({
    bg = EverForest.bg_dim,
    fg = EverForest.fg or "#d3c6aa",
    sel_bg = EverForest.bg_blue or "#3a515d",
    sel_fg = EverForest.fg or "#d3c6aa",
    sbar = EverForest.bg0 or "#2d353b",
    thumb = EverForest.bg_yellow or "#5c6a72",
  })
end

--- Gruvbox theme configuration
local function Gruvbox()
  Config.setNeotreeBgColor(GruvboxColors.bg_hard, GruvboxColors.bg0)
  Config.windowBackgroundColorToFocus(GruvboxColors.bg_hard, GruvboxColors.bg0)
  Config.BackgroundColorWindowToFocus(GruvboxColors.bg_hard, GruvboxColors.bg0)
  Config.setGutterBgColor(GruvboxColors.bg_hard, GruvboxColors.bg0)
  Config.ColorSelectedText(GruvboxColors.bg2)
  Config.CursorColor(GruvboxColors.bg0, GruvboxColors.fg, GruvboxColors.orange_bright, GruvboxColors.fg)
  Config.RowColorCursor(GruvboxColors.bg1, GruvboxColors.orange_bright)
  applyPmenu({
    bg = GruvboxColors.bg_hard,
    fg = GruvboxColors.fg or "#ebdbb2",
    sel_bg = GruvboxColors.bg2 or "#504945",
    sel_fg = GruvboxColors.fg or "#ebdbb2",
    sbar = GruvboxColors.bg1 or "#3c3836",
    thumb = GruvboxColors.bg3 or "#665c54",
  })
end

-- retro-theme omi
local function RetroTheme()
  Config.setNeotreeBgColor("#1c1e26", "#232530")
  Config.windowBackgroundColorToFocus("#1c1e26", "#232530")
  Config.BackgroundColorWindowToFocus("#1c1e26", "#232530")
  Config.setGutterBgColor("#1c1e26", "#232530")
  Config.ColorSelectedText("#336699")
  Config.CursorColor("#1c1e26", "#ffdd33", "#ffdd33", "#ffdd33")
  Config.RowColorCursor("#2a2c38", "#c8d0e0")
  applyPmenu({
    bg = "#1b1d23",
    fg = "#c8d0e0",
    sel_bg = "#336699",
    sel_fg = "#c8d0e0",
    sbar = "#232530",
    thumb = "#3d4050",
  })
end

--visual studio code
local function VisualStudioCode()
  -- local bg = "#2b2727"
  local bg = "#111117"
  local bg_inactive = "#252526"
  local bg_focus = "#2d2d2d"
  local fg = "#d4d4d4"
  local fg_dim = "#969696"
  local blue = "#007acc"
  local blue_light = "#569cd6"
  local sel_bg = "#264f78"
  local cursor_bg = "#aeafad"
  local line_bg = "#2a2d2e"
  local comment = "#6a9955"
  local green = "#b5cea8"
  local orange = "#ce9178"
  local yellow = "#dcdcaa"
  local purple = "#c586c0"
  local cyan = "#4ec9b0"
  local red = "#f44747"
  local sbar = "#303030"
  local thumb = "#424242"
  local border = "#3c3c3c"

  Config.setNeotreeBgColor(bg, bg_inactive)
  Config.windowBackgroundColorToFocus(bg, bg_inactive)
  Config.BackgroundColorWindowToFocus(bg, bg_inactive)
  Config.setGutterBgColor(bg, bg_inactive)
  Config.ColorSelectedText(sel_bg)
  Config.CursorColor(cursor_bg, blue, blue, cursor_bg)
  Config.RowColorCursor(line_bg, blue)
  applyPmenu({
    bg = bg_inactive,
    fg = fg,
    sel_bg = blue,
    sel_fg = bg,
    sbar = sbar,
    thumb = thumb,
  })

  local syntax = {
    Comment = { fg = comment, italic = true },
    Constant = { fg = cyan },
    String = { fg = orange },
    Character = { fg = orange },
    Number = { fg = green },
    Boolean = { fg = blue_light },
    Float = { fg = green },
    Function = { fg = yellow },
    Identifier = { fg = fg },
    Keyword = { fg = blue_light },
    ["@keyword.return"] = { fg = "#f5b8d8" },
    Conditional = { fg = blue_light },
    Repeat = { fg = blue_light },
    Label = { fg = blue_light },
    Operator = { fg = fg },
    PreProc = { fg = purple },
    Include = { fg = purple },
    Define = { fg = purple },
    Macro = { fg = purple },
    Type = { fg = cyan },
    StorageClass = { fg = blue_light },
    Structure = { fg = cyan },
    Typedef = { fg = cyan },
    Special = { fg = orange },
    SpecialChar = { fg = orange },
    Tag = { fg = blue_light },
    Delimiter = { fg = fg },
    SpecialComment = { fg = comment },
    Debug = { fg = orange },
    Underlined = { underline = true },
    Bold = { bold = true },
    Italic = { italic = true },
    Ignore = { fg = bg },
    Error = { fg = red, bold = true },
    Todo = { fg = bg, bg = yellow, bold = true },
  }
  for group, opts in pairs(syntax) do
    vim.api.nvim_set_hl(0, group, opts)
  end

  local ui = {
    Normal = { bg = bg, fg = fg },
    NormalFloat = { bg = bg_focus },
    FloatBorder = { fg = blue, bg = bg_focus },
    FloatTitle = { fg = blue, bg = bg_focus, bold = true },
    LineNr = { fg = "#858585" },
    CursorLineNr = { fg = blue, bold = true },
    CursorLine = { bg = line_bg },
    Cursor = { bg = cursor_bg, fg = bg },
    Visual = { bg = sel_bg },
    VisualNOS = { bg = sel_bg },
    Search = { bg = sel_bg, fg = fg },
    IncSearch = { bg = blue, fg = bg },
    CurSearch = { link = "IncSearch" },
    MatchParen = { bg = "#3d3d3d", fg = orange },
    VertSplit = { fg = border, bg = bg },
    WinSeparator = { fg = border, bg = bg },
    Folded = { bg = bg_inactive, fg = fg_dim },
    FoldColumn = { bg = bg, fg = fg_dim },
    SignColumn = { bg = bg },
    StatusLine = { bg = bg_inactive, fg = fg },
    StatusLineNC = { bg = bg_inactive, fg = fg_dim },
    TabLine = { bg = bg_inactive, fg = fg_dim },
    TabLineFill = { bg = bg_inactive },
    TabLineSel = { bg = bg, fg = blue, bold = true },
    Title = { fg = blue, bold = true },
    NonText = { fg = fg_dim },
    SpecialKey = { fg = fg_dim },
    Whitespace = { fg = "#3d3d3d" },
    Conceal = { fg = comment },
    EndOfBuffer = { fg = bg },
    Directory = { fg = blue },
    ErrorMsg = { fg = red, bold = true },
    WarningMsg = { fg = orange, bold = true },
    MoreMsg = { fg = blue },
    ModeMsg = { fg = fg },
    Question = { fg = blue },
    SpellBad = { undercurl = true, sp = red },
    SpellCap = { undercurl = true, sp = blue },
    SpellLocal = { undercurl = true, sp = cyan },
    SpellRare = { undercurl = true, sp = purple },
    ColorColumn = { bg = "#2a2d2e" },
    DiffAdd = { bg = "#1e3a2a", fg = green },
    DiffChange = { bg = "#1e2a3a", fg = blue_light },
    DiffDelete = { bg = "#3a1e1e", fg = red },
    DiffText = { bg = "#264f78", fg = fg },
    DiagnosticError = { fg = red },
    DiagnosticWarn = { fg = orange },
    DiagnosticInfo = { fg = blue },
    DiagnosticHint = { fg = comment },
    DiagnosticVirtualTextError = { bg = "#3a1e1e", fg = red },
    DiagnosticVirtualTextWarn = { bg = "#3a2a1e", fg = orange },
    DiagnosticVirtualTextInfo = { bg = "#1e2a3a", fg = blue },
    DiagnosticVirtualTextHint = { bg = "#1e2a1e", fg = comment },
    DiagnosticUnderlineError = { undercurl = true, sp = red },
    DiagnosticUnderlineWarn = { undercurl = true, sp = orange },
    DiagnosticUnderlineInfo = { undercurl = true, sp = blue },
    DiagnosticUnderlineHint = { undercurl = true, sp = comment },
    LspReferenceText = { bg = sel_bg },
    LspReferenceRead = { bg = sel_bg },
    LspReferenceWrite = { bg = sel_bg },
    LspInlayHint = { bg = bg_focus, fg = fg_dim },
    SnacksIndent = { fg = "#353550" },
    SnacksIndentScope = { fg = "#1e5a7a" },
  }
  for group, opts in pairs(ui) do
    vim.api.nvim_set_hl(0, group, opts)
  end
end

--- Github Dark theme configuration
local function GithubDark()
  -- "NONE" deja el fondo transparente para que se vea la terminal por detrás.
  -- Nota: con transparencia se pierde el efecto de "atenuar la ventana al perder
  -- foco", porque un fondo transparente no se puede oscurecer con un color.
  Config.setNeotreeBgColor("NONE", "NONE")
  Config.windowBackgroundColorToFocus("NONE", "NONE")
  Config.BackgroundColorWindowToFocus("NONE", "NONE")
  Config.setGutterBgColor("NONE", "NONE")
  Config.ColorSelectedText(GithubColors.gray5)
  Config.CursorColor(GithubColors.bg_dark, GithubColors.blue_light, GithubColors.orange, GithubColors.blue_light)
  Config.RowColorCursor("#161b22", "#539bf5")
  -- Fondo de ventanas flotantes (lazygit, popups, etc.)
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#0d1117" })
  vim.api.nvim_set_hl(0, "FloatBorder", { fg = GithubColors.blue_light, bg = "#0d1117" })
  vim.api.nvim_set_hl(0, "FloatTitle", { fg = GithubColors.blue_light, bg = "#0d1117", bold = true })
  -- Líneas de indentación más tenues
  vim.api.nvim_set_hl(0, "SnacksIndent", { fg = "#1b2230" })
  vim.api.nvim_set_hl(0, "SnacksIndentScope", { fg = "#30363d" })

  -- Neo-tree: mejorar visibilidad sobre fondo transparente
  -- (más contraste en texto, iconos, git status e indentación)
  local nt = {
    -- Nombres de archivos y carpetas
    NeoTreeFileName = { fg = "#c9d1d9" },
    NeoTreeFileNameOpened = { fg = "#e6edf3", italic = true },
    NeoTreeDirectoryName = { fg = "#58a6ff" },
    NeoTreeDirectoryIcon = { fg = "#58a6ff" },
    NeoTreeRootName = { fg = "#58a6ff", bold = true },
    NeoTreeTitleBar = { fg = "#0d1117", bg = "#58a6ff", bold = true },
    -- Archivos ocultos/ignorados (tenues pero legibles)
    NeoTreeDotfile = { fg = "#6e7681" },
    NeoTreeHiddenByName = { fg = "#6e7681" },
    -- Indentación y expanders más visibles
    NeoTreeIndentMarker = { fg = "#444c56" },
    NeoTreeExpander = { fg = "#768390" },
    -- Línea seleccionada: fondo sólido sutil para ubicarse aun con transparencia
    NeoTreeCursorLine = { bg = "#21262d" },
    -- Símbolo de archivo modificado
    NeoTreeModified = { fg = "#d29922" },
    -- Git status con colores vivos
    NeoTreeGitAdded = { fg = "#3fb950" },
    NeoTreeGitModified = { fg = "#d29922" },
    NeoTreeGitDeleted = { fg = "#f85149" },
    NeoTreeGitRenamed = { fg = "#a371f7" },
    NeoTreeGitUntracked = { fg = "#6cb6ff" },
    NeoTreeGitStaged = { fg = "#3fb950" },
    NeoTreeGitUnstaged = { fg = "#d29922" },
    NeoTreeGitConflict = { fg = "#f85149", bold = true },
    NeoTreeGitIgnored = { fg = "#545d68" },
  }
  for group, opts in pairs(nt) do
    vim.api.nvim_set_hl(0, group, opts)
  end

  applyPmenu({
    bg = "#0d1117",
    fg = "#c9d1d9",
    sel_bg = "#21262d",
    sel_fg = "#e6edf3",
    sbar = "#161b22",
    thumb = "#30363d",
  })
end

-- =============================================================
--  configurar tema personalizado
--- Apply theme-specific configuration by name.
-- @param themeName Name of the theme to configure
local function ConfigTheme(themeName)
  local opcion = themeName

  local switch = {
    ["solarized-osaka"] = function()
      configSolarizedOsaka()
    end,
    ["evergarden"] = function()
      EverGarden()
    end,
    ["gruvbox"] = function()
      Gruvbox()
    end,
    ["github_dark"] = function()
      GithubDark()
    end,
    ["github_dark_dimmed"] = function()
      GithubDark()
    end,
    ["github_dark_default"] = function()
      GithubDark()
    end,
    ["retro-theme"] = function()
      RetroTheme()
    end,
    ["visual_studio_code"] = function()
      VisualStudioCode()
    end,
    ["morning"] = function()
      Morning()
    end,
  }

  if switch[opcion] then
    switch[opcion]()
  else
    print("Opción no válida")
  end
end

--- Initialize and auto-apply theme configuration based on current colorscheme.
function ConfigMyColor()
  -- cargar configuración personal al inicio
  local theme_name = vim.g.colors_name or "unknown"
  vim.g.current_theme = theme_name
  ConfigTheme(theme_name)

  -- detectar si se cambia el tema
  vim.api.nvim_create_autocmd("ColorScheme", {
    callback = function()
      local new_theme = vim.g.colors_name or "unknown"
      if vim.g.current_theme ~= new_theme then
        vim.g.current_theme = new_theme
        ConfigTheme(new_theme)
        print("Tema cambiado a: " .. new_theme)
      end
    end,
  })
end

return Config
