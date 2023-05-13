local M = {}

-- neovim terminal mode colors
local function set_terminal_colors(colors)
  vim.g.terminal_color_0 = colors.bg0
  vim.g.terminal_color_8 = colors.gray
  vim.g.terminal_color_1 = colors.neutral_red
  vim.g.terminal_color_9 = colors.red
  vim.g.terminal_color_2 = colors.neutral_green
  vim.g.terminal_color_10 = colors.green
  vim.g.terminal_color_3 = colors.neutral_yellow
  vim.g.terminal_color_11 = colors.yellow
  vim.g.terminal_color_4 = colors.neutral_blue
  vim.g.terminal_color_12 = colors.blue
  vim.g.terminal_color_5 = colors.neutral_purple
  vim.g.terminal_color_13 = colors.purple
  vim.g.terminal_color_6 = colors.neutral_aqua
  vim.g.terminal_color_14 = colors.aqua
  vim.g.terminal_color_7 = colors.fg4
  vim.g.terminal_color_15 = colors.fg1
end

M.setup = function()
  local config = require("black2").config
  local colors = require("black2.palette").get_base_colors(vim.o.background, config.contrast)

  set_terminal_colors(colors)

  local groups = {
    -- Base groups
    black2Fg0 = { fg = colors.fg0 },
    black2Fg1 = { fg = colors.fg1 },
    black2Fg2 = { fg = colors.fg2 },
    black2Fg3 = { fg = colors.fg3 },
    black2Fg4 = { fg = colors.fg4 },
    black2Gray = { fg = colors.gray },
    black2Bg0 = { fg = colors.bg0 },
    black2Bg1 = { fg = colors.bg1 },
    black2Bg2 = { fg = colors.bg2 },
    black2Bg3 = { fg = colors.bg3 },
    black2Bg4 = { fg = colors.bg4 },
    black2Red = { fg = colors.red },
    black2RedBold = { fg = colors.red, bold = config.bold },
    black2Green = { fg = colors.green },
    black2GreenBold = { fg = colors.green, bold = config.bold },
    black2Yellow = { fg = colors.yellow },
    black2YellowBold = { fg = colors.yellow, bold = config.bold },
    black2Blue = { fg = colors.blue },
    black2BlueBold = { fg = colors.blue, bold = config.bold },
    black2Purple = { fg = colors.purple },
    black2PurpleBold = { fg = colors.purple, bold = config.bold },
    black2Aqua = { fg = colors.aqua },
    black2AquaBold = { fg = colors.aqua, bold = config.bold },
    black2Orange = { fg = colors.orange },
    black2OrangeBold = { fg = colors.orange, bold = config.bold },
    black2RedSign = config.transparent_mode and { fg = colors.red, reverse = config.invert_signs }
        or { fg = colors.red, bg = colors.bg1, reverse = config.invert_signs },
    black2GreenSign = config.transparent_mode and { fg = colors.green, reverse = config.invert_signs }
        or { fg = colors.green, bg = colors.bg1, reverse = config.invert_signs },
    black2YellowSign = config.transparent_mode and { fg = colors.yellow, reverse = config.invert_signs }
        or { fg = colors.yellow, bg = colors.bg1, reverse = config.invert_signs },
    black2BlueSign = config.transparent_mode and { fg = colors.blue, reverse = config.invert_signs }
        or { fg = colors.blue, bg = colors.bg1, reverse = config.invert_signs },
    black2PurpleSign = config.transparent_mode and { fg = colors.purple, reverse = config.invert_signs }
        or { fg = colors.purple, bg = colors.bg1, reverse = config.invert_signs },
    black2AquaSign = config.transparent_mode and { fg = colors.aqua, reverse = config.invert_signs }
        or { fg = colors.aqua, bg = colors.bg1, reverse = config.invert_signs },
    black2OrangeSign = config.transparent_mode and { fg = colors.orange, reverse = config.invert_signs }
        or { fg = colors.orange, bg = colors.bg1, reverse = config.invert_signs },
    black2RedUnderline = { undercurl = config.undercurl, sp = colors.red },
    black2GreenUnderline = { undercurl = config.undercurl, sp = colors.green },
    black2YellowUnderline = { undercurl = config.undercurl, sp = colors.yellow },
    black2BlueUnderline = { undercurl = config.undercurl, sp = colors.blue },
    black2PurpleUnderline = { undercurl = config.undercurl, sp = colors.purple },
    black2AquaUnderline = { undercurl = config.undercurl, sp = colors.aqua },
    black2OrangeUnderline = { undercurl = config.undercurl, sp = colors.orange },
    Normal = config.transparent_mode and { fg = colors.fg1, bg = nil } or { fg = colors.fg1, bg = colors.bg0 },
    NormalFloat = config.transparent_mode and { fg = colors.fg1, bg = nil } or { fg = colors.fg1, bg = colors.bg1 },
    NormalNC = config.dim_inactive and { fg = colors.fg0, bg = colors.bg1 } or { link = "Normal" },
    CursorLine = { bg = colors.bg1 },
    CursorColumn = { link = "CursorLine" },
    TabLineFill = { fg = colors.bg4, bg = colors.bg1, reverse = config.invert_tabline },
    TabLineSel = { fg = colors.green, bg = colors.bg1, reverse = config.invert_tabline },
    TabLine = { link = "TabLineFill" },
    MatchParen = { bg = colors.bg3, bold = config.bold },
    ColorColumn = { bg = colors.bg1 },
    Conceal = { fg = colors.blue },
    CursorLineNr = { fg = colors.yellow, bg = colors.bg1 },
    NonText = { link = "black2Bg2" },
    SpecialKey = { link = "black2Fg4" },
    Visual = { bg = colors.bg3, reverse = config.invert_selection },
    VisualNOS = { link = "Visual" },
    Search = { fg = colors.yellow, bg = colors.bg0, reverse = config.inverse },
    IncSearch = { fg = colors.orange, bg = colors.bg0, reverse = config.inverse },
    CurSearch = { link = "IncSearch" },
    QuickFixLine = { fg = colors.bg0, bg = colors.yellow, bold = config.bold },
    Underlined = { fg = colors.blue, underline = config.underline },
    StatusLine = { fg = colors.bg2, bg = colors.fg1, reverse = config.inverse },
    StatusLineNC = { fg = colors.bg1, bg = colors.fg4, reverse = config.inverse },
    WinBar = { fg = colors.fg4, bg = colors.bg0 },
    WinBarNC = { fg = colors.fg3, bg = colors.bg1 },
    WinSeparator = config.transparent_mode and { fg = colors.bg3, bg = nil } or { fg = colors.bg3, bg = colors.bg0 },
    WildMenu = { fg = colors.blue, bg = colors.bg2, bold = config.bold },
    Directory = { link = "black2BlueBold" },
    Title = { link = "black2GreenBold" },
    ErrorMsg = { fg = colors.bg0, bg = colors.red, bold = config.bold },
    MoreMsg = { link = "black2YellowBold" },
    ModeMsg = { link = "black2YellowBold" },
    Question = { link = "black2OrangeBold" },
    WarningMsg = { link = "black2RedBold" },
    LineNr = { fg = colors.bg4 },
    SignColumn = config.transparent_mode and { bg = nil } or { bg = colors.bg1 },
    Folded = { fg = colors.gray, bg = colors.bg1, italic = config.italic.folds },
    FoldColumn = config.transparent_mode and { fg = colors.gray, bg = nil } or { fg = colors.gray, bg = colors.bg1 },
    Cursor = { reverse = config.inverse },
    vCursor = { link = "Cursor" },
    iCursor = { link = "Cursor" },
    lCursor = { link = "Cursor" },
    Special = { link = "black2Orange" },
    Comment = { fg = colors.gray, italic = config.italic.comments },
    Todo = { fg = colors.fg0, bold = config.bold, italic = config.italic.comments },
    Done = { fg = colors.orange, bold = config.bold, italic = config.italic.comments },
    Error = { fg = colors.red, bold = config.bold, reverse = config.inverse },
    Statement = { link = "black2Red" },
    Conditional = { link = "black2Red" },
    Repeat = { link = "black2Red" },
    Label = { link = "black2Red" },
    Exception = { link = "black2Red" },
    Operator = { fg = colors.orange, italic = config.italic.operators },
    Keyword = { link = "black2Red" },
    Identifier = { link = "black2Blue" },
    Function = { link = "black2GreenBold" },
    PreProc = { link = "black2Aqua" },
    Include = { link = "black2Aqua" },
    Define = { link = "black2Aqua" },
    Macro = { link = "black2Aqua" },
    PreCondit = { link = "black2Aqua" },
    Constant = { link = "black2Purple" },
    Character = { link = "black2Purple" },
    String = { fg = colors.green, italic = config.italic.strings },
    Boolean = { link = "black2Purple" },
    Number = { link = "black2Purple" },
    Float = { link = "black2Purple" },
    Type = { link = "black2Yellow" },
    StorageClass = { link = "black2Orange" },
    Structure = { link = "black2Aqua" },
    Typedef = { link = "black2Yellow" },
    Pmenu = { fg = colors.fg1, bg = colors.bg2 },
    PmenuSel = { fg = colors.bg2, bg = colors.blue, bold = config.bold },
    PmenuSbar = { bg = colors.bg2 },
    PmenuThumb = { bg = colors.bg4 },
    DiffDelete = { fg = colors.red, bg = colors.bg0, reverse = config.inverse },
    DiffAdd = { fg = colors.green, bg = colors.bg0, reverse = config.inverse },
    DiffChange = { fg = colors.aqua, bg = colors.bg0, reverse = config.inverse },
    DiffText = { fg = colors.yellow, bg = colors.bg0, reverse = config.inverse },
    SpellCap = { link = "black2BlueUnderline" },
    SpellBad = { link = "black2RedUnderline" },
    SpellLocal = { link = "black2AquaUnderline" },
    SpellRare = { link = "black2PurpleUnderline" },
    Whitespace = { fg = colors.bg2 },
    -- LSP Diagnostic
    DiagnosticError = { link = "black2Red" },
    DiagnosticSignError = { link = "black2RedSign" },
    DiagnosticUnderlineError = { link = "black2RedUnderline" },
    DiagnosticWarn = { link = "black2Yellow" },
    DiagnosticSignWarn = { link = "black2YellowSign" },
    DiagnosticUnderlineWarn = { link = "black2YellowUnderline" },
    DiagnosticInfo = { link = "black2Blue" },
    DiagnosticSignInfo = { link = "black2BlueSign" },
    DiagnosticUnderlineInfo = { link = "black2BlueUnderline" },
    DiagnosticHint = { link = "black2Aqua" },
    DiagnosticSignHint = { link = "black2AquaSign" },
    DiagnosticUnderlineHint = { link = "black2AquaUnderline" },
    DiagnosticFloatingError = { link = "black2Red" },
    DiagnosticFloatingWarn = { link = "black2Orange" },
    DiagnosticFloatingInfo = { link = "black2Blue" },
    DiagnosticFloatingHint = { link = "black2Aqua" },
    DiagnosticVirtualTextError = { link = "black2Red" },
    DiagnosticVirtualTextWarn = { link = "black2Yellow" },
    DiagnosticVirtualTextInfo = { link = "black2Blue" },
    DiagnosticVirtualTextHint = { link = "black2Aqua" },
    LspReferenceRead = { link = "black2YellowBold" },
    LspReferenceText = { link = "black2YellowBold" },
    LspReferenceWrite = { link = "black2OrangeBold" },
    LspCodeLens = { link = "black2Gray" },
    LspSignatureActiveParameter = { link = "Search" },
    -- nvim-treesitter
    -- See `nvim-treesitter/CONTRIBUTING.md`

    --
    -- Misc
    --
    -- @comment               ; line and block comments
    ["@comment"] = { link = "Comment" },
    -- @comment.documentation ; comments documenting code
    -- @none                  ; completely disable the highlight
    ["@none"] = { bg = "NONE", fg = "NONE" },
    -- @preproc               ; various preprocessor directives & shebangs
    ["@preproc"] = { link = "PreProc" },
    -- @define                ; preprocessor definition directives
    ["@define"] = { link = "Define" },
    -- @operator              ; symbolic operators (e.g. `+` / `*`)
    ["@operator"] = { link = "Operator" },
    --
    -- Punctuation
    --
    -- @punctuation.delimiter ; delimiters (e.g. `;` / `.` / `,`)
    ["@punctuation.delimiter"] = { link = "Delimiter" },
    -- @punctuation.bracket   ; brackets (e.g. `()` / `{}` / `[]`)
    ["@punctuation.bracket"] = { link = "Delimiter" },
    -- @punctuation.special   ; special symbols (e.g. `{}` in string interpolation)
    ["@punctuation.special"] = { link = "Delimiter" },
    --
    -- Literals
    --
    -- @string               ; string literals
    ["@string"] = { link = "String" },
    -- @string.documentation ; string documenting code (e.g. Python docstrings)
    -- @string.regex         ; regular expressions
    ["@string.regex"] = { link = "String" },
    -- @string.escape        ; escape sequences
    ["@string.escape"] = { link = "SpecialChar" },
    -- @string.special       ; other special strings (e.g. dates)
    ["@string.special"] = { link = "SpecialChar" },
    -- @character            ; character literals
    ["@character"] = { link = "Character" },
    -- @character.special    ; special characters (e.g. wildcards)
    ["@character.special"] = { link = "SpecialChar" },
    -- @boolean              ; boolean literals
    ["@boolean"] = { link = "Boolean" },
    -- @number               ; numeric literals
    ["@number"] = { link = "Number" },
    -- @float                ; floating-point number literals
    ["@float"] = { link = "Float" },
    --
    -- Functions
    --
    -- @function         ; function definitions
    ["@function"] = { link = "Function" },
    -- @function.builtin ; built-in functions
    ["@function.builtin"] = { link = "Special" },
    -- @function.call    ; function calls
    ["@function.call"] = { link = "Function" },
    -- @function.macro   ; preprocessor macros
    ["@function.macro"] = { link = "Macro" },
    -- @method           ; method definitions
    ["@method"] = { link = "Function" },
    -- @method.call      ; method calls
    ["@method.call"] = { link = "Function" },
    -- @constructor      ; constructor calls and definitions
    ["@constructor"] = { link = "Special" },
    -- @parameter        ; parameters of a function
    ["@parameter"] = { link = "Identifier" },
    --
    -- Keywords
    --
    -- @keyword             ; various keywords
    ["@keyword"] = { link = "Keyword" },
    -- @keyword.coroutine   ; keywords related to coroutines (e.g. `go` in Go, `async/await` in Python)
    -- @keyword.function    ; keywords that define a function (e.g. `func` in Go, `def` in Python)
    ["@keyword.function"] = { link = "Keyword" },
    -- @keyword.operator    ; operators that are English words (e.g. `and` / `or`)
    ["@keyword.operator"] = { link = "black2Red" },
    -- @keyword.return      ; keywords like `return` and `yield`
    ["@keyword.return"] = { link = "Keyword" },
    -- @conditional         ; keywords related to conditionals (e.g. `if` / `else`)
    ["@conditional"] = { link = "Conditional" },
    -- @conditional.ternary ; ternary operator (e.g. `?` / `:`)

    -- @repeat              ; keywords related to loops (e.g. `for` / `while`)
    ["@repeat"] = { link = "Repeat" },
    -- @debug               ; keywords related to debugging
    ["@debug"] = { link = "Debug" },
    -- @label               ; GOTO and other labels (e.g. `label:` in C)
    ["@label"] = { link = "Label" },
    -- @include             ; keywords for including modules (e.g. `import` / `from` in Python)
    ["@include"] = { link = "Include" },
    -- @exception           ; keywords related to exceptions (e.g. `throw` / `catch`)
    ["@exception"] = { link = "Exception" },
    --
    -- Types
    --
    -- @type            ; type or class definitions and annotations
    ["@type"] = { link = "Type" },
    -- @type.builtin    ; built-in types
    ["@type.builtin"] = { link = "Type" },
    -- @type.definition ; type definitions (e.g. `typedef` in C)
    ["@type.definition"] = { link = "Typedef" },
    -- @type.qualifier  ; type qualifiers (e.g. `const`)
    ["@type.qualifier"] = { link = "Type" },
    -- @storageclass    ; modifiers that affect storage in memory or life-time
    ["@storageclass"] = { link = "StorageClass" },
    -- @attribute       ; attribute annotations (e.g. Python decorators)
    ["@attribute"] = { link = "PreProc" },
    -- @field           ; object and struct fields
    ["@field"] = { link = "Identifier" },
    -- @property        ; similar to `@field`
    ["@property"] = { link = "Identifier" },
    --
    -- Identifiers
    --
    -- @variable         ; various variable names
    ["@variable"] = { link = "black2Fg1" },
    -- @variable.builtin ; built-in variable names (e.g. `this`)
    ["@variable.builtin"] = { link = "Special" },
    -- @constant         ; constant identifiers
    ["@constant"] = { link = "Constant" },
    -- @constant.builtin ; built-in constant values
    ["@constant.builtin"] = { link = "Special" },
    -- @constant.macro   ; constants defined by the preprocessor
    ["@constant.macro"] = { link = "Define" },
    -- @namespace        ; modules or namespaces
    ["@namespace"] = { link = "black2Fg1" },
    -- @symbol           ; symbols or atoms
    ["@symbol"] = { link = "Identifier" },
    --
    -- Text
    --
    -- @text                  ; non-structured text
    ["@text"] = { link = "black2Fg1" },
    -- @text.strong           ; bold text
    ["@text.strong"] = { bold = config.bold },
    -- @text.emphasis         ; text with emphasis
    ["@text.emphasis"] = { italic = config.italic.strings },
    -- @text.underline        ; underlined text
    ["@text.underline"] = { underline = config.underline },
    -- @text.strike           ; strikethrough text
    ["@text.strike"] = { strikethrough = config.strikethrough },
    -- @text.title            ; text that is part of a title
    ["@text.title"] = { link = "Title" },
    -- @text.literal          ; literal or verbatim text (e.g., inline code)
    ["@text.literal"] = { link = "String" },
    -- @text.quote            ; text quotations
    -- @text.uri              ; URIs (e.g. hyperlinks)
    ["@text.uri"] = { link = "Underlined" },
    -- @text.math             ; math environments (e.g. `$ ... $` in LaTeX)
    ["@text.math"] = { link = "Special" },
    -- @text.environment      ; text environments of markup languages
    ["@text.environment"] = { link = "Macro" },
    -- @text.environment.name ; text indicating the type of an environment
    ["@text.environment.name"] = { link = "Type" },
    -- @text.reference        ; text references, footnotes, citations, etc.
    ["@text.reference"] = { link = "Constant" },
    -- @text.todo             ; todo notes
    ["@text.todo"] = { link = "Todo" },
    -- @text.note             ; info notes
    ["@text.note"] = { link = "SpecialComment" },
    -- @text.warning          ; warning notes
    ["@text.warning"] = { link = "WarningMsg" },
    -- @text.danger           ; danger/error notes
    ["@text.danger"] = { link = "ErrorMsg" },
    -- @text.diff.add         ; added text (for diff files)
    ["@text.diff.add"] = { link = "diffAdded" },
    -- @text.diff.delete      ; deleted text (for diff files)
    ["@text.diff.delete"] = { link = "diffRemoved" },
    --
    -- Tags
    --
    -- @tag           ; XML tag names
    ["@tag"] = { link = "Tag" },
    -- @tag.attribute ; XML tag attributes
    ["@tag.attribute"] = { link = "Identifier" },
    -- @tag.delimiter ; XML tag delimiters
    ["@tag.delimiter"] = { link = "Delimiter" },
    --
    -- Conceal
    --
    -- @conceal ; for captures that are only used for concealing

    --
    -- Spell
    --
    -- @spell   ; for defining regions to be spellchecked
    -- @nospell ; for defining regions that should NOT be spellchecked

    -- Treesitter
    -- See `:help treesitter`
    -- Those are not part of the nvim-treesitter
    ["@punctuation"] = { link = "Delimiter" },
    ["@macro"] = { link = "Macro" },
    ["@structure"] = { link = "Structure" },
    -- Semantic token
    -- See `:help lsp-semantic-highlight`
    ["@lsp.type.class"] = { link = "@constructor" },
    ["@lsp.type.decorator"] = { link = "@parameter" },
    ["@lsp.type.enum"] = { link = "@type" },
    ["@lsp.type.enumMember"] = { link = "@constant" },
    ["@lsp.type.function"] = { link = "@function" },
    ["@lsp.type.interface"] = { link = "@keyword" },
    ["@lsp.type.macro"] = { link = "@macro" },
    ["@lsp.type.method"] = { link = "@method" },
    ["@lsp.type.namespace"] = { link = "@namespace" },
    ["@lsp.type.parameter"] = { link = "@parameter" },
    ["@lsp.type.property"] = { link = "@property" },
    ["@lsp.type.struct"] = { link = "@constructor" },
    ["@lsp.type.type"] = { link = "@type" },
    ["@lsp.type.typeParameter"] = { link = "@type.definition" },
    ["@lsp.type.variable"] = { link = "@variable" },
    -- gitcommit
    gitcommitSelectedFile = { link = "black2Green" },
    gitcommitDiscardedFile = { link = "black2Red" },
    -- gitsigns.nvim
    GitSignsAdd = { link = "black2GreenSign" },
    GitSignsChange = { link = "black2AquaSign" },
    GitSignsDelete = { link = "black2RedSign" },
    -- nvim-tree
    NvimTreeSymlink = { fg = colors.neutral_aqua },
    NvimTreeRootFolder = { fg = colors.neutral_purple, bold = true },
    NvimTreeFolderIcon = { fg = colors.neutral_blue, bold = true },
    NvimTreeFileIcon = { fg = colors.light2 },
    NvimTreeExecFile = { fg = colors.neutral_green, bold = true },
    NvimTreeOpenedFile = { fg = colors.bright_red, bold = true },
    NvimTreeSpecialFile = { fg = colors.neutral_yellow, bold = true, underline = true },
    NvimTreeImageFile = { fg = colors.neutral_purple },
    NvimTreeIndentMarker = { fg = colors.dark3 },
    NvimTreeGitDirty = { fg = colors.neutral_yellow },
    NvimTreeGitStaged = { fg = colors.neutral_yellow },
    NvimTreeGitMerge = { fg = colors.neutral_purple },
    NvimTreeGitRenamed = { fg = colors.neutral_purple },
    NvimTreeGitNew = { fg = colors.neutral_yellow },
    NvimTreeGitDeleted = { fg = colors.neutral_red },
    NvimTreeWindowPicker = { bg = colors.faded_aqua },
    -- termdebug
    debugPC = { bg = colors.faded_blue },
    debugBreakpoint = { link = "black2RedSign" },
    -- vim-startify
    StartifyBracket = { link = "black2Fg3" },
    StartifyFile = { link = "black2Fg1" },
    StartifyNumber = { link = "black2Blue" },
    StartifyPath = { link = "black2Gray" },
    StartifySlash = { link = "black2Gray" },
    StartifySection = { link = "black2Yellow" },
    StartifySpecial = { link = "black2Bg2" },
    StartifyHeader = { link = "black2Orange" },
    StartifyFooter = { link = "black2Bg2" },
    StartifyVar = { link = "StartifyPath" },
    StartifySelect = { link = "Title" },
    -- vim-dirvish
    DirvishPathTail = { link = "black2Aqua" },
    DirvishArg = { link = "black2Yellow" },
    -- netrw
    netrwDir = { link = "black2Aqua" },
    netrwClassify = { link = "black2Aqua" },
    netrwLink = { link = "black2Gray" },
    netrwSymLink = { link = "black2Fg1" },
    netrwExe = { link = "black2Yellow" },
    netrwComment = { link = "black2Gray" },
    netrwList = { link = "black2Blue" },
    netrwHelpCmd = { link = "black2Aqua" },
    netrwCmdSep = { link = "black2Fg3" },
    netrwVersion = { link = "black2Green" },
    -- nerdtree
    NERDTreeDir = { link = "black2Aqua" },
    NERDTreeDirSlash = { link = "black2Aqua" },
    NERDTreeOpenable = { link = "black2Orange" },
    NERDTreeClosable = { link = "black2Orange" },
    NERDTreeFile = { link = "black2Fg1" },
    NERDTreeExecFile = { link = "black2Yellow" },
    NERDTreeUp = { link = "black2Gray" },
    NERDTreeCWD = { link = "black2Green" },
    NERDTreeHelp = { link = "black2Fg1" },
    NERDTreeToggleOn = { link = "black2Green" },
    NERDTreeToggleOff = { link = "black2Red" },
    -- coc.nvim
    CocErrorSign = { link = "black2RedSign" },
    CocWarningSign = { link = "black2OrangeSign" },
    CocInfoSign = { link = "black2BlueSign" },
    CocHintSign = { link = "black2AquaSign" },
    CocErrorFloat = { link = "black2Red" },
    CocWarningFloat = { link = "black2Orange" },
    CocInfoFloat = { link = "black2Blue" },
    CocHintFloat = { link = "black2Aqua" },
    CocDiagnosticsError = { link = "black2Red" },
    CocDiagnosticsWarning = { link = "black2Orange" },
    CocDiagnosticsInfo = { link = "black2Blue" },
    CocDiagnosticsHint = { link = "black2Aqua" },
    CocSelectedText = { link = "black2Red" },
    CocMenuSel = { link = "PmenuSel" },
    CocCodeLens = { link = "black2Gray" },
    CocErrorHighlight = { link = "black2RedUnderline" },
    CocWarningHighlight = { link = "black2OrangeUnderline" },
    CocInfoHighlight = { link = "black2BlueUnderline" },
    CocHintHighlight = { link = "black2AquaUnderline" },
    -- telescope.nvim
    TelescopeNormal = { link = "black2Fg1" },
    TelescopeSelection = { link = "black2OrangeBold" },
    TelescopeSelectionCaret = { link = "black2Red" },
    TelescopeMultiSelection = { link = "black2Gray" },
    TelescopeBorder = { link = "TelescopeNormal" },
    TelescopePromptBorder = { link = "TelescopeNormal" },
    TelescopeResultsBorder = { link = "TelescopeNormal" },
    TelescopePreviewBorder = { link = "TelescopeNormal" },
    TelescopeMatching = { link = "black2Blue" },
    TelescopePromptPrefix = { link = "black2Red" },
    TelescopePrompt = { link = "TelescopeNormal" },
    -- nvim-cmp
    CmpItemAbbr = { link = "black2Fg0" },
    CmpItemAbbrDeprecated = { link = "black2Fg1" },
    CmpItemAbbrMatch = { link = "black2BlueBold" },
    CmpItemAbbrMatchFuzzy = { link = "black2BlueUnderline" },
    CmpItemMenu = { link = "black2Gray" },
    CmpItemKindText = { link = "black2Orange" },
    CmpItemKindVariable = { link = "black2Orange" },
    CmpItemKindMethod = { link = "black2Blue" },
    CmpItemKindFunction = { link = "black2Blue" },
    CmpItemKindConstructor = { link = "black2Yellow" },
    CmpItemKindUnit = { link = "black2Blue" },
    CmpItemKindField = { link = "black2Blue" },
    CmpItemKindClass = { link = "black2Yellow" },
    CmpItemKindInterface = { link = "black2Yellow" },
    CmpItemKindModule = { link = "black2Blue" },
    CmpItemKindProperty = { link = "black2Blue" },
    CmpItemKindValue = { link = "black2Orange" },
    CmpItemKindEnum = { link = "black2Yellow" },
    CmpItemKindOperator = { link = "black2Yellow" },
    CmpItemKindKeyword = { link = "black2Purple" },
    CmpItemKindEvent = { link = "black2Purple" },
    CmpItemKindReference = { link = "black2Purple" },
    CmpItemKindColor = { link = "black2Purple" },
    CmpItemKindSnippet = { link = "black2Green" },
    CmpItemKindFile = { link = "black2Blue" },
    CmpItemKindFolder = { link = "black2Blue" },
    CmpItemKindEnumMember = { link = "black2Aqua" },
    CmpItemKindConstant = { link = "black2Orange" },
    CmpItemKindStruct = { link = "black2Yellow" },
    CmpItemKindTypeParameter = { link = "black2Yellow" },
    diffAdded = { link = "black2Green" },
    diffRemoved = { link = "black2Red" },
    diffChanged = { link = "black2Aqua" },
    diffFile = { link = "black2Orange" },
    diffNewFile = { link = "black2Yellow" },
    diffOldFile = { link = "black2Orange" },
    diffLine = { link = "black2Blue" },
    diffIndexLine = { link = "diffChanged" },
    -- navic (highlight icons)
    NavicIconsFile = { link = "black2Blue" },
    NavicIconsModule = { link = "black2Orange" },
    NavicIconsNamespace = { link = "black2Blue" },
    NavicIconsPackage = { link = "black2Aqua" },
    NavicIconsClass = { link = "black2Yellow" },
    NavicIconsMethod = { link = "black2Blue" },
    NavicIconsProperty = { link = "black2Aqua" },
    NavicIconsField = { link = "black2Purple" },
    NavicIconsConstructor = { link = "black2Blue" },
    NavicIconsEnum = { link = "black2Purple" },
    NavicIconsInterface = { link = "black2Green" },
    NavicIconsFunction = { link = "black2Blue" },
    NavicIconsVariable = { link = "black2Purple" },
    NavicIconsConstant = { link = "black2Orange" },
    NavicIconsString = { link = "black2Green" },
    NavicIconsNumber = { link = "black2Orange" },
    NavicIconsBoolean = { link = "black2Orange" },
    NavicIconsArray = { link = "black2Orange" },
    NavicIconsObject = { link = "black2Orange" },
    NavicIconsKey = { link = "black2Aqua" },
    NavicIconsNull = { link = "black2Orange" },
    NavicIconsEnumMember = { link = "black2Yellow" },
    NavicIconsStruct = { link = "black2Purple" },
    NavicIconsEvent = { link = "black2Yellow" },
    NavicIconsOperator = { link = "black2Red" },
    NavicIconsTypeParameter = { link = "black2Red" },
    NavicText = { link = "black2White" },
    NavicSeparator = { link = "black2White" },
    -- html
    htmlTag = { link = "black2AquaBold" },
    htmlEndTag = { link = "black2AquaBold" },
    htmlTagName = { link = "black2Blue" },
    htmlArg = { link = "black2Orange" },
    htmlTagN = { link = "black2Fg1" },
    htmlSpecialTagName = { link = "black2Blue" },
    htmlLink = { fg = colors.fg4, underline = config.underline },
    htmlSpecialChar = { link = "black2Red" },
    htmlBold = { fg = colors.fg0, bg = colors.bg0, bold = config.bold },
    htmlBoldUnderline = { fg = colors.fg0, bg = colors.bg0, bold = config.bold, underline = config.underline },
    htmlBoldItalic = { fg = colors.fg0, bg = colors.bg0, bold = config.bold, italic = true },
    htmlBoldUnderlineItalic = {
      fg = colors.fg0,
      bg = colors.bg0,
      bold = config.bold,
      italic = true,
      underline = config.underline,
    },
    htmlUnderline = { fg = colors.fg0, bg = colors.bg0, underline = config.underline },
    htmlUnderlineItalic = {
      fg = colors.fg0,
      bg = colors.bg0,
      italic = true,
      underline = config.underline,
    },
    htmlItalic = { fg = colors.fg0, bg = colors.bg0, italic = true },
    -- xml
    xmlTag = { link = "black2AquaBold" },
    xmlEndTag = { link = "black2AquaBold" },
    xmlTagName = { link = "black2Blue" },
    xmlEqual = { link = "black2Blue" },
    docbkKeyword = { link = "black2AquaBold" },
    xmlDocTypeDecl = { link = "black2Gray" },
    xmlDocTypeKeyword = { link = "black2Purple" },
    xmlCdataStart = { link = "black2Gray" },
    xmlCdataCdata = { link = "black2Purple" },
    dtdFunction = { link = "black2Gray" },
    dtdTagName = { link = "black2Purple" },
    xmlAttrib = { link = "black2Orange" },
    xmlProcessingDelim = { link = "black2Gray" },
    dtdParamEntityPunct = { link = "black2Gray" },
    dtdParamEntityDPunct = { link = "black2Gray" },
    xmlAttribPunct = { link = "black2Gray" },
    xmlEntity = { link = "black2Red" },
    xmlEntityPunct = { link = "black2Red" },
    -- clojure
    clojureKeyword = { link = "black2Blue" },
    clojureCond = { link = "black2Orange" },
    clojureSpecial = { link = "black2Orange" },
    clojureDefine = { link = "black2Orange" },
    clojureFunc = { link = "black2Yellow" },
    clojureRepeat = { link = "black2Yellow" },
    clojureCharacter = { link = "black2Aqua" },
    clojureStringEscape = { link = "black2Aqua" },
    clojureException = { link = "black2Red" },
    clojureRegexp = { link = "black2Aqua" },
    clojureRegexpEscape = { link = "black2Aqua" },
    clojureRegexpCharClass = { fg = colors.fg3, bold = config.bold },
    clojureRegexpMod = { link = "clojureRegexpCharClass" },
    clojureRegexpQuantifier = { link = "clojureRegexpCharClass" },
    clojureParen = { link = "black2Fg3" },
    clojureAnonArg = { link = "black2Yellow" },
    clojureVariable = { link = "black2Blue" },
    clojureMacro = { link = "black2Orange" },
    clojureMeta = { link = "black2Yellow" },
    clojureDeref = { link = "black2Yellow" },
    clojureQuote = { link = "black2Yellow" },
    clojureUnquote = { link = "black2Yellow" },
    -- C
    cOperator = { link = "black2Purple" },
    cppOperator = { link = "black2Purple" },
    cStructure = { link = "black2Orange" },
    -- python
    pythonBuiltin = { link = "black2Orange" },
    pythonBuiltinObj = { link = "black2Orange" },
    pythonBuiltinFunc = { link = "black2Orange" },
    pythonFunction = { link = "black2Aqua" },
    pythonDecorator = { link = "black2Red" },
    pythonInclude = { link = "black2Blue" },
    pythonImport = { link = "black2Blue" },
    pythonRun = { link = "black2Blue" },
    pythonCoding = { link = "black2Blue" },
    pythonOperator = { link = "black2Red" },
    pythonException = { link = "black2Red" },
    pythonExceptions = { link = "black2Purple" },
    pythonBoolean = { link = "black2Purple" },
    pythonDot = { link = "black2Fg3" },
    pythonConditional = { link = "black2Red" },
    pythonRepeat = { link = "black2Red" },
    pythonDottedName = { link = "black2GreenBold" },
    -- CSS
    cssBraces = { link = "black2Blue" },
    cssFunctionName = { link = "black2Yellow" },
    cssIdentifier = { link = "black2Orange" },
    cssClassName = { link = "black2Green" },
    cssColor = { link = "black2Blue" },
    cssSelectorOp = { link = "black2Blue" },
    cssSelectorOp2 = { link = "black2Blue" },
    cssImportant = { link = "black2Green" },
    cssVendor = { link = "black2Fg1" },
    cssTextProp = { link = "black2Aqua" },
    cssAnimationProp = { link = "black2Aqua" },
    cssUIProp = { link = "black2Yellow" },
    cssTransformProp = { link = "black2Aqua" },
    cssTransitionProp = { link = "black2Aqua" },
    cssPrintProp = { link = "black2Aqua" },
    cssPositioningProp = { link = "black2Yellow" },
    cssBoxProp = { link = "black2Aqua" },
    cssFontDescriptorProp = { link = "black2Aqua" },
    cssFlexibleBoxProp = { link = "black2Aqua" },
    cssBorderOutlineProp = { link = "black2Aqua" },
    cssBackgroundProp = { link = "black2Aqua" },
    cssMarginProp = { link = "black2Aqua" },
    cssListProp = { link = "black2Aqua" },
    cssTableProp = { link = "black2Aqua" },
    cssFontProp = { link = "black2Aqua" },
    cssPaddingProp = { link = "black2Aqua" },
    cssDimensionProp = { link = "black2Aqua" },
    cssRenderProp = { link = "black2Aqua" },
    cssColorProp = { link = "black2Aqua" },
    cssGeneratedContentProp = { link = "black2Aqua" },
    -- javascript
    javaScriptBraces = { link = "black2Fg1" },
    javaScriptFunction = { link = "black2Aqua" },
    javaScriptIdentifier = { link = "black2Red" },
    javaScriptMember = { link = "black2Blue" },
    javaScriptNumber = { link = "black2Purple" },
    javaScriptNull = { link = "black2Purple" },
    javaScriptParens = { link = "black2Fg3" },
    -- typescript
    typescriptReserved = { link = "black2Aqua" },
    typescriptLabel = { link = "black2Aqua" },
    typescriptFuncKeyword = { link = "black2Aqua" },
    typescriptIdentifier = { link = "black2Orange" },
    typescriptBraces = { link = "black2Fg1" },
    typescriptEndColons = { link = "black2Fg1" },
    typescriptDOMObjects = { link = "black2Fg1" },
    typescriptAjaxMethods = { link = "black2Fg1" },
    typescriptLogicSymbols = { link = "black2Fg1" },
    typescriptDocSeeTag = { link = "Comment" },
    typescriptDocParam = { link = "Comment" },
    typescriptDocTags = { link = "vimCommentTitle" },
    typescriptGlobalObjects = { link = "black2Fg1" },
    typescriptParens = { link = "black2Fg3" },
    typescriptOpSymbols = { link = "black2Fg3" },
    typescriptHtmlElemProperties = { link = "black2Fg1" },
    typescriptNull = { link = "black2Purple" },
    typescriptInterpolationDelimiter = { link = "black2Aqua" },
    -- purescript
    purescriptModuleKeyword = { link = "black2Aqua" },
    purescriptModuleName = { link = "black2Fg1" },
    purescriptWhere = { link = "black2Aqua" },
    purescriptDelimiter = { link = "black2Fg4" },
    purescriptType = { link = "black2Fg1" },
    purescriptImportKeyword = { link = "black2Aqua" },
    purescriptHidingKeyword = { link = "black2Aqua" },
    purescriptAsKeyword = { link = "black2Aqua" },
    purescriptStructure = { link = "black2Aqua" },
    purescriptOperator = { link = "black2Blue" },
    purescriptTypeVar = { link = "black2Fg1" },
    purescriptConstructor = { link = "black2Fg1" },
    purescriptFunction = { link = "black2Fg1" },
    purescriptConditional = { link = "black2Orange" },
    purescriptBacktick = { link = "black2Orange" },
    -- coffescript
    coffeeExtendedOp = { link = "black2Fg3" },
    coffeeSpecialOp = { link = "black2Fg3" },
    coffeeCurly = { link = "black2Orange" },
    coffeeParen = { link = "black2Fg3" },
    coffeeBracket = { link = "black2Orange" },
    -- ruby
    rubyStringDelimiter = { link = "black2Green" },
    rubyInterpolationDelimiter = { link = "black2Aqua" },
    rubyDefinedOperator = { link = "rubyKeyword" },
    -- objc
    objcTypeModifier = { link = "black2Red" },
    objcDirective = { link = "black2Blue" },
    -- go
    goDirective = { link = "black2Aqua" },
    goConstants = { link = "black2Purple" },
    goDeclaration = { link = "black2Red" },
    goDeclType = { link = "black2Blue" },
    goBuiltins = { link = "black2Orange" },
    -- lua
    luaIn = { link = "black2Red" },
    luaFunction = { link = "black2Aqua" },
    luaTable = { link = "black2Orange" },
    -- moonscript
    moonSpecialOp = { link = "black2Fg3" },
    moonExtendedOp = { link = "black2Fg3" },
    moonFunction = { link = "black2Fg3" },
    moonObject = { link = "black2Yellow" },
    -- java
    javaAnnotation = { link = "black2Blue" },
    javaDocTags = { link = "black2Aqua" },
    javaCommentTitle = { link = "vimCommentTitle" },
    javaParen = { link = "black2Fg3" },
    javaParen1 = { link = "black2Fg3" },
    javaParen2 = { link = "black2Fg3" },
    javaParen3 = { link = "black2Fg3" },
    javaParen4 = { link = "black2Fg3" },
    javaParen5 = { link = "black2Fg3" },
    javaOperator = { link = "black2Orange" },
    javaVarArg = { link = "black2Green" },
    -- elixir
    elixirDocString = { link = "Comment" },
    elixirStringDelimiter = { link = "black2Green" },
    elixirInterpolationDelimiter = { link = "black2Aqua" },
    elixirModuleDeclaration = { link = "black2Yellow" },
    -- scala
    scalaNameDefinition = { link = "black2Fg1" },
    scalaCaseFollowing = { link = "black2Fg1" },
    scalaCapitalWord = { link = "black2Fg1" },
    scalaTypeExtension = { link = "black2Fg1" },
    scalaKeyword = { link = "black2Red" },
    scalaKeywordModifier = { link = "black2Red" },
    scalaSpecial = { link = "black2Aqua" },
    scalaOperator = { link = "black2Fg1" },
    scalaTypeDeclaration = { link = "black2Yellow" },
    scalaTypeTypePostDeclaration = { link = "black2Yellow" },
    scalaInstanceDeclaration = { link = "black2Fg1" },
    scalaInterpolation = { link = "black2Aqua" },
    -- markdown
    markdownItalic = { fg = colors.fg3, italic = true },
    markdownBold = { fg = colors.fg3, bold = config.bold },
    markdownBoldItalic = { fg = colors.fg3, bold = config.bold, italic = true },
    markdownH1 = { link = "black2GreenBold" },
    markdownH2 = { link = "black2GreenBold" },
    markdownH3 = { link = "black2YellowBold" },
    markdownH4 = { link = "black2YellowBold" },
    markdownH5 = { link = "black2Yellow" },
    markdownH6 = { link = "black2Yellow" },
    markdownCode = { link = "black2Aqua" },
    markdownCodeBlock = { link = "black2Aqua" },
    markdownCodeDelimiter = { link = "black2Aqua" },
    markdownBlockquote = { link = "black2Gray" },
    markdownListMarker = { link = "black2Gray" },
    markdownOrderedListMarker = { link = "black2Gray" },
    markdownRule = { link = "black2Gray" },
    markdownHeadingRule = { link = "black2Gray" },
    markdownUrlDelimiter = { link = "black2Fg3" },
    markdownLinkDelimiter = { link = "black2Fg3" },
    markdownLinkTextDelimiter = { link = "black2Fg3" },
    markdownHeadingDelimiter = { link = "black2Orange" },
    markdownUrl = { link = "black2Purple" },
    markdownUrlTitleDelimiter = { link = "black2Green" },
    markdownLinkText = { fg = colors.gray, underline = config.underline },
    markdownIdDeclaration = { link = "markdownLinkText" },
    -- haskell
    haskellType = { link = "black2Blue" },
    haskellIdentifier = { link = "black2Aqua" },
    haskellSeparator = { link = "black2Fg4" },
    haskellDelimiter = { link = "black2Orange" },
    haskellOperators = { link = "black2Purple" },
    haskellBacktick = { link = "black2Orange" },
    haskellStatement = { link = "black2Purple" },
    haskellConditional = { link = "black2Purple" },
    haskellLet = { link = "black2Red" },
    haskellDefault = { link = "black2Red" },
    haskellWhere = { link = "black2Red" },
    haskellBottom = { link = "black2RedBold" },
    haskellImportKeywords = { link = "black2PurpleBold" },
    haskellDeclKeyword = { link = "black2Orange" },
    haskellDecl = { link = "black2Orange" },
    haskellDeriving = { link = "black2Purple" },
    haskellAssocType = { link = "black2Aqua" },
    haskellNumber = { link = "black2Aqua" },
    haskellPragma = { link = "black2RedBold" },
    haskellTH = { link = "black2AquaBold" },
    haskellForeignKeywords = { link = "black2Green" },
    haskellKeyword = { link = "black2Red" },
    haskellFloat = { link = "black2Aqua" },
    haskellInfix = { link = "black2Purple" },
    haskellQuote = { link = "black2GreenBold" },
    haskellShebang = { link = "black2YellowBold" },
    haskellLiquid = { link = "black2PurpleBold" },
    haskellQuasiQuoted = { link = "black2BlueBold" },
    haskellRecursiveDo = { link = "black2Purple" },
    haskellQuotedType = { link = "black2Red" },
    haskellPreProc = { link = "black2Fg4" },
    haskellTypeRoles = { link = "black2RedBold" },
    haskellTypeForall = { link = "black2Red" },
    haskellPatternKeyword = { link = "black2Blue" },
    -- json
    jsonKeyword = { link = "black2Green" },
    jsonQuote = { link = "black2Green" },
    jsonBraces = { link = "black2Fg1" },
    jsonString = { link = "black2Fg1" },
    -- mail
    mailQuoted1 = { link = "black2Aqua" },
    mailQuoted2 = { link = "black2Purple" },
    mailQuoted3 = { link = "black2Yellow" },
    mailQuoted4 = { link = "black2Green" },
    mailQuoted5 = { link = "black2Red" },
    mailQuoted6 = { link = "black2Orange" },
    mailSignature = { link = "Comment" },
    -- c#
    csBraces = { link = "black2Fg1" },
    csEndColon = { link = "black2Fg1" },
    csLogicSymbols = { link = "black2Fg1" },
    csParens = { link = "black2Fg3" },
    csOpSymbols = { link = "black2Fg3" },
    csInterpolationDelimiter = { link = "black2Fg3" },
    csInterpolationAlignDel = { link = "black2AquaBold" },
    csInterpolationFormat = { link = "black2Aqua" },
    csInterpolationFormatDel = { link = "black2AquaBold" },
    -- rust btw
    rustSigil = { link = "black2Orange" },
    rustEscape = { link = "black2Aqua" },
    rustStringContinuation = { link = "black2Aqua" },
    rustEnum = { link = "black2Aqua" },
    rustStructure = { link = "black2Aqua" },
    rustModPathSep = { link = "black2Fg2" },
    rustCommentLineDoc = { link = "Comment" },
    rustDefault = { link = "black2Aqua" },
    -- ocaml
    ocamlOperator = { link = "black2Fg1" },
    ocamlKeyChar = { link = "black2Orange" },
    ocamlArrow = { link = "black2Orange" },
    ocamlInfixOpKeyword = { link = "black2Red" },
    ocamlConstructor = { link = "black2Orange" },
    -- lspsaga.nvim
    LspSagaCodeActionTitle = { link = "Title" },
    LspSagaCodeActionBorder = { link = "black2Fg1" },
    LspSagaCodeActionContent = { fg = colors.green, bold = config.bold },
    LspSagaLspFinderBorder = { link = "black2Fg1" },
    LspSagaAutoPreview = { link = "black2Orange" },
    TargetWord = { fg = colors.blue, bold = config.bold },
    FinderSeparator = { link = "black2Aqua" },
    LspSagaDefPreviewBorder = { link = "black2Blue" },
    LspSagaHoverBorder = { link = "black2Orange" },
    LspSagaRenameBorder = { link = "black2Blue" },
    LspSagaDiagnosticSource = { link = "black2Orange" },
    LspSagaDiagnosticBorder = { link = "black2Purple" },
    LspSagaDiagnosticHeader = { link = "black2Green" },
    LspSagaSignatureHelpBorder = { link = "black2Green" },
    SagaShadow = { link = "black2Bg0" },
    -- dashboard-nvim
    DashboardShortCut = { link = "black2Orange" },
    DashboardHeader = { link = "black2Aqua" },
    DashboardCenter = { link = "black2Yellow" },
    DashboardFooter = { fg = colors.purple, italic = true },
    -- mason
    MasonHighlight = { link = "black2Aqua" },
    MasonHighlightBlock = { fg = colors.bg0, bg = colors.blue },
    MasonHighlightBlockBold = { fg = colors.bg0, bg = colors.blue, bold = true },
    MasonHighlightSecondary = { fg = colors.yellow },
    MasonHighlightBlockSecondary = { fg = colors.bg0, bg = colors.yellow },
    MasonHighlightBlockBoldSecondary = { fg = colors.bg0, bg = colors.yellow, bold = true },
    MasonHeader = { link = "MasonHighlightBlockBoldSecondary" },
    MasonHeaderSecondary = { link = "MasonHighlightBlockBold" },
    MasonMuted = { fg = colors.fg4 },
    MasonMutedBlock = { fg = colors.bg0, bg = colors.fg4 },
    MasonMutedBlockBold = { fg = colors.bg0, bg = colors.fg4, bold = true },
    -- lsp-inlayhints.nvim
    LspInlayHint = { link = "comment" },
    -- carbon.nvim
    CarbonFile = { link = "black2Fg1" },
    CarbonExe = { link = "black2Yellow" },
    CarbonSymlink = { link = "black2Aqua" },
    CarbonBrokenSymlink = { link = "black2Red" },
    CarbonIndicator = { link = "black2Gray" },
    CarbonDanger = { link = "black2Red" },
    CarbonPending = { link = "black2Yellow" },
    -- noice.nvim
    NoiceCursor = { link = "TermCursor" },
    -- notify.nvim
    NotifyDEBUGBorder = { link = "black2Blue" },
    NotifyDEBUGIcon = { link = "black2Blue" },
    NotifyDEBUGTitle = { link = "black2Blue" },
    NotifyERRORBorder = { link = "black2Red" },
    NotifyERRORIcon = { link = "black2Red" },
    NotifyERRORTitle = { link = "black2Red" },
    NotifyINFOBorder = { link = "black2Aqua" },
    NotifyINFOIcon = { link = "black2Aqua" },
    NotifyINFOTitle = { link = "black2Aqua" },
    NotifyTRACEBorder = { link = "black2Green" },
    NotifyTRACEIcon = { link = "black2Green" },
    NotifyTRACETitle = { link = "black2Green" },
    NotifyWARNBorder = { link = "black2Yellow" },
    NotifyWARNIcon = { link = "black2Yellow" },
    NotifyWARNTitle = { link = "black2Yellow" },
    -- ts-rainbow2 (maintained fork)
    TSRainbowRed = { fg = colors.red },
    TSRainbowOrange = { fg = colors.orange },
    TSRainbowYellow = { fg = colors.yellow },
    TSRainbowGreen = { fg = colors.green },
    TSRainbowBlue = { fg = colors.blue },
    TSRainbowViolet = { fg = colors.purple },
    TSRainbowCyan = { fg = colors.cyan },
  }

  for group, hl in pairs(config.overrides) do
    if groups[group] then
      -- "link" should not mix with other configs (:h hi-link)
      groups[group].link = nil
    end

    groups[group] = vim.tbl_extend("force", groups[group] or {}, hl)
  end

  return groups
end

return M
