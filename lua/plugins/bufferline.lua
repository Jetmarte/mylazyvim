local function get_bufferline_highlights()
  local function hl(name)
    return vim.api.nvim_get_hl(0, { name = name }) or {}
  end

  local normal = hl("Normal")
  local tabline = hl("TabLine")
  local tabline_sel = hl("TabLineSel")
  local tabline_fill = hl("TabLineFill")
  local visual = hl("Visual")
  local cursorline = hl("CursorLine")
  local comment = hl("Comment")
  local nontext = hl("NonText")
  local special = hl("Special")
  local d_error = hl("DiagnosticError")
  local d_warn = hl("DiagnosticWarn")
  local d_info = hl("DiagnosticInfo")
  local d_hint = hl("DiagnosticHint")

  local func = hl("@function")
  if not func.fg then
    func = hl("Function")
  end

  local keyword = hl("@keyword")
  if not keyword.fg then
    keyword = hl("Keyword")
  end

  local function brightness(hex, diff)
    if not hex then
      return nil
    end
    local r = math.max(0, math.min(255, tonumber(hex:sub(2, 3), 16) + diff))
    local g = math.max(0, math.min(255, tonumber(hex:sub(4, 5), 16) + diff))
    local b = math.max(0, math.min(255, tonumber(hex:sub(6, 7), 16) + diff))
    return string.format("#%02x%02x%02x", r, g, b)
  end

  local bg = tabline_fill.bg or normal.bg or "#000000"
  local bg_visible = tabline.bg or brightness(normal.bg, 12) or bg
  local bg_selected = tabline_sel.bg or visual.bg or cursorline.bg or brightness(normal.bg, 55) or bg
  local fg = comment.fg or nontext.fg or "#787878"
  local fg_visible = normal.fg or "#cccccc"
  local fg_selected = tabline_sel.fg or brightness(normal.fg, 40) or "#ffffff"
  local indicator = func.fg or special.fg or d_info.fg or keyword.fg or "#00ffff"
  local modified = d_warn.fg or special.fg or keyword.fg or "#e5c07b"

  return {
    fill = { bg = bg },
    background = { bg = bg, fg = fg },
    buffer_visible = { fg = fg_visible, bg = bg_visible },
    buffer_selected = { bg = bg_selected, fg = fg_selected, bold = true, italic = false, underline = true },
    indicator_visible = { fg = bg_visible, bg = bg_visible },
    indicator_selected = { fg = indicator, bg = bg_selected, bold = true },
    separator = { fg = bg, bg = bg },
    separator_visible = { fg = bg_visible, bg = bg },
    separator_selected = { fg = indicator, bg = bg },
    close_button = { fg = fg, bg = bg },
    close_button_visible = { fg = fg_visible, bg = bg_visible },
    close_button_selected = { fg = fg_selected, bg = bg_selected },
    modified = { fg = modified, bg = bg },
    modified_visible = { fg = modified, bg = bg_visible },
    modified_selected = { fg = modified, bg = bg_selected },
    duplicate = { fg = fg, bg = bg, italic = true },
    duplicate_visible = { fg = fg_visible, bg = bg_visible, italic = true },
    duplicate_selected = { fg = fg_selected, bg = bg_selected, italic = true },
    error = { fg = d_error.fg or "#e06c75", bg = bg },
    error_visible = { fg = d_error.fg or "#e06c75", bg = bg_visible },
    error_selected = { fg = d_error.fg or "#e06c75", bg = bg_selected, bold = true },
    error_diagnostic = { fg = d_error.fg or "#e06c75", bg = bg },
    error_diagnostic_visible = { fg = d_error.fg or "#e06c75", bg = bg_visible },
    error_diagnostic_selected = { fg = d_error.fg or "#e06c75", bg = bg_selected, bold = true },
    warning = { fg = d_warn.fg or "#e5c07b", bg = bg },
    warning_visible = { fg = d_warn.fg or "#e5c07b", bg = bg_visible },
    warning_selected = { fg = d_warn.fg or "#e5c07b", bg = bg_selected, bold = true },
    warning_diagnostic = { fg = d_warn.fg or "#e5c07b", bg = bg },
    warning_diagnostic_visible = { fg = d_warn.fg or "#e5c07b", bg = bg_visible },
    warning_diagnostic_selected = { fg = d_warn.fg or "#e5c07b", bg = bg_selected, bold = true },
    info = { fg = d_info.fg or "#61afef", bg = bg },
    info_visible = { fg = d_info.fg or "#61afef", bg = bg_visible },
    info_selected = { fg = d_info.fg or "#61afef", bg = bg_selected, bold = true },
    info_diagnostic = { fg = d_info.fg or "#61afef", bg = bg },
    info_diagnostic_visible = { fg = d_info.fg or "#61afef", bg = bg_visible },
    info_diagnostic_selected = { fg = d_info.fg or "#61afef", bg = bg_selected, bold = true },
    hint = { fg = d_hint.fg or "#c678dd", bg = bg },
    hint_visible = { fg = d_hint.fg or "#c678dd", bg = bg_visible },
    hint_selected = { fg = d_hint.fg or "#c678dd", bg = bg_selected, bold = true },
    hint_diagnostic = { fg = d_hint.fg or "#c678dd", bg = bg },
    hint_diagnostic_visible = { fg = d_hint.fg or "#c678dd", bg = bg_visible },
    hint_diagnostic_selected = { fg = d_hint.fg or "#c678dd", bg = bg_selected, bold = true },
  }
end

local function apply_highlights()
  local highlights = get_bufferline_highlights()
  for key, attrs in pairs(highlights) do
    local group = "BufferLine" .. key:gsub("_(%l)", string.upper):gsub("^%l", string.upper)
    vim.api.nvim_set_hl(0, group, attrs)
  end
end

vim.api.nvim_create_autocmd("ColorScheme", {
  group = vim.api.nvim_create_augroup("bufferline_theme_refresh", { clear = true }),
  callback = apply_highlights,
})

return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = "nvim-tree/nvim-web-devicons",
  opts = {
    options = {
      mode = "buffers",
      diagnostics = "nvim_lsp",
      show_close_icon = false,
      show_buffer_close_icons = true,
      close_icon = "󰅖",
      separator_style = "thick",
      always_show_bufferline = true,
      indicator = { style = "icon", icon = "▎" },
      tab_size = 20,
      max_name_length = 25,
      max_prefix_length = 15,
      truncate_names = true,
      offsets = {
        {
          filetype = "neo-tree",
          text = "Explorer",
          highlight = "Directory",
          text_align = "center",
          separator = true,
        },
      },
      diagnostics_indicator = function(_, _, diagnostics_dict, _)
        local icons = { error = " ", warning = " ", info = " ", hint = " " }
        local s = ""
        for e, n in pairs(diagnostics_dict) do
          local sym = icons[e] or " "
          s = s .. n .. sym
        end
        return s
      end,
    },
    highlights = get_bufferline_highlights,
  },
  config = function(_, opts)
    require("bufferline").setup(opts)
    apply_highlights()
  end,
}
