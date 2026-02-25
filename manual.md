# Manual de Uso - Neovim con LazyVim

## Tabla de Contenidos

1. [Introduccion](#1-introduccion)
2. [Conceptos Fundamentales](#2-conceptos-fundamentales)
3. [Estructura del Proyecto](#3-estructura-del-proyecto)
4. [Plugins Instalados](#4-plugins-instalados)
5. [Servidores LSP](#5-servidores-lsp)
6. [Formateadores y Linters](#6-formateadores-y-linters)
7. [Depuracion (DAP)](#7-depuracion-dap)
8. [Autocompletado e IA](#8-autocompletado-e-ia)
9. [Treesitter](#9-treesitter)
10. [Guia Completa de Atajos de Teclado](#10-guia-completa-de-atajos-de-teclado)
11. [Snippets Personalizados](#11-snippets-personalizados)
12. [Temas Disponibles](#12-temas-disponibles)
13. [Modulos Personalizados](#13-modulos-personalizados)
14. [Conflictos Conocidos](#14-conflictos-conocidos)
15. [Flujo de Arranque](#15-flujo-de-arranque)
16. [Comandos Utiles](#16-comandos-utiles)

---

## 1. Introduccion

Esta configuracion esta basada en **LazyVim**, una distribucion preconfigurada de Neovim que proporciona
una experiencia moderna de desarrollo lista para usar. Utiliza **lazy.nvim** como gestor de plugins
y esta orientada al desarrollo **JavaScript/TypeScript/Next.js**.

| Dato | Valor |
|------|-------|
| Framework base | LazyVim |
| Gestor de plugins | lazy.nvim (73 plugins) |
| Tecla Leader | `Espacio` |
| Tecla Local Leader | `\` |
| Tema activo | solarized-osaka |
| Autoformato | Activado (prettier al guardar) |
| Enfoque | JavaScript / TypeScript / Next.js |

---

## 2. Conceptos Fundamentales

### Que es LazyVim

LazyVim es una distribucion de Neovim que preconfigura decenas de plugins, atajos y servidores de lenguaje.
En lugar de configurar todo desde cero, LazyVim proporciona valores sensatos por defecto que puedes
extender o sobrescribir.

### Que es la Tecla Leader

La tecla **Leader** es `Espacio`. Funciona como prefijo para la mayoria de los atajos personalizados.
Cuando veas `Leader x`, significa presionar `Espacio` seguido de `x`.

Al presionar Leader y esperar un momento, aparece un popup (via **which-key.nvim**) mostrando
todos los atajos disponibles organizados por categoria.

### Modos de Vim

| Modo | Letra | Como entrar | Descripcion |
|------|-------|-------------|-------------|
| Normal | `n` | `Esc` o `º` | Modo por defecto. Navegacion y comandos |
| Insert | `i` | `i`, `a`, `o` | Escritura de texto |
| Visual | `v` | `v`, `V`, `Ctrl+v` | Seleccion de texto |
| Command | `c` | `:` | Ejecutar comandos Ex |
| Terminal | `t` | `:terminal` | Terminal integrada |

### Como Guardar y Salir

| Atajo | Accion |
|-------|--------|
| `Ctrl+s` | Guardar archivo (funciona en normal e insert) |
| `:w` | Guardar archivo |
| `:q` | Cerrar ventana |
| `:wq` | Guardar y cerrar |
| `Esc Esc` | Forzar cierre (:q!) |

---

## 3. Estructura del Proyecto

```
~/.config/nvim/
|
|-- init.lua                        Punto de entrada principal
|-- lazy-lock.json                  Versiones exactas de los 73 plugins
|-- lazyvim.json                    Extras de LazyVim activados
|-- .neoconf.json                   Configuracion de workspace LSP
|-- stylua.toml                     Configuracion del formateador de Lua
|
|-- lua/
|   |-- config/                     CONFIGURACION CENTRAL
|   |   |-- lazy.lua                  Bootstrap de lazy.nvim y spec de plugins
|   |   |-- options.lua               Opciones del editor (leader, clipboard, folds)
|   |   |-- keymaps.lua               Hub central de atajos (carga submodulos)
|   |   |-- autocmds.lua              Autocomandos personalizados
|   |   |-- cursor.lua                Deteccion de Caps Lock para color de cursor
|   |   |-- colorVerticalBar.lua      Color del separador de NeoTree por modo
|   |
|   |-- plugins/                    CONFIGURACION DE PLUGINS (38 archivos)
|   |   |-- aerial.lua                Panel de simbolos
|   |   |-- bufferline.lua            Barra de tabs/buffers
|   |   |-- colorizer.lua             Preview inline de colores
|   |   |-- colorScheme.lua           Cargador de temas
|   |   |-- conform.lua               Formateador (prettier)
|   |   |-- dap.lua                   Depuracion (JS/TS/Python/Next.js/Chrome)
|   |   |-- devicons.lua              Iconos por tipo de archivo
|   |   |-- eslint.lua                ESLint como LSP
|   |   |-- folke-trouble.lua         Visor de diagnosticos
|   |   |-- gitBlame.lua              Git signs en el gutter
|   |   |-- hlslens.lua               Mejora visual de busqueda
|   |   |-- jest.lua                  Runner de tests Jest
|   |   |-- json-to-types.lua         JSON a tipos TypeScript
|   |   |-- lsp-saga.lua              UI mejorada para LSP
|   |   |-- luasnip.lua               Motor de snippets
|   |   |-- markdown.lua              Ecosistema de markdown
|   |   |-- mason-dap.lua             Instalador de adaptadores de debug
|   |   |-- minimap.lua               Minimapa estilo VS Code
|   |   |-- multicursor.lua           Multiples cursores
|   |   |-- neo-tree.lua              Explorador de archivos
|   |   |-- neocodeium.lua            IA autocompletado (Codeium)
|   |   |-- nvimAutopairs.lua         Cierre automatico de pares
|   |   |-- nvimcmp.lua               Motor de completado
|   |   |-- opencode.lua              Asistente de IA completo
|   |   |-- persistence.lua           Persistencia de sesiones
|   |   |-- precognition.lua          Hints de motions
|   |   |-- prettier.lua              Asegurar instalacion de prettier
|   |   |-- quicktype.lua             Generacion automatica de tipos
|   |   |-- rainbowDelimeters.lua     Parentesis arcoiris
|   |   |-- rename.lua                Rename con preview en vivo
|   |   |-- rip.lua                   Buscar/reemplazar con ripgrep
|   |   |-- scrollbar.lua             Scrollbar estilo VS Code
|   |   |-- tmux.lua                  Integracion con tmux
|   |   |-- todo-comments.lua         Resaltado de TODO/FIXME/HACK
|   |   |-- translator.lua            Traductor Google (espanol)
|   |   |-- ui.lua                    Noice + notify + incline
|   |   |-- window-picker.lua         Seleccion visual de ventanas
|   |   `-- windsurf.lua              IA Windsurf (DESACTIVADO)
|   |
|   |-- mycode/                     CODIGO PERSONALIZADO
|   |   |-- execute/
|   |   |   `-- runCode.lua           Ejecutar JS/TS con F5
|   |   |-- myconfig/
|   |   |   |-- personal-config.lua   API de colores y configuracion
|   |   |   |-- personalThemeConfig.lua  Dispatcher de temas
|   |   |   `-- keymaps/              SUBMODULOS DE ATAJOS (11 archivos)
|   |   |       |-- Map-main.lua        Funcion helper map()
|   |   |       |-- bufferline-picker.lua
|   |   |       |-- debugger.lua        Teclas F para debug
|   |   |       |-- markdown.lua
|   |   |       |-- necodeium-chat.lua
|   |   |       |-- numeric-tabs.lua    Leader 1-9
|   |   |       |-- rename-variable.lua
|   |   |       |-- tabs-move.lua       Alt-i/o buffers
|   |   |       |-- tmux-move.lua       Ctrl-hjkl paneles
|   |   |       `-- window-picker.lua
|   |   `-- style/
|   |       |-- colors.lua            Paletas de colores globales
|   |       `-- themes/               19 DEFINICIONES DE TEMAS
|   |
|   |-- snippets/                   SNIPPETS PERSONALIZADOS
|   |   |-- all.lua                   Snippets globales
|   |   |-- typescript.lua            Snippets TS
|   |   `-- javascript.lua            Snippets JS
|   |
|   `-- copilot_prompts/
|       `-- myprompt.lua              Prompt del proyecto Nexorem
|
`-- extra/                          BACKUPS DE DOTFILES
    |-- alacritty/                    Config de Alacritty
    |-- tmux.conf                     Config de tmux
    `-- backup2026/                   Backups comprimidos
```

---

## 4. Plugins Instalados

### 4.1 Navegacion y Exploración

| Plugin | Descripcion | Uso |
|--------|-------------|-----|
| **neo-tree.nvim** | Arbol de archivos lateral | Navegar el proyecto visualmente. `Y` dentro del arbol copia la ruta relativa |
| **fzf-lua** | Buscador difuso | Buscar archivos, texto, buffers, etc. con fuzzy matching |
| **flash.nvim** | Saltos rapidos | Navegar a cualquier posicion visible con labels de 1-2 letras |
| **aerial.nvim** | Panel de simbolos | Muestra funciones, clases, variables del archivo actual en un sidebar |
| **precognition.nvim** | Hints de motions | Muestra visualmente a donde te llevaria cada motion antes de ejecutarla |
| **nvim-hlslens** | Lens de busqueda | Al buscar con `/`, muestra conteo y posicion actual de resultados |
| **nvim-window-picker** | Selector de ventanas | Muestra letras grandes sobre cada ventana para saltar a ella |

### 4.2 Interfaz de Usuario

| Plugin | Descripcion | Uso |
|--------|-------------|-----|
| **bufferline.nvim** | Barra de tabs | Muestra todos los buffers abiertos como pestanas en la parte superior con iconos y diagnosticos |
| **lualine.nvim** | Barra de estado | Linea inferior con info de modo, archivo, git branch, diagnosticos, encoding |
| **noice.nvim** | UI moderna | Reemplaza la linea de comandos nativa, mensajes y popups con ventanas flotantes |
| **nvim-notify** | Notificaciones | Muestra notificaciones como toasts flotantes con animacion |
| **incline.nvim** | Labels flotantes | Muestra el nombre del archivo en la esquina superior de cada ventana |
| **nvim-colorizer.lua** | Colores inline | Resalta codigos de color en el texto con su color real (ej: `#ff0000` aparece en rojo) |
| **nvim-scrollbar** | Scrollbar | Barra de desplazamiento estilo VS Code con marcadores de busqueda, git y errores |
| **mini.map** | Minimapa | Vista miniatura del codigo al estilo VS Code en el lado derecho |
| **mini.animate** | Animaciones | Transiciones suaves para scroll, cambio de cursor y redimensionado |
| **nvim-web-devicons** | Iconos | Iconos por tipo de archivo en NeoTree, bufferline, statusline, etc. |
| **which-key.nvim** | Guia de atajos | Popup que muestra todos los atajos disponibles al presionar Leader |
| **rainbow-delimiters.nvim** | Parentesis arcoiris | Colorea los pares de parentesis/llaves/corchetes anidados con colores diferentes |

### 4.3 Edicion

| Plugin | Descripcion | Uso |
|--------|-------------|-----|
| **vim-visual-multi** | Multi-cursor | Editar multiples posiciones simultaneamente, como en VS Code |
| **nvim-autopairs** | Auto-pares | Al escribir `(` automaticamente inserta `)` y coloca el cursor dentro |
| **mini.pairs** | Auto-pares (LazyVim) | Complemento de autopairs integrado en LazyVim |
| **inc-rename.nvim** | Rename en vivo | Renombrar variables/funciones viendo los cambios en tiempo real antes de aplicar |
| **nvim-rip-substitute** | Buscar/reemplazar | Usa ripgrep para buscar y reemplazar texto en el buffer actual |
| **grug-far.nvim** | Busqueda global | Buscar y reemplazar en todo el proyecto |
| **yanky.nvim** | Yank mejorado | Historial de yank/paste y ciclo entre registros |
| **mini.ai** | Text objects | Objetos de texto avanzados: seleccionar funcion, argumento, bloque con `a`/`i` + caracter |
| **nvim-ts-autotag** | Auto-tags | Cierre y renombrado automatico de tags HTML/JSX |
| **ts-comments.nvim** | Comentarios | Comentar/descomentar con awareness de treesitter |
| **todo-comments.nvim** | Resaltado TODO | Resalta y permite buscar TODO, FIXME, HACK, WARN, NOTE, PERF, TEST en el codigo |

### 4.4 Git

| Plugin | Descripcion | Uso |
|--------|-------------|-----|
| **gitsigns.nvim** | Git en gutter | Muestra lineas agregadas/modificadas/eliminadas en el margen izquierdo, blame inline, preview de hunks |

### 4.5 LSP y Diagnosticos

| Plugin | Descripcion | Uso |
|--------|-------------|-----|
| **nvim-lspconfig** | Configuracion LSP | Configura servidores de lenguaje automaticamente |
| **mason.nvim** | Instalador de herramientas | Instala y gestiona LSP servers, formatters, linters y DAP adapters |
| **mason-lspconfig.nvim** | Puente Mason-LSP | Conecta mason con lspconfig para instalacion automatica |
| **lspsaga.nvim** | UI mejorada LSP | Reemplaza las interfaces nativas de LSP con ventanas flotantes para hover, finder, peek, rename, code actions, diagnosticos |
| **trouble.nvim** | Panel diagnosticos | Muestra todos los errores, warnings, referencias y simbolos en un panel dedicado |
| **SchemaStore.nvim** | Schemas JSON | Proporciona schemas para validar package.json, tsconfig.json, etc. |
| **lazydev.nvim** | Dev Lua | Autocompletado de la API de Neovim al editar archivos Lua |

### 4.6 Completado y Snippets

| Plugin | Descripcion | Uso |
|--------|-------------|-----|
| **blink.cmp** | Motor de completado | Motor principal de autocompletado (default de LazyVim moderno) |
| **nvim-cmp** | Motor de completado | Motor secundario con Tab/S-Tab personalizado |
| **LuaSnip** | Motor de snippets | Expande snippets personalizados y de friendly-snippets |
| **friendly-snippets** | Coleccion de snippets | Cientos de snippets predefinidos para multiples lenguajes |

### 4.7 Inteligencia Artificial

| Plugin | Descripcion | Uso |
|--------|-------------|-----|
| **neocodeium** | Autocompletado IA | Alternativa a GitHub Copilot. Sugiere codigo inline en tiempo real |
| **opencode.nvim** | Asistente IA | Asistente completo: review, tests, explain, fix, refactor, optimize, debug |
| **windsurf.vim** | Autocompletado IA | Alternativa de IA -- **DESACTIVADO** |

### 4.8 Debug

| Plugin | Descripcion | Uso |
|--------|-------------|-----|
| **nvim-dap** | Protocolo de debug | Motor principal de depuracion con soporte para Node.js, Chrome, Python |
| **nvim-dap-ui** | UI de debug | Paneles de variables, stack, breakpoints, consola, watch |
| **nvim-dap-virtual-text** | Texto inline debug | Muestra valores de variables inline durante la depuracion |
| **mason-nvim-dap.nvim** | Puente Mason-DAP | Instala adaptadores de debug automaticamente |

### 4.9 Markdown

| Plugin | Descripcion | Uso |
|--------|-------------|-----|
| **render-markdown.nvim** | Render inline | Renderiza markdown dentro del buffer: encabezados con colores, checkboxes, codigo con fondo, bullets |
| **headlines.nvim** | Encabezados | Resalta encabezados markdown con colores de fondo |
| **vim-table-mode** | Tablas | Crea y edita tablas markdown con alineacion automatica |
| **markdown-preview.nvim** | Preview navegador | Abre preview del markdown en el navegador con live reload |

### 4.10 Utilidades

| Plugin | Descripcion | Uso |
|--------|-------------|-----|
| **persistence.nvim** | Sesiones | Guarda y restaura sesiones automaticamente (buffers, tabs, ventanas) |
| **vim-translator** | Traductor | Traduce texto con Google Translate. Configurado con destino espanol |
| **json-to-types.nvim** | JSON a tipos | Convierte objetos JSON a interfaces/tipos TypeScript |
| **nvim-quicktype** | Generador de tipos | Genera tipos desde JSON para TS, Python, Java, Go, Rust, C#, Swift, Kotlin |
| **tmux.nvim** | Integracion tmux | Navegacion transparente entre paneles tmux/nvim, resize y sync de clipboard |
| **jest.nvim** | Test runner | Ejecuta tests Jest para proyectos Next.js/React |
| **snacks.nvim** | Utilidades Folke | Coleccion de micro-utilidades (usado por opencode.nvim entre otros) |
| **plenary.nvim** | Libreria Lua | Funciones utilitarias de Lua usadas por muchos plugins |
| **nui.nvim** | Componentes UI | Libreria de componentes de UI usada por neo-tree, noice, etc. |
| **nvim-nio** | Async I/O | Libreria de operaciones asincronas usada por dap-ui |

---

## 5. Servidores LSP

Los servidores LSP (Language Server Protocol) analizan tu codigo en tiempo real proporcionando:
autocompletado inteligente, deteccion de errores, ir a definicion, encontrar referencias,
refactoring, y mas.

### 5.1 Servidores Configurados

| Servidor | Lenguajes | Fuente | Descripcion |
|----------|-----------|--------|-------------|
| **ts_ls** | TypeScript, JavaScript, JSX, TSX | LazyVim extra `lang.typescript` | Servidor principal. Autocompletado, diagnosticos, refactoring, auto-imports |
| **eslint** | JS/TS | `plugins/eslint.lua` | Linting. **Diagnosticos desactivados** para no duplicar con ts_ls. Solo provee code actions (auto-fix) |
| **jsonls** | JSON | LazyVim extra `lang.json` | Validacion con schemas (package.json, tsconfig, etc.) via SchemaStore |
| **lua_ls** | Lua | LazyVim core | Para editar la propia configuracion de Neovim, con autocompletado de la API |
| **taplo** | TOML | LazyVim extra `lang.toml` | Para archivos de configuracion TOML |

### 5.2 Lspsaga - Interfaz LSP Mejorada

Lspsaga reemplaza las interfaces nativas de Neovim para las funciones LSP con ventanas
flotantes mas elegantes y funcionales.

**Funciones principales:**

- **Hover Doc** (`gh`): Muestra documentacion de la funcion/variable bajo el cursor en un popup flotante
- **Finder** (`gr`): Busca todas las referencias e implementaciones en un panel con preview
- **Peek Definition** (`gp`): Muestra la definicion en una ventana flotante sin salir del archivo actual
- **Go to Definition** (`gd`): Navega directamente al archivo donde esta definida la funcion/variable
- **Code Action** (`Leader ca`): Menu de acciones disponibles (auto-fix, auto-import, extraer funcion, etc.)
- **Rename** (`Leader rn`): Renombra un simbolo en todo el proyecto con preview en vivo
- **Diagnostics** (`Leader sl`): Muestra los errores/warnings de la linea actual en detalle
- **Lightbulb**: Un icono aparece en el gutter cuando hay code actions disponibles
- **Winbar**: Muestra breadcrumbs del simbolo actual en la parte superior del buffer

**Navegacion dentro de ventanas Lspsaga:**

| Tecla | Accion |
|-------|--------|
| `o` | Ejecutar accion / toggle |
| `q` / `Esc` | Cerrar ventana |
| `Enter` | Confirmar / Ejecutar |
| `s` | Abrir en split vertical |
| `i` | Abrir en split horizontal |
| `t` | Abrir en nueva pestana |
| `Ctrl+f` | Scroll abajo en preview |
| `Ctrl+b` | Scroll arriba en preview |

---

## 6. Formateadores y Linters

### 6.1 Prettier (Formateador Principal)

**Plugin:** conform.nvim
**Herramienta:** prettier (instalado via Mason)

Prettier formatea automaticamente tu codigo al guardar. Esta configurado para los siguientes
tipos de archivo:

| Tipo de archivo | Extension |
|-----------------|-----------|
| JavaScript | `.js` |
| TypeScript | `.ts` |
| JSX | `.jsx` |
| TSX | `.tsx` |
| JSON | `.json` |
| HTML | `.html` |
| CSS | `.css` |
| Markdown | `.md` |

**Comportamiento:**
- Formatea automaticamente al guardar (`autoformat = true`)
- Usa la configuracion de prettier del proyecto (`.prettierrc`, `package.json`, etc.)
- Si no hay configuracion local, usa los defaults de prettier

### 6.2 Stylua (Formateador de Lua)

Para archivos `.lua`, se usa stylua. La configuracion esta en `stylua.toml` en la raiz
de la config de Neovim.

### 6.3 ESLint

ESLint esta configurado como servidor LSP (no como linter independiente).
Sus diagnosticos estan **intencionalmente desactivados** para evitar duplicados con ts_ls.
ESLint solo proporciona:
- Code actions (auto-fix de reglas ESLint)
- Auto-deteccion del directorio de trabajo

---

## 7. Depuracion (DAP)

El Debug Adapter Protocol permite depurar codigo directamente desde Neovim, con breakpoints,
inspeccion de variables, paso a paso, y mas.

### 7.1 Configuraciones de Debug Disponibles

#### JavaScript / TypeScript

| Nombre | Descripcion | Uso |
|--------|-------------|-----|
| **Debug Next.js (Server)** | Lanza `next dev` y se conecta al servidor | Para depurar APIs y server-side rendering |
| **Debug Node File** | Ejecuta el archivo actual con Node.js | Para depurar scripts individuales |
| **Attach to Node** | Se conecta a un proceso Node.js corriendo | Para depurar servidores ya iniciados |

#### React / JSX / TSX

| Nombre | Descripcion | Uso |
|--------|-------------|-----|
| **Debug Browser (Next.js)** | Abre Chrome apuntando a localhost:3000 | Para depurar componentes React en el frontend |

#### Python

| Nombre | Descripcion | Uso |
|--------|-------------|-----|
| **Debug Python File** | Ejecuta el archivo Python actual | Para depurar scripts Python |

### 7.2 Soporte para launch.json

Si tu proyecto tiene un archivo `.vscode/launch.json`, DAP lo lee automaticamente y
agrega esas configuraciones a las disponibles.

### 7.3 Interfaz de Debug (DAP-UI)

Al iniciar una sesion de debug, se abre automaticamente la UI con:

- **Panel de Variables**: Muestra variables locales, globales y sus valores
- **Panel de Stack**: Muestra la pila de llamadas
- **Panel de Breakpoints**: Lista todos los breakpoints activos
- **Panel de Watch**: Expresiones que quieres monitorear
- **Consola**: Salida del programa y REPL interactivo
- **Texto Virtual**: Los valores de las variables aparecen inline en el codigo

### 7.4 Atajos de Debug

| Atajo | Accion |
|-------|--------|
| `F7` | Poner/quitar breakpoint |
| `F6` | Breakpoint condicional (pide condicion) |
| `F8` | Iniciar/continuar ejecucion |
| `F9` | Step over (siguiente linea, sin entrar en funciones) |
| `F10` | Step into (entrar en la funcion) |
| `F11` | Step out (salir de la funcion actual) |
| `Leader db` | Toggle breakpoint |
| `Leader dB` | Breakpoint condicional |
| `Leader dc` | Continuar |
| `Leader di` | Step into |
| `Leader dO` | Step over |
| `Leader do` | Step out |
| `Leader dr` | Toggle REPL de debug |
| `Leader dt` | Terminar sesion de debug |
| `Leader du` | Toggle UI de debug |

### 7.5 Flujo Tipico de Depuracion

1. Abre el archivo que quieres depurar
2. Coloca breakpoints con `F7` en las lineas que te interesen
3. Presiona `F8` para iniciar el debug
4. Selecciona la configuracion (ej: "Debug Node File")
5. La UI se abre automaticamente mostrando variables y stack
6. Usa `F9` para avanzar linea por linea
7. Usa `F10` para entrar en funciones
8. Usa `F11` para salir de una funcion
9. Presiona `Leader dt` para terminar la sesion

---

## 8. Autocompletado e IA

### 8.1 Motor de Completado

El autocompletado se activa automaticamente al escribir. Combina multiples fuentes:

- **LSP**: Sugerencias del servidor de lenguaje (funciones, variables, tipos)
- **Snippets**: Fragmentos de codigo expandibles
- **Buffer**: Palabras del buffer actual
- **Path**: Rutas de archivos
- **NeoCodeium**: Sugerencias de IA

**Navegacion del menu de completado:**

| Atajo | Accion |
|-------|--------|
| `Tab` | Seleccionar siguiente item / saltar a siguiente campo de snippet |
| `Shift+Tab` | Seleccionar item anterior / campo de snippet anterior |
| `Enter` | Confirmar seleccion |
| `Ctrl+e` | Cerrar menu de completado |

### 8.2 NeoCodeium (IA Inline)

NeoCodeium es una alternativa gratuita a GitHub Copilot. Muestra sugerencias de codigo
como texto fantasma (ghost text) mientras escribes.

| Atajo | Modo | Accion |
|-------|------|--------|
| `Alt+m` | Insert | Aceptar sugerencia completa |
| `Alt+l` | Insert | Aceptar solo una linea |
| `Alt+w` | Insert | Aceptar solo una palabra |
| `Alt+n` | Insert | Ciclar a la siguiente sugerencia |
| `Alt+b` | Insert | Ciclar a la sugerencia anterior |
| `Alt+k` | Insert | Descartar sugerencia |
| `F9` | Normal | Activar/desactivar NeoCodeium |
| `Leader cn` | Normal | Abrir chat de NeoCodeium |

### 8.3 OpenCode (Asistente IA Completo)

OpenCode es un asistente de IA integrado que puede analizar, explicar, corregir,
refactorizar y generar tests para tu codigo.

**Acciones rapidas:**

| Atajo | Modo | Accion |
|-------|------|--------|
| `Leader oa` | n, x | Preguntar sobre el codigo/contexto actual |
| `Leader ob` | n, x | Preguntar sobre todo el buffer |
| `Leader od` | n, x | Analizar diagnosticos del archivo |
| `Leader og` | n, x | Analizar git diff |
| `Leader or` | n, x | Revisar codigo (buscar errores, mejoras) |
| `Leader oe` | n, x | Explicar que hace el codigo seleccionado |
| `Leader oT` | n, x | Generar tests para el codigo |
| `Leader of` | n, x | Sugerir correcciones para el codigo |
| `Leader oR` | n, x | Refactorizar el codigo |
| `Leader op` | n, x | Abrir prompt sin auto-enviar |
| `Leader oc` | n | Ejecutar comando personalizado |

**Control de sesion:**

| Atajo | Modo | Accion |
|-------|------|--------|
| `Leader ot` | n, t | Toggle terminal de OpenCode |
| `Leader oS` | n | Iniciar OpenCode |
| `Leader oQ` | n | Detener OpenCode |
| `Leader o Enter` | n | Seleccionar sesion anterior |

**Operadores:**

| Atajo | Modo | Accion |
|-------|------|--------|
| `go` | n, x | Agregar rango de texto al contexto de OpenCode |
| `goo` | n | Agregar linea actual al contexto |

---

## 9. Treesitter

Treesitter proporciona resaltado de sintaxis semantico basado en arboles de sintaxis abstractos (AST),
en lugar de expresiones regulares. Esto permite un resaltado mas preciso y funciones avanzadas.

### 9.1 Parsers Instalados

bash, c, diff, html, javascript, jsdoc, json, json5, jsonc, lua, luadoc, luap,
markdown, markdown_inline, printf, python, query, regex, toml, tsx, typescript,
vim, vimdoc, xml, yaml

### 9.2 Funciones que Dependen de Treesitter

| Funcion | Descripcion |
|---------|-------------|
| **Resaltado de sintaxis** | Colores semanticos para keywords, funciones, strings, variables, etc. |
| **Folding** | Plegado de codigo inteligente basado en la estructura del AST |
| **Text objects** | Seleccionar funciones (`af`/`if`), clases, argumentos, bloques |
| **Auto-tags** | Cierre y renombrado automatico de tags HTML/JSX |
| **Comentarios** | Comentarios contextuales (ej: `//` en JS, `{/* */}` en JSX) |
| **Rainbow brackets** | Parentesis con colores diferentes segun nivel de anidamiento |
| **Indentacion** | Indentacion inteligente basada en el arbol de sintaxis |

### 9.3 Rainbow Delimiters (Parentesis Arcoiris)

Los parentesis, llaves y corchetes anidados se colorean con 7 colores:
Rojo, Amarillo, Azul, Naranja, Verde, Violeta, Cyan

---

## 10. Guia Completa de Atajos de Teclado

> **Leyenda de modos:** `n` = Normal | `i` = Insert | `v` = Visual | `x` = Visual+Select | `t` = Terminal
>
> **Leader** = `Espacio`

### 10.1 Navegacion entre Paneles y Ventanas

| Atajo | Modo | Accion |
|-------|------|--------|
| `Ctrl+h` | n | Mover al panel izquierdo (tmux/nvim) |
| `Ctrl+j` | n | Mover al panel inferior |
| `Ctrl+k` | n | Mover al panel superior |
| `Ctrl+l` | n | Mover al panel derecho |
| `Alt+h` | n | Reducir ancho del panel |
| `Alt+j` | n | Reducir altura del panel |
| `Alt+k` | n | Aumentar altura del panel |
| `Alt+l` | n | Aumentar ancho del panel |
| `Leader n` | n | Selector visual de ventanas (letras grandes) |

### 10.2 Navegacion de Buffers (Pestanas)

| Atajo | Modo | Accion |
|-------|------|--------|
| `Alt+i` | n | Buffer anterior |
| `Alt+o` | n | Buffer siguiente |
| `Alt+u` | n | Seleccionar buffer con letras (BufferLinePick) |
| `Leader 1` | n | Ir al buffer 1 |
| `Leader 2` | n | Ir al buffer 2 |
| `Leader 3` | n | Ir al buffer 3 |
| `Leader 4` | n | Ir al buffer 4 |
| `Leader 5` | n | Ir al buffer 5 |
| `Leader 6` | n | Ir al buffer 6 |
| `Leader 7` | n | Ir al buffer 7 |
| `Leader 8` | n | Ir al buffer 8 |
| `Leader 9` | n | Ir al buffer 9 |

### 10.3 Modo Insert - Atajos de Productividad

| Atajo | Accion |
|-------|--------|
| `nn` | Inserta `{ }` con el cursor dentro |
| `NN` | Inserta bloque `{ }` en nuevas lineas |
| `nl` | Inserta `[]` con el cursor dentro |
| `NL` | Inserta bloque `[]` en nuevas lineas |
| `csl` | Inserta `console.log()` con el cursor dentro |
| `;;` | Agrega `;` al final de la linea |
| `Ctrl+o` | Crear nueva linea abajo |
| `Alt+o` | Crear nueva linea arriba |
| `Ctrl+l` | Mover cursor a la derecha |
| `Ctrl+h` | Mover cursor a la izquierda |
| `Ctrl+k` | Borrar caracter adelante (como Delete) |
| `Ctrl+s` | Guardar archivo |
| `o` | Escapar a modo normal |

> **Nota:** `nn`, `NN`, `nl`, `NL` se refieren a las teclas con la `n` del teclado espanol.

### 10.4 Modo Normal - Edicion General

| Atajo | Accion |
|-------|--------|
| `Alt+j` | Mover linea actual hacia abajo |
| `Alt+k` | Mover linea actual hacia arriba |
| `Ctrl+a` | Seleccionar todo el texto del archivo |
| `Ctrl+s` | Guardar archivo |
| `p` | Pegar desde el clipboard del sistema |
| `P` | Pegar antes del cursor desde clipboard del sistema |
| `F4` | Recargar configuracion de Neovim |
| `F5` | Ejecutar archivo actual (JS con Node, TS con Deno) |

**Teclas desactivadas en modo normal:**
- `H`, `J`, `K`, `I`, `L` estan mapeadas a `<Nop>` (sin accion)
- `q` esta desactivado (no graba macros)
- `Ctrl+z` esta desactivado (no suspende Neovim)

### 10.5 Modo Visual - Edicion

| Atajo | Accion |
|-------|--------|
| `Alt+j` | Mover seleccion hacia abajo |
| `Alt+k` | Mover seleccion hacia arriba |
| `o` | Escapar a modo normal |

### 10.6 LSP - Codigo Inteligente

| Atajo | Accion |
|-------|--------|
| `gh` | Ver documentacion hover del simbolo bajo el cursor |
| `gr` | Buscar todas las referencias del simbolo |
| `gp` | Peek: ver definicion en ventana flotante (sin salir del archivo) |
| `gd` | Ir a la definicion (navega al archivo fuente) |
| `Leader ca` | Menu de acciones de codigo (auto-fix, import, etc.) |
| `Leader rn` | Renombrar simbolo en todo el proyecto |
| `Leader sl` | Ver diagnosticos detallados de la linea actual |
| `[d` | Saltar al diagnostico anterior |
| `]d` | Saltar al diagnostico siguiente |

### 10.7 Diagnosticos y Errores (Trouble)

| Atajo | Accion |
|-------|--------|
| `Leader xx` | Toggle panel de diagnosticos (todos los archivos) |
| `Leader xX` | Toggle diagnosticos solo del buffer actual |
| `Leader cs` | Toggle panel de simbolos |
| `Leader cl` | Toggle panel LSP definiciones/referencias |
| `Leader xL` | Toggle location list |
| `Leader xQ` | Toggle quickfix list |
| `Leader xq` | Cerrar panel de Trouble |

### 10.8 Depuracion (DAP)

| Atajo | Accion |
|-------|--------|
| `F7` | Poner/quitar breakpoint |
| `F6` | Breakpoint condicional |
| `F8` | Continuar / iniciar debug |
| `F9` | Step over |
| `F10` | Step into |
| `F11` | Step out |
| `Leader db` | Toggle breakpoint |
| `Leader dB` | Breakpoint condicional |
| `Leader dc` | Continuar |
| `Leader di` | Step into |
| `Leader dO` | Step over |
| `Leader do` | Step out |
| `Leader dr` | Toggle REPL |
| `Leader dt` | Terminar debug |
| `Leader du` | Toggle UI de debug |

### 10.9 NeoCodeium (IA Inline)

| Atajo | Modo | Accion |
|-------|------|--------|
| `Alt+m` | i | Aceptar sugerencia completa |
| `Alt+l` | i | Aceptar una linea |
| `Alt+w` | i | Aceptar una palabra |
| `Alt+n` | i | Siguiente sugerencia |
| `Alt+b` | i | Sugerencia anterior |
| `Alt+k` | i | Descartar sugerencia |
| `F9` | n | Activar/desactivar NeoCodeium |
| `Leader cn` | n | Abrir chat |

### 10.10 OpenCode (Asistente IA)

| Atajo | Modo | Accion |
|-------|------|--------|
| `Leader oa` | n, x | Preguntar sobre el contexto |
| `Leader ob` | n, x | Preguntar sobre el buffer |
| `Leader od` | n, x | Analizar diagnosticos |
| `Leader og` | n, x | Analizar git diff |
| `Leader or` | n, x | Revisar codigo |
| `Leader oe` | n, x | Explicar codigo |
| `Leader oT` | n, x | Generar tests |
| `Leader of` | n, x | Corregir codigo |
| `Leader oR` | n, x | Refactorizar |
| `Leader op` | n, x | Prompt sin auto-enviar |
| `Leader oc` | n | Comando personalizado |
| `Leader os` | n, x | Seleccionar accion |
| `Leader ot` | n, t | Toggle terminal IA |
| `Leader oS` | n | Iniciar OpenCode |
| `Leader oQ` | n | Detener OpenCode |
| `Leader o Enter` | n | Seleccionar sesion |
| `go` | n, x | Operador: agregar rango |
| `goo` | n | Agregar linea actual |
| `Shift+Ctrl+u` | n, t | Media pagina arriba |
| `Shift+Ctrl+d` | n, t | Media pagina abajo |

### 10.11 Multi-Cursor

| Atajo | Accion |
|-------|--------|
| `Leader rf` | Seleccionar la siguiente ocurrencia de la palabra bajo el cursor |
| `Leader rs` | Seleccionar la siguiente sub-palabra |
| `Leader ra` | Seleccionar todas las ocurrencias |
| `Leader rk` | Saltar esta ocurrencia, ir a la siguiente |

### 10.12 Busqueda y Reemplazo

| Atajo | Modo | Accion |
|-------|------|--------|
| `Leader fs` | n, x | Abrir RipSubstitute (buscar/reemplazar con ripgrep) |
| `Leader rs` | n | RipSubstitute (atajo alternativo) |

### 10.13 Traduccion

| Atajo | Modo | Accion |
|-------|------|--------|
| `Leader th` | n | Traducir palabra bajo el cursor al espanol |
| `Leader ts` | v | Traducir seleccion visual al espanol |
| `Leader tr` | n | Reemplazar palabra con su traduccion |
| `Leader tr` | v | Reemplazar seleccion con traduccion |

### 10.14 Markdown

| Atajo | Accion |
|-------|--------|
| `Leader mr` | Renderizar markdown en el buffer |
| `Leader mf` | Refrescar renderizado de markdown |

### 10.15 Paneles y Vistas

| Atajo | Accion |
|-------|--------|
| `Leader a` | Toggle panel de simbolos (Aerial) |
| `Leader mm` | Toggle minimapa |
| `Leader MM` | Enfocar ventana del minimapa |

### 10.16 Autocompletado (nvim-cmp)

| Atajo | Modo | Accion |
|-------|------|--------|
| `Tab` | i, s | Siguiente item / saltar a campo de snippet |
| `Shift+Tab` | i, s | Item anterior / campo de snippet anterior |

### 10.17 Resumen de Prefijos Leader

| Prefijo | Categoria |
|---------|-----------|
| `Leader 1-9` | Buffers (ir al buffer N) |
| `Leader a` | Aerial (simbolos) |
| `Leader c` | Code actions / Trouble symbols / NeoCodeium chat |
| `Leader d` | Debug (DAP) |
| `Leader f` | Find/Search (RipSubstitute) |
| `Leader m` | Markdown / Minimap |
| `Leader n` | Window picker |
| `Leader o` | OpenCode (IA) |
| `Leader r` | Rename / Rip / Multi-cursor |
| `Leader s` | Show (diagnosticos de linea) |
| `Leader t` | Traduccion |
| `Leader x` | Trouble (diagnosticos) |

---

## 11. Snippets Personalizados

### 11.1 TypeScript

| Trigger | Expansion | Descripcion |
|---------|-----------|-------------|
| `csl` | `console.log(msg)` | Console log con placeholder para el mensaje |
| `na` | `const name = () => { body }` | Arrow function con nombre y cuerpo |
| `nf` | `function name() { body }` | Funcion nombrada clasica |
| `jfn` | `function name(args) { body }` | Funcion completa con argumentos |

### 11.2 JavaScript

| Trigger | Expansion | Descripcion |
|---------|-----------|-------------|
| `na` | `const name = () => { body }` | Arrow function |
| `nf` | `function name() { body }` | Funcion nombrada |
| `jfn` | `function name(args) { body }` | Funcion completa |

### 11.3 Global (Todos los Archivos)

| Trigger | Expansion | Descripcion |
|---------|-----------|-------------|
| `nexorem` | Texto largo del proyecto Nexorem | Prompt con contexto del proyecto Next.js 15 + Supabase + Tailwind |

### 11.4 Friendly Snippets (Incluidos)

Ademas de los snippets personalizados, el plugin `friendly-snippets` provee cientos de snippets
predefinidos para JavaScript, TypeScript, React, HTML, CSS, Lua, Python, y muchos mas.
Escribe parte del nombre y aparecen en el menu de autocompletado.

---

## 12. Temas Disponibles

La configuracion incluye 19 temas listos para usar. Para cambiar de tema, modifica
el colorscheme en `init.lua` y la funcion de tema en `personalThemeConfig.lua`.

| Tema | Plugin | Estilo |
|------|--------|--------|
| **solarized-osaka** (ACTIVO) | craftzdog/solarized-osaka.nvim | Dark, teal profundo (#001419), personalizado extensivamente |
| evergarden | everviolet/nvim | Dark, verde natural, variante "fall" |
| catppuccin | catppuccin/nvim | Dark (mocha), colores pastel |
| everforest | neanias/everforest-nvim | Dark, verde bosque |
| gruvbox | ellisonleao/gruvbox.nvim | Dark, contraste hard, retro warm |
| onedark | navarasu/onedark.nvim | Dark, estilo Atom warmer |
| onedarkpro | olimorris/onedarkpro.nvim | Dark, Atom mejorado |
| kanagawa | rebelot/kanagawa.nvim | Dark, inspirado en arte japones |
| nightfox | EdenEast/nightfox.nvim | Dark, azul-purpura suave |
| nightfly | bluz71/vim-nightfly-colors | Dark, azul neon |
| nord | shaunsingh/nord.nvim | Dark, paleta artica fria |
| gruvbox-material | f4z3r/gruvbox-material.nvim | Dark, gruvbox suavizado |
| github | projekt0n/github-nvim-theme | Dark/Light, estilo GitHub |
| lackluster | slugbyte/lackluster.nvim | Dark, monocromo minimalista |
| visual-studio-code | askfiy/visual_studio_code | Dark, replica VS Code |
| palette | roobert/palette.nvim | Dark, dust_dusk personalizable |
| techbase | mcauley-penney/techbase.nvim | Dark, tech minimalista |
| farout | thallada/farout.nvim | Dark, warm retro |
| miasma | xero/miasma.nvim | Dark, verde-marron organico |

### Personalizaciones del Tema Activo (solarized-osaka)

El tema solarizado-osaka tiene personalizaciones profundas:

- **Fondo principal**: `#001419` (teal muy oscuro)
- **Fondo oscuro**: `#001015`
- **Dim de ventanas inactivas**: Activado
- **Cursor Caps Lock**: Rojo cuando Caps Lock esta activado, verde cuando no
- **Separador NeoTree**: Cambia de color segun el modo (azul=normal, verde=insert, rojo=visual)
- **Ventanas**: El fondo cambia sutilmente al enfocar/desenfocar ventanas
- **Custom highlights**: Telescope, WhichKey, GitSigns, NeoTree, CMP, Treesitter, diagnosticos

---

## 13. Modulos Personalizados

### 13.1 Ejecutor de Codigo (runCode.lua)

Presiona `F5` para ejecutar el archivo actual en una ventana flotante:

| Extension | Ejecutor |
|-----------|----------|
| `.js` | Node.js |
| `.ts` | Deno |

La ventana flotante muestra la salida del programa. Presiona `q` para cerrarla.

### 13.2 Deteccion de Caps Lock (cursor.lua)

Un timer periodico consulta el estado de Caps Lock via `xset` (X11) y cambia:
- **Cursor verde**: Caps Lock desactivado
- **Cursor rojo**: Caps Lock activado
- El color de `CursorLine` tambien cambia acorde

### 13.3 Separador NeoTree por Modo (colorVerticalBar.lua)

La linea vertical que separa NeoTree del buffer cambia de color:
- **Azul**: Modo Normal
- **Verde**: Modo Insert
- **Rojo**: Modo Visual

### 13.4 Sistema de Temas (personalThemeConfig.lua)

Un dispatcher que aplica overrides de colores especificos segun el tema activo:
- Fondo de NeoTree
- Colores de ventana enfocada/desenfocada
- Color del gutter
- Color del cursor
- Color de texto seleccionado
- Color de comentarios

### 13.5 Paletas de Colores (colors.lua)

Define tres paletas de colores reutilizables:
- **EverForest**: Verdes y marrones naturales
- **ColorsSolarizedOsaka**: Teales y azules profundos
- **GithubColors**: Blancos y grises

---

## 14. Conflictos Conocidos

Los siguientes atajos tienen asignaciones duplicadas. Generalmente el ultimo en cargar
es el que funciona:

| Atajo | Conflicto | Impacto |
|-------|-----------|---------|
| `F9` | NeoCodeium toggle (keymaps.lua) vs DAP step over (debugger.lua) | Solo funciona uno. Considera reasignar uno de los dos |
| `Leader rs` | RipSubstitute (keymaps.lua) vs vim-visual-multi Find Subword (multicursor.lua) | Pueden coexistir por mecanismos diferentes, pero es confuso |
| `Leader rn` | inc-rename (rename-variable.lua) vs Lspsaga rename (lsp-saga.lua) | Ambos hacen rename. Uno sobrescribe al otro |
| `Ctrl+h/j/k/l` | tmux.lua (plugin defaults) + tmux-move.lua (explicito) | Redundante pero sin consecuencias |

### Recomendaciones

1. **F9**: Mover NeoCodeium toggle a otra tecla (ej: `Leader ct`) o DAP step over a `Leader ds`
2. **Leader rs**: Renombrar uno de los dos atajos para claridad
3. **Leader rn**: Elegir entre inc-rename o Lspsaga y desactivar el otro

---

## 15. Flujo de Arranque

Cuando abres Neovim, esto es lo que ocurre en orden:

```
1. init.lua (punto de entrada)
   |
   |-- 2. config/lazy.lua
   |      |-- Bootstrap lazy.nvim (descarga si no existe)
   |      |-- Carga LazyVim como distribucion base
   |      |-- Activa extras: TypeScript, JSON, TOML, prettier, mini-animate
   |      |-- Carga todos los archivos de lua/plugins/
   |
   |-- 3. config/options.lua (se carga automaticamente por LazyVim)
   |      |-- Define leader = Espacio
   |      |-- Configura clipboard, folds, scrolloff, tabstop
   |      |-- Activa emmet para JSX/TSX
   |      |-- Configura colores de Pmenu
   |
   |-- 4. config/keymaps.lua (se carga automaticamente por LazyVim)
   |      |-- Importa la funcion map() de Map-main.lua
   |      |-- Importa todos los submodulos de keymaps/
   |      |-- Define atajos de insert, normal y visual
   |
   |-- 5. config/autocmds.lua (se carga automaticamente por LazyVim)
   |      |-- Auto-wipe de buffers vacios sin nombre
   |
   |-- 6. config/colorVerticalBar.lua
   |      |-- Configura cambio de color del separador por modo
   |
   |-- 7. mycode/myconfig/personalThemeConfig.lua
   |      |-- Define la funcion ConfigMyColor()
   |
   |-- 8. config/cursor.lua
   |      |-- Inicia timer de deteccion de Caps Lock
   |
   |-- 9. colorscheme = "solarized-osaka"
   |      |-- Aplica el tema visual
   |
   |-- 10. ConfigMyColor()
          |-- Aplica todos los overrides de color personalizados
```

---

## 16. Comandos Utiles

### 16.1 Gestion de Plugins (lazy.nvim)

| Comando | Descripcion |
|---------|-------------|
| `:Lazy` | Abrir el gestor de plugins |
| `:Lazy sync` | Sincronizar plugins (instalar/actualizar/limpiar) |
| `:Lazy update` | Actualizar todos los plugins |
| `:Lazy clean` | Eliminar plugins no usados |
| `:Lazy health` | Verificar estado de salud |
| `:Lazy profile` | Ver tiempos de carga de cada plugin |

### 16.2 Mason (Instalador de Herramientas)

| Comando | Descripcion |
|---------|-------------|
| `:Mason` | Abrir el gestor de herramientas |
| `:MasonInstall <herramienta>` | Instalar un servidor LSP, formatter, etc. |
| `:MasonUninstall <herramienta>` | Desinstalar herramienta |
| `:MasonUpdate` | Actualizar todas las herramientas |

### 16.3 LSP

| Comando | Descripcion |
|---------|-------------|
| `:LspInfo` | Ver servidores LSP activos en el buffer |
| `:LspStart` | Iniciar servidor LSP |
| `:LspStop` | Detener servidor LSP |
| `:LspRestart` | Reiniciar servidores LSP |

### 16.4 Treesitter

| Comando | Descripcion |
|---------|-------------|
| `:TSInstall <parser>` | Instalar un parser de treesitter |
| `:TSUpdate` | Actualizar todos los parsers |
| `:TSInstallInfo` | Ver parsers instalados |
| `:InspectTree` | Ver el arbol de sintaxis del buffer |

### 16.5 Formateador

| Comando | Descripcion |
|---------|-------------|
| `:ConformInfo` | Ver formatters activos para el buffer actual |
| `:Format` | Formatear el buffer manualmente |

### 16.6 Debug

| Comando | Descripcion |
|---------|-------------|
| `:DapContinue` | Iniciar/continuar debug |
| `:DapToggleBreakpoint` | Toggle breakpoint |
| `:DapTerminate` | Terminar sesion de debug |

### 16.7 NeoTree

| Comando | Descripcion |
|---------|-------------|
| `:Neotree` | Abrir explorador de archivos |
| `:Neotree close` | Cerrar explorador |
| `:Neotree toggle` | Toggle explorador |
| `:Neotree reveal` | Mostrar archivo actual en el arbol |

### 16.8 Busqueda y Navegacion

| Comando | Descripcion |
|---------|-------------|
| `:Telescope find_files` | Buscar archivos por nombre |
| `:Telescope live_grep` | Buscar texto en el proyecto |
| `:Telescope buffers` | Listar buffers abiertos |
| `:TodoTelescope` | Buscar TODOs en el proyecto |

### 16.9 Sesiones

| Comando | Descripcion |
|---------|-------------|
| `:SessionRestore` | Restaurar ultima sesion del directorio |
| `:SessionSave` | Guardar sesion actual |

### 16.10 Utilidades

| Comando | Descripcion |
|---------|-------------|
| `:TranslateW` | Traducir palabra bajo el cursor |
| `:IncRename <nombre>` | Renombrar simbolo |
| `:RipSubstitute` | Buscar y reemplazar con ripgrep |
| `:MarkdownPreview` | Abrir preview de markdown en el navegador |
| `:RenderMarkdown` | Renderizar markdown en el buffer |
| `:AerialToggle` | Toggle panel de simbolos |
| `:Trouble` | Abrir panel de diagnosticos |
| `:NeoCodeium toggle` | Activar/desactivar sugerencias de IA |
| `:NeoCodeium chat` | Abrir chat de IA |
| `:checkhealth` | Diagnostico completo del estado de Neovim |

---

> **Tip**: Al presionar `Espacio` (Leader) y esperar, which-key muestra un popup con todos
> los atajos disponibles organizados por categoria. Es la mejor forma de descubrir funcionalidad.
