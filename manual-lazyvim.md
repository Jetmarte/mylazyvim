# Manual de LazyVim Personalizado de Omar

Este manual documenta la configuración personalizada de LazyVim en `~/.config/nvim`. Incluye los atajos de teclado configurados, los plugins instalados, los snippets, los temas visuales y las opciones más relevantes.

> **Nota importante:** Esta configuración usa ` Espacio` como `<leader>` y `\\` como `<localleader>`. Muchos atajos listados aquí son personalizados por Omar; otros vienen de LazyVim por defecto y están marcados como *(LazyVim default)*.

---

## Tabla de Contenidos

1. [Conceptos básicos](#conceptos-básicos)
2. [Atajos generales](#atajos-generales)
3. [Navegación entre ventanas, splits y tmux](#navegación-entre-ventanas-splits-y-tmux)
4. [Buffers y tabs](#buffers-y-tabs)
5. [Neo-tree: explorador de archivos](#neo-tree-explorador-de-archivos)
6. [Búsqueda y reemplazo](#búsqueda-y-reemplazo)
7. [LSP, desarrollo y código](#lsp-desarrollo-y-código)
8. [Depuración (DAP)](#depuración-dap)
9. [Git](#git)
10. [Terminal y ejecución de código](#terminal-y-ejecución-de-código)
11. [IA: NeoCodeium y Opencode](#ia-neocodeium-y-opencode)
12. [Markdown](#markdown)
13. [Snippets (LuaSnip)](#snippets-luasnip)
14. [Temas visuales](#temas-visuales)
15. [Plugins instalados](#plugins-instalados)
16. [Opciones importantes](#opciones-importantes)
17. [Autocomandos](#autocomandos)
18. [Notas y conflictos conocidos](#notas-y-conflictos-conocidos)

---

## Conceptos básicos

- **Leader:** `<Space>` (barra espaciadora)
- **LocalLeader:** `\\`
- **Modos:** `n` = normal, `i` = inserción, `v` = visual, `x` = visual (incluye bloque), `t` = terminal
- La tecla `q` para grabar macros está **deshabilitada**.
- Las teclas `H`, `J`, `K`, `I`, `L` en modo normal están deshabilitadas (`<Nop>`).
- El portapapeles del sistema está sincronizado (`unnamedplus`), salvo en conexiones SSH.

---

## Atajos generales

| Atajo | Modo | Acción |
|-------|------|--------|
| `<leader>` | `n` | Tecla líder (espacio) |
| `<C-s>` | `n`, `i` | Guardar archivo (`:w`) |
| `<F4>` | `n` | Recargar la configuración de Neovim (`:source $MYVIMRC`) |
| `<F5>` | `n` | Ejecutar archivo `.js` con Node.js o `.ts` con Deno en ventana flotante |
| `<leader>rr` | `n` | Recargar buffer desde disco (`:edit!`) |
| `<C-a>` | `n` | Seleccionar todo el buffer (`ggVG`) |
| `º` | `n`, `v` | Escape alternativo |
| `<C-k>` | `i` | Borrar carácter siguiente (`<Del>`) |
| `<C-o>` | `i` | Insertar nueva línea abajo y salir a modo normal |
| `<A-o>` | `i` | Insertar nueva línea arriba |
| `;;` | `i` | Insertar `;` al final de la línea |
| `<C-h>` | `i` | Mover cursor a la izquierda |
| `<C-l>` | `i` | Mover cursor a la derecha |
| `<A-j>` | `n`, `v` | Mover línea/selección hacia abajo |
| `<A-k>` | `n`, `v` | Mover línea/selección hacia arriba |
| `p` / `P` | `n` | Pegar desde el portapapeles del sistema (`"+p` / `"+P`) |
| `<leader>wd` | `n` | Cerrar ventana actual sin salir de Neovim si es la última |

### Inserción rápida de caracteres (modo insert)

| Atajo | Inserta |
|-------|---------|
| `ññ` | `{ }` |
| `ÑÑ` | Bloque `{\n}` con cursor en medio |
| `ñl` | `[]` |
| `ÑL` | Bloque `[\n]` con cursor en medio |
| `csl` | `console.log()` |

---

## Navegación entre ventanas, splits y tmux

El plugin `tmux.nvim` permite moverse entre splits de Neovim y paneles de tmux sin fronteras.

| Atajo | Modo | Acción |
|-------|------|--------|
| `<C-h>` | `n` | Moverse a la ventana/panel de la izquierda (Neovim + tmux) |
| `<C-j>` | `n` | Moverse a la ventana/panel de abajo (Neovim + tmux) |
| `<C-k>` | `n` | Moverse a la ventana/panel de arriba (Neovim + tmux) |
| `<C-l>` | `n` | Moverse a la ventana/panel de la derecha (Neovim + tmux) |
| `<leader>ñ` | `n` | Elegir ventana con `window-picker` (letras flotantes grandes) |
| `<A-h/j/k/l>` | `n` | Redimensionar ventanas (tmux, si aplica) |

> Nota: `<C-l>` también se usa en `opencode` para enfocar el panel de terminal.

---

## Buffers y tabs

La barra de buffers está gestionada por `bufferline.nvim`.

| Atajo | Modo | Acción |
|-------|------|--------|
| `<A-i>` | `n` | Buffer anterior (`:bprev`) |
| `<A-o>` | `n` | Buffer siguiente (`:bnext`) |
| `<A-u>` | `n` | Seleccionar buffer por letra (`BufferLinePick`) |
| `<leader>1` … `<leader>9` | `n` | Ir al buffer número 1-9 (`BufferLineGoToBuffer`) |
| `<leader>bd` | `n` | Cerrar buffer actual *(LazyVim default)* |
| `<leader>bD` | `n` | Forzar cierre de buffer *(LazyVim default)* |

---

## Neo-tree: explorador de archivos

| Atajo | Modo | Acción |
|-------|------|--------|
| `<leader>e` | `n` | Abrir/cerrar Neo-tree (explorador de archivos) *(LazyVim default)* |
| `<leader>ge` | `n` | Abrir Neo-tree en modo git status *(LazyVim default)* |
| `h` | Neo-tree | Cerrar nodo/carpeta |
| `l` | Neo-tree | Abrir nodo/archivo |
| `s` | Neo-tree | Abrir en split horizontal |
| `v` | Neo-tree | Abrir en split vertical |
| `P` | Neo-tree | Alternar preview flotante |
| `E` | Neo-tree | Expandir todos los nodos |
| `W` | Neo-tree | Colapsar todos los nodos |
| `Y` | Neo-tree | Copiar ruta relativa del nodo al portapapeles |
| `gY` | Neo-tree | Copiar ruta absoluta del nodo al portapapeles |
| `O` | Neo-tree | Abrir nodo con `xdg-open` |

---

## Búsqueda y reemplazo

| Atajo | Modo | Acción |
|-------|------|--------|
| `<leader>fs` | `n`, `x` | Abrir `nvim-rip-substitute` para reemplazo con ripgrep |
| `<leader>rs` | `n` | Abrir `RipSubstitute` (alias) |
| `/` | `n` | Búsqueda incremental con `hlslens` mejorado *(LazyVim default)* |
| `n` / `N` | `n` | Siguiente/anterior coincidencia *(LazyVim default)* |
| `<leader>sg` | `n` | Buscar texto en proyecto (grep) *(LazyVim default)* |
| `<leader>sf` | `n` | Buscar archivos *(LazyVim default)* |

---

## LSP, desarrollo y código

### Lspsaga

| Atajo | Modo | Acción |
|-------|------|--------|
| `gh` | `n` | Ver documentación flotante (`Lspsaga hover_doc`) |
| `gr` | `n` | Buscar referencias (`Lspsaga finder`) |
| `gp` | `n` | Vista previa de definición (`Lspsaga peek_definition`) |
| `gd` | `n` | Ir a definición (`Lspsaga goto_definition`) |
| `<leader>ca` | `n` | Acciones de código (`Lspsaga code_action`) |
| `<leader>rn` | `n` | Renombrar símbolo (`Lspsaga rename`) |
| `[d` | `n` | Diagnóstico anterior (`Lspsaga diagnostic_jump_prev`) |
| `]d` | `n` | Diagnóstico siguiente (`Lspsaga diagnostic_jump_next`) |
| `<leader>sl` | `n` | Mostrar diagnósticos de la línea (`Lspsaga show_line_diagnostics`) |

### Inc-rename

También existe una configuración alternativa con `inc-rename.nvim`:

| Atajo | Modo | Acción |
|-------|------|--------|
| `<leader>rn` | `n` | Iniciar renombrado incremental (`IncRename`) |

> **Conflicto:** `<leader>rn` está asignado tanto a Lspsaga como a Inc-rename. El que se cargue al final será el activo.

### Diagnósticos con Trouble

| Atajo | Modo | Acción |
|-------|------|--------|
| `<leader>xx` | `n` | Abrir/cerrar lista de diagnósticos del workspace |
| `<leader>xX` | `n` | Diagnósticos del buffer actual |
| `<leader>cs` | `n` | Símbolos del archivo |
| `<leader>cl` | `n` | Definiciones/referencias LSP |
| `<leader>xL` | `n` | Lista de ubicaciones (loclist) |
| `<leader>xQ` | `n` | Quickfix list |
| `<leader>xq` | `n` | Cerrar Trouble |

### Aerial: outline de símbolos

| Atajo | Modo | Acción |
|-------|------|--------|
| `<leader>a` | `n` | Abrir/cerrar panel de símbolos (`AerialToggle`) |

### Autocompletado (nvim-cmp + LuaSnip)

| Atajo | Modo | Acción |
|-------|------|--------|
| `<Tab>` | `i`, `s` | Siguiente ítem del menú o siguiente nodo del snippet |
| `<S-Tab>` | `i`, `s` | Ítem anterior del menú o nodo anterior del snippet |
| `<CR>` | `i` | Confirmar selección *(LazyVim default)* |
| `<C-n>` / `<C-p>` | `i` | Navegar por el menú de completion *(LazyVim default)* |

### Formato

| Atajo | Modo | Acción |
|-------|------|--------|
| `<leader>cf` | `n`, `v` | Formatear archivo/selección con conform/prettier *(LazyVim default)* |
| `<leader>uf` | `n` | Alternar autoformato *(LazyVim default)* |

### Otros atajos de desarrollo

| Atajo | Modo | Acción |
|-------|------|--------|
| `<leader>ct` | `n` | Convertir JSON a tipos con `json-to-types` *(comando disponible)* |
| `:QuickType` | `c` | Generar tipos desde JSON/clipboard con `nvim-quicktype` |

---

## Depuración (DAP)

| Atajo | Modo | Acción |
|-------|------|--------|
| `<F8>` | `n` | Continuar / iniciar depuración (`dap.continue`) |
| `<F9>` | `n` | **(Conflictivo)** Está asignado a `dap.step_over` en debugger.lua, pero sobrescrito por `:NeoCodeium toggle` en keymaps.lua |
| `<F10>` | `n` | Entrar en función (`dap.step_into`) |
| `<F11>` | `n` | Salir de función (`dap.step_out`) |
| `<F7>` | `n` | Alternar breakpoint (`dap.toggle_breakpoint`) |
| `<F6>` | `n` | Breakpoint condicional |
| `<leader>db` | `n` | Alternar breakpoint |
| `<leader>dB` | `n` | Breakpoint condicional |
| `<leader>dc` | `n` | Continuar |
| `<leader>di` | `n` | Step into |
| `<leader>dO` | `n` | Step over |
| `<leader>do` | `n` | Step out |
| `<leader>dr` | `n` | Alternar REPL |
| `<leader>dt` | `n` | Terminar depuración |
| `<leader>du` | `n` | Alternar UI de DAP |

### Configuraciones de DAP disponibles

- **Debug Next.js (Server):** lanza `next dev` con `pwa-node`.
- **Debug Node File:** ejecuta el archivo actual con Node.
- **Attach to Node:** adjuntar a un proceso Node en ejecución.
- **Debug Browser (Next.js):** lanza Chrome contra `http://localhost:3000`.
- **Debug Python File:** ejecuta archivo Python con debugpy.

---

## Git

### Gitsigns

| Atajo | Modo | Acción |
|-------|------|--------|
| `]c` | `n` | Siguiente hunk de Git |
| `[c` | `n` | Hunk anterior de Git |
| `<leader>gs` | `n`, `v` | Stage hunk (o selección) |
| `<leader>gr` | `n`, `v` | Reset hunk (o selección) |
| `<leader>gS` | `n` | Stage de todo el buffer |
| `<leader>gR` | `n` | Reset de todo el buffer |
| `<leader>gu` | `n` | Deshacer stage del hunk |
| `<leader>gp` | `n` | Vista previa del hunk |
| `<leader>gP` | `n` | Vista previa inline del hunk |
| `<leader>gb` | `n` | Blame de la línea en popup |
| `<leader>gB` | `n` | Alternar blame virtual de la línea actual |
| `<leader>gd` | `n` | Diff contra index |
| `<leader>gD` | `n` | Diff contra `HEAD~` |
| `<leader>gw` | `n` | Alternar word diff |
| `<leader>gl` | `n` | Alternar resaltado de líneas con cambios |
| `ih` | `o`, `x` | Text object "inside hunk" |

### Diffview

| Atajo | Modo | Acción |
|-------|------|--------|
| `<leader>gvo` | `n` | Abrir diff del repo |
| `<leader>gvc` | `n` | Cerrar Diffview |
| `<leader>gvt` | `n` | Alternar panel de archivos |
| `<leader>gvf` | `n` | Foco en panel de archivos |
| `<leader>gvr` | `n` | Refrescar Diffview |
| `<leader>gvh` | `n`, `v` | Historial del archivo actual/selección |
| `<leader>gvH` | `n` | Historial de todo el repo |
| `q` | `n` (en Diffview) | Cerrar Diffview |

### LazyGit

| Atajo | Modo | Acción |
|-------|------|--------|
| `<leader>gg` | `n` | Abrir LazyGit *(LazyVim default)* |
| `<leader>gG` | `n` | Abrir LazyGit en ruta actual *(LazyVim default)* |

---

## Terminal y ejecución de código

| Atajo | Modo | Acción |
|-------|------|--------|
| `<F5>` | `n` | Ejecutar archivo `.js` con Node o `.ts` con Deno (salida flotante) |
| `<leader>ft` | `n` | Abrir terminal flotante *(LazyVim default)* |
| `<leader>fT` | `n` | Abrir terminal en split *(LazyVim default)* |
| `<Esc><Esc>` | `t` | Salir del modo terminal y volver al editor (usado en opencode) |

---

## IA: NeoCodeium y Opencode

### NeoCodeium

| Atajo | Modo | Acción |
|-------|------|--------|
| `<F9>` | `n` | Alternar NeoCodeium (activar/desactivar sugerencias) |
| `<A-m>` | `i` | Aceptar sugerencia completa |
| `<A-l>` | `i` | Aceptar línea sugerida |
| `<A-w>` | `i` | Aceptar palabra sugerida |
| `<A-n>` | `i` | Siguiente sugerencia / completar |
| `<A-b>` | `i` | Sugerencia anterior |
| `<A-k>` | `i` | Limpiar sugerencia |
| `<leader>cn` | `n` | Abrir chat de NeoCodeium |

### Opencode

| Atajo | Modo | Acción |
|-------|------|--------|
| `<leader>oa` | `n`, `x` | Preguntar a opencode sobre `@this` |
| `<leader>os` | `n`, `x` | Seleccionar acción de opencode |
| `<leader>ot` | `n`, `t` | Alternar terminal de opencode |
| `<leader>oS` | `n` | Iniciar opencode |
| `<leader>o<CR>` | `n` | Seleccionar sesión de opencode |
| `go` | `n`, `x` | Añadir rango a opencode (operador) |
| `goo` | `n` | Añadir línea actual a opencode |
| `<S-C-u>` | `n`, `t` | Página arriba en sesión |
| `<S-C-d>` | `n`, `t` | Página abajo en sesión |
| `<leader>ob` | `n`, `x` | Preguntar sobre el buffer completo |
| `<leader>od` | `n`, `x` | Preguntar sobre diagnósticos |
| `<leader>og` | `n`, `x` | Preguntar sobre git diff |
| `<leader>oc` | `n` | Ejecutar comando de opencode |
| `<leader>op` | `n`, `x` | Prompt opencode (sin enviar) |
| `<leader>or` | `n`, `x` | Review de código |
| `<leader>oe` | `n`, `x` | Explicar código |
| `<leader>oT` | `n`, `x` | Añadir tests |
| `<leader>of` | `n`, `x` | Arreglar código |
| `<leader>oR` | `n`, `x` | Refactorizar código |
| `<C-l>` | `n` | Enfocar panel de terminal de opencode |
| `<A-a>` | `n`, `i` (en picker) | Enviar selección a opencode desde snacks picker |

> Windsurf también está configurado pero **deshabilitado** (`enabled = false`).

---

## Markdown

| Atajo | Modo | Acción |
|-------|------|--------|
| `<leader>mr` | `n` | Renderizar/actualizar markdown (`RenderMarkdown`) |
| `<leader>mf` | `n` | Refrescar renderizado (`RenderMarkdownRefresh`) |
| `<leader>mp` | `n` | Vista previa en navegador (`MarkdownPreview`) *(LazyVim default)* |
| `:TableModeToggle` | `c` | Alternar modo tabla automática |

### Plugins de Markdown activos

- `render-markdown.nvim`: renderiza encabezados, checkboxes, código y citas en el buffer.
- `headlines.nvim`: resalta encabezados con fondos de color.
- `vim-table-mode`: tablas automáticas.
- `markdown-preview.nvim`: vista previa en navegador.

---

## Snippets (LuaSnip)

Los snippets se cargan desde `~/.config/nvim/lua/snippets/`.

### Snippets globales (`all`)

| Trigger | Descripción |
|---------|-------------|
| `nexorem` | Inserta el prompt/contexto del proyecto Nexorem (Next.js 15, TypeScript, Tailwind, Supabase, etc.) |

### Snippets de JavaScript / TypeScript

| Trigger | Expansión |
|---------|-----------|
| `csl` | `console.log(msg)` |
| `holamundo` | `saludos mundo` |
| `ña` | `(arg)=>{ cuerpo }` |
| `ñf` | `function name(args){ cuerpo }` |
| `jfn` | Función con cuerpo en bloque |

### Uso de snippets

- Escribe el trigger y presiona la tecla de expansión de LuaSnip (normalmente `<Tab>` si el menú de cmp está visible).
- Usa `<Tab>` / `<S-Tab>` para saltar entre nodos de un snippet activo.

---

## Temas visuales

La configuración incluye varios temas. El tema activo por defecto es **solarized-osaka**.

### Cambiar de tema

| Atajo | Modo | Acción |
|-------|------|--------|
| `<leader>uC` | `n` | Abrir selector de colores/temas *(LazyVim default)* |

### Temas disponibles

- `solarized-osaka` (activo por defecto)
- `evergarden`
- `catppuccin` (comentado)
- `catppuccin-latte` (comentado)
- `evergarden-summer` (comentado)
- `tokyonight` (comentado)
- `gruvbox` (comentado)
- `github_dark` (comentado)

### Funciones de tema personalizadas (`ConfigMyColor`)

Cada tema aplica automáticamente:

- Color de fondo de Neo-tree según foco.
- Color de fondo de ventana activa/inactiva.
- Color del gutter (números de línea) según foco.
- Color del texto seleccionado (Visual).
- Color del cursor y de la línea del cursor.
- Colores del menú de autocompletado (Pmenu).

### Cursor

El cursor cambia de color según el estado de **Bloq Mayús** (Caps Lock) en entornos X11. También cambia el color de la línea del cursor.

### Barra de título flotante (incline)

`incline.nvim` muestra el nombre del archivo en la esquina superior de cada ventana con colores GitHub Dark.

### Scrollbar

`nvim-scrollbar` muestra una barra de desplazamiento a la derecha con marcas de búsqueda, git y diagnósticos.

### Minimap

| Atajo | Modo | Acción |
|-------|------|--------|
| `<leader>mm` | `n` | Alternar minimapa (`mini.map`) |
| `<leader>MM` | `n` | Enfocar el minimapa |

---

## Plugins instalados

### Plugins personalizados (en `lua/plugins/`)

| Plugin | Propósito |
|--------|-----------|
| `aerial.nvim` | Outline de símbolos del archivo |
| `bufferline.nvim` | Barra de pestañas/buffers estilizada |
| `nvim-colorizer.lua` | Muestra colores hex/rgb en pantalla |
| `conform.nvim` | Formateo con prettier |
| `nvim-dap` + `nvim-dap-ui` | Depuración adaptativa |
| `nvim-web-devicons` | Iconos de archivos personalizados |
| `diffview.nvim` | Vista de diffs y historial de Git |
| `nvim-lspconfig` (eslint) | Configuración de ESLint |
| `trouble.nvim` | Lista de diagnósticos, símbolos y referencias |
| `gitsigns.nvim` | Signos de Git en el gutter y acciones de hunk |
| `nvim-hlslens` | Mejora la navegación de búsquedas |
| `jest.nvim` | Ejecutar tests con Jest |
| `json-to-types.nvim` | Convertir JSON a tipos |
| `lspsaga.nvim` | Mejoras visuales para LSP |
| `LuaSnip` | Motor de snippets |
| `render-markdown.nvim` | Renderizado de Markdown |
| `headlines.nvim` | Resaltado de encabezados Markdown |
| `vim-table-mode` | Tablas automáticas en Markdown |
| `markdown-preview.nvim` | Vista previa de Markdown en navegador |
| `mason-nvim-dap.nvim` | Integración Mason + DAP |
| `mini.files` | Explorador alternativo (deshabilitado) |
| `mini.map` | Minimap lateral |
| `vim-visual-multi` | Múltiples cursores |
| `neocodeium` | Autocompletado con IA (alternativa a Copilot) |
| `neo-tree.nvim` | Explorador de archivos |
| `nvim-autopairs` | Pares de caracteres automáticos |
| `nvim-cmp` | Autocompletado avanzado |
| `opencode.nvim` | Integración con opencode (agente IA) |
| `persistence.nvim` | Guardado y restauración de sesiones |
| `precognition.nvim` | Muestra atajos disponibles (configuración por defecto) |
| `mason.nvim` + prettier | Instalación de formateadores |
| `nvim-quicktype` | Generar tipos desde JSON |
| `rainbow-delimiters.nvim` | Colorea paréntesis/corchetes por pares |
| `inc-rename.nvim` | Renombrado incremental con vista previa |
| `nvim-rip-substitute` | Reemplazo potenciado por ripgrep |
| `nvim-scrollbar` | Barra de desplazamiento estilizada |
| `tmux.nvim` | Integración con tmux |
| `todo-comments.nvim` | Resalta TODO, FIXME, etc. |
| `vim-translator` | Traducción con Google |
| `noice.nvim` | Mejora de mensajes, cmdline y notificaciones |
| `nvim-notify` | Notificaciones estilizadas |
| `incline.nvim` | Barra de título flotante por ventana |
| `vtsls` | Servidor LSP para TypeScript (reemplaza ts_ls) |
| `nvim-window-picker` | Selector visual de ventanas |
| `windsurf.vim` | Alternativa a Copilot (deshabilitado) |

### Extras de LazyVim activados (`lazyvim.json`)

- `lazyvim.plugins.extras.coding.luasnip`
- `lazyvim.plugins.extras.coding.yanky`
- `lazyvim.plugins.extras.formatting.prettier`
- `lazyvim.plugins.extras.lang.toml`
- `lazyvim.plugins.extras.lang.typescript`

Además, en `lazy.lua` se importan:
- `lazyvim.plugins.extras.lang.json`
- `lazyvim.plugins.extras.ui.mini-animate`

---

## Opciones importantes

| Opción | Valor | Descripción |
|--------|-------|-------------|
| `vim.g.mapleader` | `" "` | Tecla líder |
| `vim.g.maplocalleader` | `"\\"` | Local leader |
| `vim.g.autoformat` | `true` | Formateo automático |
| `vim.g.lazyvim_picker` | `"auto"` | Selector de archivos automático |
| `opt.clipboard` | `"unnamedplus"` | Sincronizar con portapapeles del sistema |
| `opt.swapfile` | `false` | Sin archivos swap |
| `opt.number` | `true` | Números de línea |
| `opt.relativenumber` | `false` | Números relativos desactivados |
| `opt.wrap` | `true` | Ajuste de línea activado |
| `opt.tabstop` | `2` | Tamaño de tabulación |
| `opt.shiftwidth` | `2` | Tamaño de indentación |
| `opt.expandtab` | `true` | Usar espacios en lugar de tabs |
| `opt.cursorline` | `true` | Resaltar línea del cursor |
| `opt.termguicolors` | `true` | Colores truecolor |
| `opt.undofile` | `true` | Historial de deshacer persistente |
| `opt.timeoutlen` | `300` | Tiempo para detectar secuencias de teclas |
| `opt.conceallevel` | `2` | Ocultar ciertos marcadores de markup |
| `opt.spelllang` | `{"en"}` | Idioma de corrección ortográfica |
| `opt.sessionoptions` | sin `buffers` | No guardar buffers en sesiones |

---

## Autocomandos

| Evento | Acción |
|--------|--------|
| `FocusGained`, `BufEnter`, `FileChangedShell` | Recargar archivo si cambió en disco (`checktime`) |
| `BufNew` | Ocultar buffers sin nombre para sesiones limpias |
| `FileType markdown/text/gitcommit` | Desactivar corrección ortográfica |
| `BufLeave`, `FocusLost`, `VimLeavePre` | Auto-guardar buffers modificables si tienen nombre de archivo |
| `ModeChanged` | Cambiar color del separador de Neo-tree según modo (normal/insert/visual) |
| `TermEnter` / `TermLeave` | Pausar/reanudar timer del cursor según Caps Lock |
| `ColorScheme` | Reaplicar configuración de colores personalizada |

---

## Notas y conflictos conocidos

1. **`<F9>` tiene dos asignaciones:**
   - `debugger.lua`: `dap.step_over`
   - `keymaps.lua`: `:NeoCodeium toggle`
   - **Ganador real:** el último en cargar, que es `:NeoCodeium toggle`. Si quieres usar `<F9>` para depuración, debes cambiar uno de los dos.

2. **`<leader>rn` tiene dos asignaciones:**
   - `rename-variable.lua`: `IncRename`
   - `lspsaga.lua`: `Lspsaga rename`
   - **Ganador real:** el último en cargar. Actualmente gana Lspsaga.

3. **`<C-l>` en modo normal:** se usa para moverse a la ventana derecha (tmux) y también para enfocar la terminal de opencode. Si hay una terminal de opencode visible, `<C-l>` la enfoca; de lo contrario, actúa como navegación de tmux.

4. **`mini.files` está deshabilitado** (`enabled = false`). Se usa `neo-tree.nvim` como explorador principal.

5. **`windsurf.vim` está deshabilitado**. El motor de IA activo es `neocodeium`.

6. **ESLint no publica diagnósticos:** en la configuración de `nvim-lspconfig`, `eslint` tiene desactivado `diagnosticProvider` y `publishDiagnostics` para evitar duplicados con `vtsls`.

7. **vtsls reemplaza ts_ls:** `ts_ls` está desactivado (`enabled = false`) y se usa `vtsls` para TypeScript/JavaScript/JSX/TSX.

---

## Archivos clave de la configuración

```
~/.config/nvim/
├── init.lua                          # Punto de entrada
├── lazyvim.json                      # Extras de LazyVim activados
├── lua/config/
│   ├── lazy.lua                      # Configuración de lazy.nvim
│   ├── options.lua                   # Opciones de Neovim
│   ├── keymaps.lua                   # Keymaps personalizados
│   ├── autocmds.lua                  # Autocomandos
│   ├── cursor.lua                    # Cursor según Caps Lock
│   └── colorVerticalBar.lua          # Color del separador según modo
├── lua/plugins/                      # Plugins personalizados
├── lua/mycode/
│   ├── myconfig/
│   │   ├── personal-config.lua       # Helpers de colores
│   │   ├── personalThemeConfig.lua   # Configuración por tema
│   │   └── keymaps/                  # Keymaps modulares
│   ├── style/colors.lua              # Paletas de colores
│   ├── style/themes/                 # Configuraciones de temas
│   └── execute/runCode.lua           # Ejecutar JS/TS
├── lua/snippets/                     # Snippets LuaSnip
└── copilot_prompts/myprompt.lua      # Prompt de contexto Nexorem
```

---

## Consejos rápidos

- Presiona `<leader>` y espera un momento para ver el menú de **Which-Key** con todos los atajos disponibles.
- Usa `<leader>uC` para cambiar el tema de colores al vuelvo.
- Usa `<leader>e` para abrir/cerrar el explorador de archivos.
- Usa `<leader>ff` para buscar archivos y `<leader>sg` para buscar texto.
- Usa `<leader>xx` para ver todos los errores y advertencias del proyecto.
- Para depurar Next.js, usa `<F8>` con la configuración "Debug Next.js (Server)".
- Para traducir, coloca el cursor sobre una palabra y presiona `<leader>th`.
