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
  local config = require("black3").config
  local colors = require("black3.palette").get_base_colors(vim.o.background, config.contrast)

  set_terminal_colors(colors)

  local groups = {
    -- Base groups
    black3Fg0 = { fg = colors.fg0 },
    black3Fg1 = { fg = colors.fg1 },
    black3Fg2 = { fg = colors.fg2 },
    black3Fg3 = { fg = colors.fg3 },
    black3Fg4 = { fg = colors.fg4 },
    black3Gray = { fg = colors.gray },
    black3Bg0 = { fg = colors.bg0 },
    black3Bg1 = { fg = colors.bg1 },
    black3Bg2 = { fg = colors.bg2 },
    black3Bg3 = { fg = colors.bg3 },
    black3Bg4 = { fg = colors.bg4 },
    black3Red = { fg = colors.red },
    black3RedBold = { fg = colors.red, bold = config.bold },
    black3Green = { fg = colors.green },
    black3GreenBold = { fg = colors.green, bold = config.bold },
    black3Yellow = { fg = colors.yellow },
    black3YellowBold = { fg = colors.yellow, bold = config.bold },
    black3Blue = { fg = colors.blue },
    black3BlueBold = { fg = colors.blue, bold = config.bold },
    black3Purple = { fg = colors.purple },
    black3PurpleBold = { fg = colors.purple, bold = config.bold },
    black3Aqua = { fg = colors.aqua },
    black3AquaBold = { fg = colors.aqua, bold = config.bold },
    black3Orange = { fg = colors.orange },
    black3OrangeBold = { fg = colors.orange, bold = config.bold },
    black3RedSign = config.transparent_mode and { fg = colors.red, reverse = config.invert_signs }
        or { fg = colors.red, bg = colors.bg1, reverse = config.invert_signs },
    black3GreenSign = config.transparent_mode and { fg = colors.green, reverse = config.invert_signs }
        or { fg = colors.green, bg = colors.bg1, reverse = config.invert_signs },
    black3YellowSign = config.transparent_mode and { fg = colors.yellow, reverse = config.invert_signs }
        or { fg = colors.yellow, bg = colors.bg1, reverse = config.invert_signs },
    black3BlueSign = config.transparent_mode and { fg = colors.blue, reverse = config.invert_signs }
        or { fg = colors.blue, bg = colors.bg1, reverse = config.invert_signs },
    black3PurpleSign = config.transparent_mode and { fg = colors.purple, reverse = config.invert_signs }
        or { fg = colors.purple, bg = colors.bg1, reverse = config.invert_signs },
    black3AquaSign = config.transparent_mode and { fg = colors.aqua, reverse = config.invert_signs }
        or { fg = colors.aqua, bg = colors.bg1, reverse = config.invert_signs },
    black3OrangeSign = config.transparent_mode and { fg = colors.orange, reverse = config.invert_signs }
        or { fg = colors.orange, bg = colors.bg1, reverse = config.invert_signs },
    black3RedUnderline = { undercurl = config.undercurl, sp = colors.red },
    black3GreenUnderline = { undercurl = config.undercurl, sp = colors.green },
    black3YellowUnderline = { undercurl = config.undercurl, sp = colors.yellow },
    black3BlueUnderline = { undercurl = config.undercurl, sp = colors.blue },
    black3PurpleUnderline = { undercurl = config.undercurl, sp = colors.purple },
    black3AquaUnderline = { undercurl = config.undercurl, sp = colors.aqua },
    black3OrangeUnderline = { undercurl = config.undercurl, sp = colors.orange },
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
    NonText = { link = "black3Bg2" },
    SpecialKey = { link = "black3Fg4" },
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
    Directory = { link = "black3BlueBold" },
    Title = { link = "black3GreenBold" },
    ErrorMsg = { fg = colors.bg0, bg = colors.red, bold = config.bold },
    MoreMsg = { link = "black3YellowBold" },
    ModeMsg = { link = "black3YellowBold" },
    Question = { link = "black3OrangeBold" },
    WarningMsg = { link = "black3RedBold" },
    LineNr = { fg = colors.bg4 },
    SignColumn = config.transparent_mode and { bg = nil } or { bg = colors.bg1 },
    Folded = { fg = colors.gray, bg = colors.bg1, italic = config.italic.folds },
    FoldColumn = config.transparent_mode and { fg = colors.gray, bg = nil } or { fg = colors.gray, bg = colors.bg1 },
    Cursor = { reverse = config.inverse },
    vCursor = { link = "Cursor" },
    iCursor = { link = "Cursor" },
    lCursor = { link = "Cursor" },
    Special = { link = "black3Orange" },
    Comment = { fg = colors.gray, italic = config.italic.comments },
    Todo = { fg = colors.fg0, bold = config.bold, italic = config.italic.comments },
    Done = { fg = colors.orange, bold = config.bold, italic = config.italic.comments },
    Error = { fg = colors.red, bold = config.bold, reverse = config.inverse },
    Statement = { link = "black3Red" },
    Conditional = { link = "black3Red" },
    Repeat = { link = "black3Red" },
    Label = { link = "black3Red" },
    Exception = { link = "black3Red" },
    Operator = { fg = colors.orange, italic = config.italic.operators },
    Keyword = { link = "black3Red" },
    Identifier = { link = "black3Blue" },
    Function = { link = "black3GreenBold" },
    PreProc = { link = "black3Aqua" },
    Include = { link = "black3Aqua" },
    Define = { link = "black3Aqua" },
    Macro = { link = "black3Aqua" },
    PreCondit = { link = "black3Aqua" },
    Constant = { link = "black3Purple" },
    Character = { link = "black3Purple" },
    String = { fg = colors.green, italic = config.italic.strings },
    Boolean = { link = "black3Purple" },
    Number = { link = "black3Purple" },
    Float = { link = "black3Purple" },
    Type = { link = "black3Yellow" },
    StorageClass = { link = "black3Orange" },
    Structure = { link = "black3Aqua" },
    Typedef = { link = "black3Yellow" },
    Pmenu = { fg = colors.fg1, bg = colors.bg2 },
    PmenuSel = { fg = colors.bg2, bg = colors.blue, bold = config.bold },
    PmenuSbar = { bg = colors.bg2 },
    PmenuThumb = { bg = colors.bg4 },
    DiffDelete = { fg = colors.red, bg = colors.bg0, reverse = config.inverse },
    DiffAdd = { fg = colors.green, bg = colors.bg0, reverse = config.inverse },
    DiffChange = { fg = colors.aqua, bg = colors.bg0, reverse = config.inverse },
    DiffText = { fg = colors.yellow, bg = colors.bg0, reverse = config.inverse },
    SpellCap = { link = "black3BlueUnderline" },
    SpellBad = { link = "black3RedUnderline" },
    SpellLocal = { link = "black3AquaUnderline" },
    SpellRare = { link = "black3PurpleUnderline" },
    Whitespace = { fg = colors.bg2 },
    -- LSP Diagnostic
    DiagnosticError = { link = "black3Red" },
    DiagnosticSignError = { link = "black3RedSign" },
    DiagnosticUnderlineError = { link = "black3RedUnderline" },
    DiagnosticWarn = { link = "black3Yellow" },
    DiagnosticSignWarn = { link = "black3YellowSign" },
    DiagnosticUnderlineWarn = { link = "black3YellowUnderline" },
    DiagnosticInfo = { link = "black3Blue" },
    DiagnosticSignInfo = { link = "black3BlueSign" },
    DiagnosticUnderlineInfo = { link = "black3BlueUnderline" },
    DiagnosticHint = { link = "black3Aqua" },
    DiagnosticSignHint = { link = "black3AquaSign" },
    DiagnosticUnderlineHint = { link = "black3AquaUnderline" },
    DiagnosticFloatingError = { link = "black3Red" },
    DiagnosticFloatingWarn = { link = "black3Orange" },
    DiagnosticFloatingInfo = { link = "black3Blue" },
    DiagnosticFloatingHint = { link = "black3Aqua" },
    DiagnosticVirtualTextError = { link = "black3Red" },
    DiagnosticVirtualTextWarn = { link = "black3Yellow" },
    DiagnosticVirtualTextInfo = { link = "black3Blue" },
    DiagnosticVirtualTextHint = { link = "black3Aqua" },
    LspReferenceRead = { link = "black3YellowBold" },
    LspReferenceText = { link = "black3YellowBold" },
    LspReferenceWrite = { link = "black3OrangeBold" },
    LspCodeLens = { link = "black3Gray" },
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
    ["@keyword.operator"] = { link = "black3Red" },
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
    ["@variable"] = { link = "black3Fg1" },
    -- @variable.builtin ; built-in variable names (e.g. `this`)
    ["@variable.builtin"] = { link = "Special" },
    -- @constant         ; constant identifiers
    ["@constant"] = { link = "Constant" },
    -- @constant.builtin ; built-in constant values
    ["@constant.builtin"] = { link = "Special" },
    -- @constant.macro   ; constants defined by the preprocessor
    ["@constant.macro"] = { link = "Define" },
    -- @namespace        ; modules or namespaces
    ["@namespace"] = { link = "black3Fg1" },
    -- @symbol           ; symbols or atoms
    ["@symbol"] = { link = "Identifier" },
    --
    -- Text
    --
    -- @text                  ; non-structured text
    ["@text"] = { link = "black3Fg1" },
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
    gitcommitSelectedFile = { link = "black3Green" },
    gitcommitDiscardedFile = { link = "black3Red" },
    -- gitsigns.nvim
    GitSignsAdd = { link = "black3GreenSign" },
    GitSignsChange = { link = "black3AquaSign" },
    GitSignsDelete = { link = "black3RedSign" },
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
    debugBreakpoint = { link = "black3RedSign" },
    -- vim-startify
    StartifyBracket = { link = "black3Fg3" },
    StartifyFile = { link = "black3Fg1" },
    StartifyNumber = { link = "black3Blue" },
    StartifyPath = { link = "black3Gray" },
    StartifySlash = { link = "black3Gray" },
    StartifySection = { link = "black3Yellow" },
    StartifySpecial = { link = "black3Bg2" },
    StartifyHeader = { link = "black3Orange" },
    StartifyFooter = { link = "black3Bg2" },
    StartifyVar = { link = "StartifyPath" },
    StartifySelect = { link = "Title" },
    -- vim-dirvish
    DirvishPathTail = { link = "black3Aqua" },
    DirvishArg = { link = "black3Yellow" },
    -- netrw
    netrwDir = { link = "black3Aqua" },
    netrwClassify = { link = "black3Aqua" },
    netrwLink = { link = "black3Gray" },
    netrwSymLink = { link = "black3Fg1" },
    netrwExe = { link = "black3Yellow" },
    netrwComment = { link = "black3Gray" },
    netrwList = { link = "black3Blue" },
    netrwHelpCmd = { link = "black3Aqua" },
    netrwCmdSep = { link = "black3Fg3" },
    netrwVersion = { link = "black3Green" },
    -- nerdtree
    NERDTreeDir = { link = "black3Aqua" },
    NERDTreeDirSlash = { link = "black3Aqua" },
    NERDTreeOpenable = { link = "black3Orange" },
    NERDTreeClosable = { link = "black3Orange" },
    NERDTreeFile = { link = "black3Fg1" },
    NERDTreeExecFile = { link = "black3Yellow" },
    NERDTreeUp = { link = "black3Gray" },
    NERDTreeCWD = { link = "black3Green" },
    NERDTreeHelp = { link = "black3Fg1" },
    NERDTreeToggleOn = { link = "black3Green" },
    NERDTreeToggleOff = { link = "black3Red" },
    -- coc.nvim
    CocErrorSign = { link = "black3RedSign" },
    CocWarningSign = { link = "black3OrangeSign" },
    CocInfoSign = { link = "black3BlueSign" },
    CocHintSign = { link = "black3AquaSign" },
    CocErrorFloat = { link = "black3Red" },
    CocWarningFloat = { link = "black3Orange" },
    CocInfoFloat = { link = "black3Blue" },
    CocHintFloat = { link = "black3Aqua" },
    CocDiagnosticsError = { link = "black3Red" },
    CocDiagnosticsWarning = { link = "black3Orange" },
    CocDiagnosticsInfo = { link = "black3Blue" },
    CocDiagnosticsHint = { link = "black3Aqua" },
    CocSelectedText = { link = "black3Red" },
    CocMenuSel = { link = "PmenuSel" },
    CocCodeLens = { link = "black3Gray" },
    CocErrorHighlight = { link = "black3RedUnderline" },
    CocWarningHighlight = { link = "black3OrangeUnderline" },
    CocInfoHighlight = { link = "black3BlueUnderline" },
    CocHintHighlight = { link = "black3AquaUnderline" },
    -- telescope.nvim
    TelescopeNormal = { link = "black3Fg1" },
    TelescopeSelection = { link = "black3OrangeBold" },
    TelescopeSelectionCaret = { link = "black3Red" },
    TelescopeMultiSelection = { link = "black3Gray" },
    TelescopeBorder = { link = "TelescopeNormal" },
    TelescopePromptBorder = { link = "TelescopeNormal" },
    TelescopeResultsBorder = { link = "TelescopeNormal" },
    TelescopePreviewBorder = { link = "TelescopeNormal" },
    TelescopeMatching = { link = "black3Blue" },
    TelescopePromptPrefix = { link = "black3Red" },
    TelescopePrompt = { link = "TelescopeNormal" },
    -- nvim-cmp
    CmpItemAbbr = { link = "black3Fg0" },
    CmpItemAbbrDeprecated = { link = "black3Fg1" },
    CmpItemAbbrMatch = { link = "black3BlueBold" },
    CmpItemAbbrMatchFuzzy = { link = "black3BlueUnderline" },
    CmpItemMenu = { link = "black3Gray" },
    CmpItemKindText = { link = "black3Orange" },
    CmpItemKindVariable = { link = "black3Orange" },
    CmpItemKindMethod = { link = "black3Blue" },
    CmpItemKindFunction = { link = "black3Blue" },
    CmpItemKindConstructor = { link = "black3Yellow" },
    CmpItemKindUnit = { link = "black3Blue" },
    CmpItemKindField = { link = "black3Blue" },
    CmpItemKindClass = { link = "black3Yellow" },
    CmpItemKindInterface = { link = "black3Yellow" },
    CmpItemKindModule = { link = "black3Blue" },
    CmpItemKindProperty = { link = "black3Blue" },
    CmpItemKindValue = { link = "black3Orange" },
    CmpItemKindEnum = { link = "black3Yellow" },
    CmpItemKindOperator = { link = "black3Yellow" },
    CmpItemKindKeyword = { link = "black3Purple" },
    CmpItemKindEvent = { link = "black3Purple" },
    CmpItemKindReference = { link = "black3Purple" },
    CmpItemKindColor = { link = "black3Purple" },
    CmpItemKindSnippet = { link = "black3Green" },
    CmpItemKindFile = { link = "black3Blue" },
    CmpItemKindFolder = { link = "black3Blue" },
    CmpItemKindEnumMember = { link = "black3Aqua" },
    CmpItemKindConstant = { link = "black3Orange" },
    CmpItemKindStruct = { link = "black3Yellow" },
    CmpItemKindTypeParameter = { link = "black3Yellow" },
    diffAdded = { link = "black3Green" },
    diffRemoved = { link = "black3Red" },
    diffChanged = { link = "black3Aqua" },
    diffFile = { link = "black3Orange" },
    diffNewFile = { link = "black3Yellow" },
    diffOldFile = { link = "black3Orange" },
    diffLine = { link = "black3Blue" },
    diffIndexLine = { link = "diffChanged" },
    -- navic (highlight icons)
    NavicIconsFile = { link = "black3Blue" },
    NavicIconsModule = { link = "black3Orange" },
    NavicIconsNamespace = { link = "black3Blue" },
    NavicIconsPackage = { link = "black3Aqua" },
    NavicIconsClass = { link = "black3Yellow" },
    NavicIconsMethod = { link = "black3Blue" },
    NavicIconsProperty = { link = "black3Aqua" },
    NavicIconsField = { link = "black3Purple" },
    NavicIconsConstructor = { link = "black3Blue" },
    NavicIconsEnum = { link = "black3Purple" },
    NavicIconsInterface = { link = "black3Green" },
    NavicIconsFunction = { link = "black3Blue" },
    NavicIconsVariable = { link = "black3Purple" },
    NavicIconsConstant = { link = "black3Orange" },
    NavicIconsString = { link = "black3Green" },
    NavicIconsNumber = { link = "black3Orange" },
    NavicIconsBoolean = { link = "black3Orange" },
    NavicIconsArray = { link = "black3Orange" },
    NavicIconsObject = { link = "black3Orange" },
    NavicIconsKey = { link = "black3Aqua" },
    NavicIconsNull = { link = "black3Orange" },
    NavicIconsEnumMember = { link = "black3Yellow" },
    NavicIconsStruct = { link = "black3Purple" },
    NavicIconsEvent = { link = "black3Yellow" },
    NavicIconsOperator = { link = "black3Red" },
    NavicIconsTypeParameter = { link = "black3Red" },
    NavicText = { link = "black3White" },
    NavicSeparator = { link = "black3White" },
    -- html
    htmlTag = { link = "black3AquaBold" },
    htmlEndTag = { link = "black3AquaBold" },
    htmlTagName = { link = "black3Blue" },
    htmlArg = { link = "black3Orange" },
    htmlTagN = { link = "black3Fg1" },
    htmlSpecialTagName = { link = "black3Blue" },
    htmlLink = { fg = colors.fg4, underline = config.underline },
    htmlSpecialChar = { link = "black3Red" },
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
    xmlTag = { link = "black3AquaBold" },
    xmlEndTag = { link = "black3AquaBold" },
    xmlTagName = { link = "black3Blue" },
    xmlEqual = { link = "black3Blue" },
    docbkKeyword = { link = "black3AquaBold" },
    xmlDocTypeDecl = { link = "black3Gray" },
    xmlDocTypeKeyword = { link = "black3Purple" },
    xmlCdataStart = { link = "black3Gray" },
    xmlCdataCdata = { link = "black3Purple" },
    dtdFunction = { link = "black3Gray" },
    dtdTagName = { link = "black3Purple" },
    xmlAttrib = { link = "black3Orange" },
    xmlProcessingDelim = { link = "black3Gray" },
    dtdParamEntityPunct = { link = "black3Gray" },
    dtdParamEntityDPunct = { link = "black3Gray" },
    xmlAttribPunct = { link = "black3Gray" },
    xmlEntity = { link = "black3Red" },
    xmlEntityPunct = { link = "black3Red" },
    -- clojure
    clojureKeyword = { link = "black3Blue" },
    clojureCond = { link = "black3Orange" },
    clojureSpecial = { link = "black3Orange" },
    clojureDefine = { link = "black3Orange" },
    clojureFunc = { link = "black3Yellow" },
    clojureRepeat = { link = "black3Yellow" },
    clojureCharacter = { link = "black3Aqua" },
    clojureStringEscape = { link = "black3Aqua" },
    clojureException = { link = "black3Red" },
    clojureRegexp = { link = "black3Aqua" },
    clojureRegexpEscape = { link = "black3Aqua" },
    clojureRegexpCharClass = { fg = colors.fg3, bold = config.bold },
    clojureRegexpMod = { link = "clojureRegexpCharClass" },
    clojureRegexpQuantifier = { link = "clojureRegexpCharClass" },
    clojureParen = { link = "black3Fg3" },
    clojureAnonArg = { link = "black3Yellow" },
    clojureVariable = { link = "black3Blue" },
    clojureMacro = { link = "black3Orange" },
    clojureMeta = { link = "black3Yellow" },
    clojureDeref = { link = "black3Yellow" },
    clojureQuote = { link = "black3Yellow" },
    clojureUnquote = { link = "black3Yellow" },
    -- C
    cOperator = { link = "black3Purple" },
    cppOperator = { link = "black3Purple" },
    cStructure = { link = "black3Orange" },
    -- python
    pythonBuiltin = { link = "black3Orange" },
    pythonBuiltinObj = { link = "black3Orange" },
    pythonBuiltinFunc = { link = "black3Orange" },
    pythonFunction = { link = "black3Aqua" },
    pythonDecorator = { link = "black3Red" },
    pythonInclude = { link = "black3Blue" },
    pythonImport = { link = "black3Blue" },
    pythonRun = { link = "black3Blue" },
    pythonCoding = { link = "black3Blue" },
    pythonOperator = { link = "black3Red" },
    pythonException = { link = "black3Red" },
    pythonExceptions = { link = "black3Purple" },
    pythonBoolean = { link = "black3Purple" },
    pythonDot = { link = "black3Fg3" },
    pythonConditional = { link = "black3Red" },
    pythonRepeat = { link = "black3Red" },
    pythonDottedName = { link = "black3GreenBold" },
    -- CSS
    cssBraces = { link = "black3Blue" },
    cssFunctionName = { link = "black3Yellow" },
    cssIdentifier = { link = "black3Orange" },
    cssClassName = { link = "black3Green" },
    cssColor = { link = "black3Blue" },
    cssSelectorOp = { link = "black3Blue" },
    cssSelectorOp2 = { link = "black3Blue" },
    cssImportant = { link = "black3Green" },
    cssVendor = { link = "black3Fg1" },
    cssTextProp = { link = "black3Aqua" },
    cssAnimationProp = { link = "black3Aqua" },
    cssUIProp = { link = "black3Yellow" },
    cssTransformProp = { link = "black3Aqua" },
    cssTransitionProp = { link = "black3Aqua" },
    cssPrintProp = { link = "black3Aqua" },
    cssPositioningProp = { link = "black3Yellow" },
    cssBoxProp = { link = "black3Aqua" },
    cssFontDescriptorProp = { link = "black3Aqua" },
    cssFlexibleBoxProp = { link = "black3Aqua" },
    cssBorderOutlineProp = { link = "black3Aqua" },
    cssBackgroundProp = { link = "black3Aqua" },
    cssMarginProp = { link = "black3Aqua" },
    cssListProp = { link = "black3Aqua" },
    cssTableProp = { link = "black3Aqua" },
    cssFontProp = { link = "black3Aqua" },
    cssPaddingProp = { link = "black3Aqua" },
    cssDimensionProp = { link = "black3Aqua" },
    cssRenderProp = { link = "black3Aqua" },
    cssColorProp = { link = "black3Aqua" },
    cssGeneratedContentProp = { link = "black3Aqua" },
    -- javascript
    javaScriptBraces = { link = "black3Fg1" },
    javaScriptFunction = { link = "black3Aqua" },
    javaScriptIdentifier = { link = "black3Red" },
    javaScriptMember = { link = "black3Blue" },
    javaScriptNumber = { link = "black3Purple" },
    javaScriptNull = { link = "black3Purple" },
    javaScriptParens = { link = "black3Fg3" },
    -- typescript
    typescriptReserved = { link = "black3Aqua" },
    typescriptLabel = { link = "black3Aqua" },
    typescriptFuncKeyword = { link = "black3Aqua" },
    typescriptIdentifier = { link = "black3Orange" },
    typescriptBraces = { link = "black3Fg1" },
    typescriptEndColons = { link = "black3Fg1" },
    typescriptDOMObjects = { link = "black3Fg1" },
    typescriptAjaxMethods = { link = "black3Fg1" },
    typescriptLogicSymbols = { link = "black3Fg1" },
    typescriptDocSeeTag = { link = "Comment" },
    typescriptDocParam = { link = "Comment" },
    typescriptDocTags = { link = "vimCommentTitle" },
    typescriptGlobalObjects = { link = "black3Fg1" },
    typescriptParens = { link = "black3Fg3" },
    typescriptOpSymbols = { link = "black3Fg3" },
    typescriptHtmlElemProperties = { link = "black3Fg1" },
    typescriptNull = { link = "black3Purple" },
    typescriptInterpolationDelimiter = { link = "black3Aqua" },
    -- purescript
    purescriptModuleKeyword = { link = "black3Aqua" },
    purescriptModuleName = { link = "black3Fg1" },
    purescriptWhere = { link = "black3Aqua" },
    purescriptDelimiter = { link = "black3Fg4" },
    purescriptType = { link = "black3Fg1" },
    purescriptImportKeyword = { link = "black3Aqua" },
    purescriptHidingKeyword = { link = "black3Aqua" },
    purescriptAsKeyword = { link = "black3Aqua" },
    purescriptStructure = { link = "black3Aqua" },
    purescriptOperator = { link = "black3Blue" },
    purescriptTypeVar = { link = "black3Fg1" },
    purescriptConstructor = { link = "black3Fg1" },
    purescriptFunction = { link = "black3Fg1" },
    purescriptConditional = { link = "black3Orange" },
    purescriptBacktick = { link = "black3Orange" },
    -- coffescript
    coffeeExtendedOp = { link = "black3Fg3" },
    coffeeSpecialOp = { link = "black3Fg3" },
    coffeeCurly = { link = "black3Orange" },
    coffeeParen = { link = "black3Fg3" },
    coffeeBracket = { link = "black3Orange" },
    -- ruby
    rubyStringDelimiter = { link = "black3Green" },
    rubyInterpolationDelimiter = { link = "black3Aqua" },
    rubyDefinedOperator = { link = "rubyKeyword" },
    -- objc
    objcTypeModifier = { link = "black3Red" },
    objcDirective = { link = "black3Blue" },
    -- go
    goDirective = { link = "black3Aqua" },
    goConstants = { link = "black3Purple" },
    goDeclaration = { link = "black3Red" },
    goDeclType = { link = "black3Blue" },
    goBuiltins = { link = "black3Orange" },
    -- lua
    luaIn = { link = "black3Red" },
    luaFunction = { link = "black3Aqua" },
    luaTable = { link = "black3Orange" },
    -- moonscript
    moonSpecialOp = { link = "black3Fg3" },
    moonExtendedOp = { link = "black3Fg3" },
    moonFunction = { link = "black3Fg3" },
    moonObject = { link = "black3Yellow" },
    -- java
    javaAnnotation = { link = "black3Blue" },
    javaDocTags = { link = "black3Aqua" },
    javaCommentTitle = { link = "vimCommentTitle" },
    javaParen = { link = "black3Fg3" },
    javaParen1 = { link = "black3Fg3" },
    javaParen2 = { link = "black3Fg3" },
    javaParen3 = { link = "black3Fg3" },
    javaParen4 = { link = "black3Fg3" },
    javaParen5 = { link = "black3Fg3" },
    javaOperator = { link = "black3Orange" },
    javaVarArg = { link = "black3Green" },
    -- elixir
    elixirDocString = { link = "Comment" },
    elixirStringDelimiter = { link = "black3Green" },
    elixirInterpolationDelimiter = { link = "black3Aqua" },
    elixirModuleDeclaration = { link = "black3Yellow" },
    -- scala
    scalaNameDefinition = { link = "black3Fg1" },
    scalaCaseFollowing = { link = "black3Fg1" },
    scalaCapitalWord = { link = "black3Fg1" },
    scalaTypeExtension = { link = "black3Fg1" },
    scalaKeyword = { link = "black3Red" },
    scalaKeywordModifier = { link = "black3Red" },
    scalaSpecial = { link = "black3Aqua" },
    scalaOperator = { link = "black3Fg1" },
    scalaTypeDeclaration = { link = "black3Yellow" },
    scalaTypeTypePostDeclaration = { link = "black3Yellow" },
    scalaInstanceDeclaration = { link = "black3Fg1" },
    scalaInterpolation = { link = "black3Aqua" },
    -- markdown
    markdownItalic = { fg = colors.fg3, italic = true },
    markdownBold = { fg = colors.fg3, bold = config.bold },
    markdownBoldItalic = { fg = colors.fg3, bold = config.bold, italic = true },
    markdownH1 = { link = "black3GreenBold" },
    markdownH2 = { link = "black3GreenBold" },
    markdownH3 = { link = "black3YellowBold" },
    markdownH4 = { link = "black3YellowBold" },
    markdownH5 = { link = "black3Yellow" },
    markdownH6 = { link = "black3Yellow" },
    markdownCode = { link = "black3Aqua" },
    markdownCodeBlock = { link = "black3Aqua" },
    markdownCodeDelimiter = { link = "black3Aqua" },
    markdownBlockquote = { link = "black3Gray" },
    markdownListMarker = { link = "black3Gray" },
    markdownOrderedListMarker = { link = "black3Gray" },
    markdownRule = { link = "black3Gray" },
    markdownHeadingRule = { link = "black3Gray" },
    markdownUrlDelimiter = { link = "black3Fg3" },
    markdownLinkDelimiter = { link = "black3Fg3" },
    markdownLinkTextDelimiter = { link = "black3Fg3" },
    markdownHeadingDelimiter = { link = "black3Orange" },
    markdownUrl = { link = "black3Purple" },
    markdownUrlTitleDelimiter = { link = "black3Green" },
    markdownLinkText = { fg = colors.gray, underline = config.underline },
    markdownIdDeclaration = { link = "markdownLinkText" },
    -- haskell
    haskellType = { link = "black3Blue" },
    haskellIdentifier = { link = "black3Aqua" },
    haskellSeparator = { link = "black3Fg4" },
    haskellDelimiter = { link = "black3Orange" },
    haskellOperators = { link = "black3Purple" },
    haskellBacktick = { link = "black3Orange" },
    haskellStatement = { link = "black3Purple" },
    haskellConditional = { link = "black3Purple" },
    haskellLet = { link = "black3Red" },
    haskellDefault = { link = "black3Red" },
    haskellWhere = { link = "black3Red" },
    haskellBottom = { link = "black3RedBold" },
    haskellImportKeywords = { link = "black3PurpleBold" },
    haskellDeclKeyword = { link = "black3Orange" },
    haskellDecl = { link = "black3Orange" },
    haskellDeriving = { link = "black3Purple" },
    haskellAssocType = { link = "black3Aqua" },
    haskellNumber = { link = "black3Aqua" },
    haskellPragma = { link = "black3RedBold" },
    haskellTH = { link = "black3AquaBold" },
    haskellForeignKeywords = { link = "black3Green" },
    haskellKeyword = { link = "black3Red" },
    haskellFloat = { link = "black3Aqua" },
    haskellInfix = { link = "black3Purple" },
    haskellQuote = { link = "black3GreenBold" },
    haskellShebang = { link = "black3YellowBold" },
    haskellLiquid = { link = "black3PurpleBold" },
    haskellQuasiQuoted = { link = "black3BlueBold" },
    haskellRecursiveDo = { link = "black3Purple" },
    haskellQuotedType = { link = "black3Red" },
    haskellPreProc = { link = "black3Fg4" },
    haskellTypeRoles = { link = "black3RedBold" },
    haskellTypeForall = { link = "black3Red" },
    haskellPatternKeyword = { link = "black3Blue" },
    -- json
    jsonKeyword = { link = "black3Green" },
    jsonQuote = { link = "black3Green" },
    jsonBraces = { link = "black3Fg1" },
    jsonString = { link = "black3Fg1" },
    -- mail
    mailQuoted1 = { link = "black3Aqua" },
    mailQuoted2 = { link = "black3Purple" },
    mailQuoted3 = { link = "black3Yellow" },
    mailQuoted4 = { link = "black3Green" },
    mailQuoted5 = { link = "black3Red" },
    mailQuoted6 = { link = "black3Orange" },
    mailSignature = { link = "Comment" },
    -- c#
    csBraces = { link = "black3Fg1" },
    csEndColon = { link = "black3Fg1" },
    csLogicSymbols = { link = "black3Fg1" },
    csParens = { link = "black3Fg3" },
    csOpSymbols = { link = "black3Fg3" },
    csInterpolationDelimiter = { link = "black3Fg3" },
    csInterpolationAlignDel = { link = "black3AquaBold" },
    csInterpolationFormat = { link = "black3Aqua" },
    csInterpolationFormatDel = { link = "black3AquaBold" },
    -- rust btw
    rustSigil = { link = "black3Orange" },
    rustEscape = { link = "black3Aqua" },
    rustStringContinuation = { link = "black3Aqua" },
    rustEnum = { link = "black3Aqua" },
    rustStructure = { link = "black3Aqua" },
    rustModPathSep = { link = "black3Fg2" },
    rustCommentLineDoc = { link = "Comment" },
    rustDefault = { link = "black3Aqua" },
    -- ocaml
    ocamlOperator = { link = "black3Fg1" },
    ocamlKeyChar = { link = "black3Orange" },
    ocamlArrow = { link = "black3Orange" },
    ocamlInfixOpKeyword = { link = "black3Red" },
    ocamlConstructor = { link = "black3Orange" },
    -- lspsaga.nvim
    LspSagaCodeActionTitle = { link = "Title" },
    LspSagaCodeActionBorder = { link = "black3Fg1" },
    LspSagaCodeActionContent = { fg = colors.green, bold = config.bold },
    LspSagaLspFinderBorder = { link = "black3Fg1" },
    LspSagaAutoPreview = { link = "black3Orange" },
    TargetWord = { fg = colors.blue, bold = config.bold },
    FinderSeparator = { link = "black3Aqua" },
    LspSagaDefPreviewBorder = { link = "black3Blue" },
    LspSagaHoverBorder = { link = "black3Orange" },
    LspSagaRenameBorder = { link = "black3Blue" },
    LspSagaDiagnosticSource = { link = "black3Orange" },
    LspSagaDiagnosticBorder = { link = "black3Purple" },
    LspSagaDiagnosticHeader = { link = "black3Green" },
    LspSagaSignatureHelpBorder = { link = "black3Green" },
    SagaShadow = { link = "black3Bg0" },
    -- dashboard-nvim
    DashboardShortCut = { link = "black3Orange" },
    DashboardHeader = { link = "black3Aqua" },
    DashboardCenter = { link = "black3Yellow" },
    DashboardFooter = { fg = colors.purple, italic = true },
    -- mason
    MasonHighlight = { link = "black3Aqua" },
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
    CarbonFile = { link = "black3Fg1" },
    CarbonExe = { link = "black3Yellow" },
    CarbonSymlink = { link = "black3Aqua" },
    CarbonBrokenSymlink = { link = "black3Red" },
    CarbonIndicator = { link = "black3Gray" },
    CarbonDanger = { link = "black3Red" },
    CarbonPending = { link = "black3Yellow" },
    -- noice.nvim
    NoiceCursor = { link = "TermCursor" },
    -- notify.nvim
    NotifyDEBUGBorder = { link = "black3Blue" },
    NotifyDEBUGIcon = { link = "black3Blue" },
    NotifyDEBUGTitle = { link = "black3Blue" },
    NotifyERRORBorder = { link = "black3Red" },
    NotifyERRORIcon = { link = "black3Red" },
    NotifyERRORTitle = { link = "black3Red" },
    NotifyINFOBorder = { link = "black3Aqua" },
    NotifyINFOIcon = { link = "black3Aqua" },
    NotifyINFOTitle = { link = "black3Aqua" },
    NotifyTRACEBorder = { link = "black3Green" },
    NotifyTRACEIcon = { link = "black3Green" },
    NotifyTRACETitle = { link = "black3Green" },
    NotifyWARNBorder = { link = "black3Yellow" },
    NotifyWARNIcon = { link = "black3Yellow" },
    NotifyWARNTitle = { link = "black3Yellow" },
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
