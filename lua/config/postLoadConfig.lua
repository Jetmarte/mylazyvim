--cambiar el color de la palabra function

vim.api.nvim_set_hl(0, "@keyword.function", { fg = "#ffcc00", bold = true })
vim.api.nvim_set_hl(0, "@keyword.return", { fg = "#ffcc00", bold = true })

local pink = "#ff69b4"

vim.api.nvim_set_hl(0, "@keyword.type", { fg = pink, bold = true })
vim.api.nvim_set_hl(0, "@type", { fg = pink, bold = true })
vim.api.nvim_set_hl(0, "@type.builtin", { fg = pink, bold = true })
