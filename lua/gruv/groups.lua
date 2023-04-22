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
  local config = require("gruv").config
  local colors = require("gruv.palette").get_base_colors(vim.o.background, config.contrast)

  set_terminal_colors(colors)

  local groups = {
    -- Base groups
    gruvFg0 = { fg = colors.fg0 },
    gruvFg1 = { fg = colors.fg1 },
    gruvFg2 = { fg = colors.fg2 },
    gruvFg3 = { fg = colors.fg3 },
    gruvFg4 = { fg = colors.fg4 },
    gruvGray = { fg = colors.gray },
    gruvBg0 = { fg = colors.bg0 },
    gruvBg1 = { fg = colors.bg1 },
    gruvBg2 = { fg = colors.bg2 },
    gruvBg3 = { fg = colors.bg3 },
    gruvBg4 = { fg = colors.bg4 },
    gruvRed = { fg = colors.red },
    gruvRedBold = { fg = colors.red, bold = config.bold },
    gruvGreen = { fg = colors.green },
    gruvGreenBold = { fg = colors.green, bold = config.bold },
    gruvYellow = { fg = colors.yellow },
    gruvYellowBold = { fg = colors.yellow, bold = config.bold },
    gruvBlue = { fg = colors.blue },
    gruvBlueBold = { fg = colors.blue, bold = config.bold },
    gruvPurple = { fg = colors.purple },
    gruvPurpleBold = { fg = colors.purple, bold = config.bold },
    gruvAqua = { fg = colors.aqua },
    gruvAquaBold = { fg = colors.aqua, bold = config.bold },
    gruvOrange = { fg = colors.orange },
    gruvOrangeBold = { fg = colors.orange, bold = config.bold },
    gruvRedSign = config.transparent_mode and { fg = colors.red, reverse = config.invert_signs }
        or { fg = colors.red, bg = colors.bg1, reverse = config.invert_signs },
    gruvGreenSign = config.transparent_mode and { fg = colors.green, reverse = config.invert_signs }
        or { fg = colors.green, bg = colors.bg1, reverse = config.invert_signs },
    gruvYellowSign = config.transparent_mode and { fg = colors.yellow, reverse = config.invert_signs }
        or { fg = colors.yellow, bg = colors.bg1, reverse = config.invert_signs },
    gruvBlueSign = config.transparent_mode and { fg = colors.blue, reverse = config.invert_signs }
        or { fg = colors.blue, bg = colors.bg1, reverse = config.invert_signs },
    gruvPurpleSign = config.transparent_mode and { fg = colors.purple, reverse = config.invert_signs }
        or { fg = colors.purple, bg = colors.bg1, reverse = config.invert_signs },
    gruvAquaSign = config.transparent_mode and { fg = colors.aqua, reverse = config.invert_signs }
        or { fg = colors.aqua, bg = colors.bg1, reverse = config.invert_signs },
    gruvOrangeSign = config.transparent_mode and { fg = colors.orange, reverse = config.invert_signs }
        or { fg = colors.orange, bg = colors.bg1, reverse = config.invert_signs },
    gruvRedUnderline = { undercurl = config.undercurl, sp = colors.red },
    gruvGreenUnderline = { undercurl = config.undercurl, sp = colors.green },
    gruvYellowUnderline = { undercurl = config.undercurl, sp = colors.yellow },
    gruvBlueUnderline = { undercurl = config.undercurl, sp = colors.blue },
    gruvPurpleUnderline = { undercurl = config.undercurl, sp = colors.purple },
    gruvAquaUnderline = { undercurl = config.undercurl, sp = colors.aqua },
    gruvOrangeUnderline = { undercurl = config.undercurl, sp = colors.orange },
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
    NonText = { link = "gruvBg2" },
    SpecialKey = { link = "gruvFg4" },
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
    Directory = { link = "gruvBlueBold" },
    Title = { link = "gruvGreenBold" },
    ErrorMsg = { fg = colors.bg0, bg = colors.red, bold = config.bold },
    MoreMsg = { link = "gruvYellowBold" },
    ModeMsg = { link = "gruvYellowBold" },
    Question = { link = "gruvOrangeBold" },
    WarningMsg = { link = "gruvRedBold" },
    LineNr = { fg = colors.bg4 },
    SignColumn = config.transparent_mode and { bg = nil } or { bg = colors.bg1 },
    Folded = { fg = colors.gray, bg = colors.bg1, italic = config.italic.folds },
    FoldColumn = config.transparent_mode and { fg = colors.gray, bg = nil } or { fg = colors.gray, bg = colors.bg1 },
    Cursor = { reverse = config.inverse },
    vCursor = { link = "Cursor" },
    iCursor = { link = "Cursor" },
    lCursor = { link = "Cursor" },
    Special = { link = "gruvOrange" },
    Comment = { fg = colors.gray, italic = config.italic.comments },
    Todo = { fg = colors.fg0, bold = config.bold, italic = config.italic.comments },
    Done = { fg = colors.orange, bold = config.bold, italic = config.italic.comments },
    Error = { fg = colors.red, bold = config.bold, reverse = config.inverse },
    Statement = { link = "gruvRed" },
    Conditional = { link = "gruvRed" },
    Repeat = { link = "gruvRed" },
    Label = { link = "gruvRed" },
    Exception = { link = "gruvRed" },
    Operator = { fg = colors.orange, italic = config.italic.operators },
    Keyword = { link = "gruvRed" },
    Identifier = { link = "gruvBlue" },
    Function = { link = "gruvGreenBold" },
    PreProc = { link = "gruvAqua" },
    Include = { link = "gruvAqua" },
    Define = { link = "gruvAqua" },
    Macro = { link = "gruvAqua" },
    PreCondit = { link = "gruvAqua" },
    Constant = { link = "gruvPurple" },
    Character = { link = "gruvPurple" },
    String = { fg = colors.green, italic = config.italic.strings },
    Boolean = { link = "gruvPurple" },
    Number = { link = "gruvPurple" },
    Float = { link = "gruvPurple" },
    Type = { link = "gruvYellow" },
    StorageClass = { link = "gruvOrange" },
    Structure = { link = "gruvAqua" },
    Typedef = { link = "gruvYellow" },
    Pmenu = { fg = colors.fg1, bg = colors.bg2 },
    PmenuSel = { fg = colors.bg2, bg = colors.blue, bold = config.bold },
    PmenuSbar = { bg = colors.bg2 },
    PmenuThumb = { bg = colors.bg4 },
    DiffDelete = { fg = colors.red, bg = colors.bg0, reverse = config.inverse },
    DiffAdd = { fg = colors.green, bg = colors.bg0, reverse = config.inverse },
    DiffChange = { fg = colors.aqua, bg = colors.bg0, reverse = config.inverse },
    DiffText = { fg = colors.yellow, bg = colors.bg0, reverse = config.inverse },
    SpellCap = { link = "gruvBlueUnderline" },
    SpellBad = { link = "gruvRedUnderline" },
    SpellLocal = { link = "gruvAquaUnderline" },
    SpellRare = { link = "gruvPurpleUnderline" },
    Whitespace = { fg = colors.bg2 },
    -- LSP Diagnostic
    DiagnosticError = { link = "gruvRed" },
    DiagnosticSignError = { link = "gruvRedSign" },
    DiagnosticUnderlineError = { link = "gruvRedUnderline" },
    DiagnosticWarn = { link = "gruvYellow" },
    DiagnosticSignWarn = { link = "gruvYellowSign" },
    DiagnosticUnderlineWarn = { link = "gruvYellowUnderline" },
    DiagnosticInfo = { link = "gruvBlue" },
    DiagnosticSignInfo = { link = "gruvBlueSign" },
    DiagnosticUnderlineInfo = { link = "gruvBlueUnderline" },
    DiagnosticHint = { link = "gruvAqua" },
    DiagnosticSignHint = { link = "gruvAquaSign" },
    DiagnosticUnderlineHint = { link = "gruvAquaUnderline" },
    DiagnosticFloatingError = { link = "gruvRed" },
    DiagnosticFloatingWarn = { link = "gruvOrange" },
    DiagnosticFloatingInfo = { link = "gruvBlue" },
    DiagnosticFloatingHint = { link = "gruvAqua" },
    DiagnosticVirtualTextError = { link = "gruvRed" },
    DiagnosticVirtualTextWarn = { link = "gruvYellow" },
    DiagnosticVirtualTextInfo = { link = "gruvBlue" },
    DiagnosticVirtualTextHint = { link = "gruvAqua" },
    LspReferenceRead = { link = "gruvYellowBold" },
    LspReferenceText = { link = "gruvYellowBold" },
    LspReferenceWrite = { link = "gruvOrangeBold" },
    LspCodeLens = { link = "gruvGray" },
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
    ["@keyword.operator"] = { link = "gruvRed" },
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
    ["@variable"] = { link = "gruvFg1" },
    -- @variable.builtin ; built-in variable names (e.g. `this`)
    ["@variable.builtin"] = { link = "Special" },
    -- @constant         ; constant identifiers
    ["@constant"] = { link = "Constant" },
    -- @constant.builtin ; built-in constant values
    ["@constant.builtin"] = { link = "Special" },
    -- @constant.macro   ; constants defined by the preprocessor
    ["@constant.macro"] = { link = "Define" },
    -- @namespace        ; modules or namespaces
    ["@namespace"] = { link = "gruvFg1" },
    -- @symbol           ; symbols or atoms
    ["@symbol"] = { link = "Identifier" },
    --
    -- Text
    --
    -- @text                  ; non-structured text
    ["@text"] = { link = "gruvFg1" },
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
    gitcommitSelectedFile = { link = "gruvGreen" },
    gitcommitDiscardedFile = { link = "gruvRed" },
    -- gitsigns.nvim
    GitSignsAdd = { link = "gruvGreenSign" },
    GitSignsChange = { link = "gruvAquaSign" },
    GitSignsDelete = { link = "gruvRedSign" },
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
    debugBreakpoint = { link = "gruvRedSign" },
    -- vim-startify
    StartifyBracket = { link = "gruvFg3" },
    StartifyFile = { link = "gruvFg1" },
    StartifyNumber = { link = "gruvBlue" },
    StartifyPath = { link = "gruvGray" },
    StartifySlash = { link = "gruvGray" },
    StartifySection = { link = "gruvYellow" },
    StartifySpecial = { link = "gruvBg2" },
    StartifyHeader = { link = "gruvOrange" },
    StartifyFooter = { link = "gruvBg2" },
    StartifyVar = { link = "StartifyPath" },
    StartifySelect = { link = "Title" },
    -- vim-dirvish
    DirvishPathTail = { link = "gruvAqua" },
    DirvishArg = { link = "gruvYellow" },
    -- netrw
    netrwDir = { link = "gruvAqua" },
    netrwClassify = { link = "gruvAqua" },
    netrwLink = { link = "gruvGray" },
    netrwSymLink = { link = "gruvFg1" },
    netrwExe = { link = "gruvYellow" },
    netrwComment = { link = "gruvGray" },
    netrwList = { link = "gruvBlue" },
    netrwHelpCmd = { link = "gruvAqua" },
    netrwCmdSep = { link = "gruvFg3" },
    netrwVersion = { link = "gruvGreen" },
    -- nerdtree
    NERDTreeDir = { link = "gruvAqua" },
    NERDTreeDirSlash = { link = "gruvAqua" },
    NERDTreeOpenable = { link = "gruvOrange" },
    NERDTreeClosable = { link = "gruvOrange" },
    NERDTreeFile = { link = "gruvFg1" },
    NERDTreeExecFile = { link = "gruvYellow" },
    NERDTreeUp = { link = "gruvGray" },
    NERDTreeCWD = { link = "gruvGreen" },
    NERDTreeHelp = { link = "gruvFg1" },
    NERDTreeToggleOn = { link = "gruvGreen" },
    NERDTreeToggleOff = { link = "gruvRed" },
    -- coc.nvim
    CocErrorSign = { link = "gruvRedSign" },
    CocWarningSign = { link = "gruvOrangeSign" },
    CocInfoSign = { link = "gruvBlueSign" },
    CocHintSign = { link = "gruvAquaSign" },
    CocErrorFloat = { link = "gruvRed" },
    CocWarningFloat = { link = "gruvOrange" },
    CocInfoFloat = { link = "gruvBlue" },
    CocHintFloat = { link = "gruvAqua" },
    CocDiagnosticsError = { link = "gruvRed" },
    CocDiagnosticsWarning = { link = "gruvOrange" },
    CocDiagnosticsInfo = { link = "gruvBlue" },
    CocDiagnosticsHint = { link = "gruvAqua" },
    CocSelectedText = { link = "gruvRed" },
    CocMenuSel = { link = "PmenuSel" },
    CocCodeLens = { link = "gruvGray" },
    CocErrorHighlight = { link = "gruvRedUnderline" },
    CocWarningHighlight = { link = "gruvOrangeUnderline" },
    CocInfoHighlight = { link = "gruvBlueUnderline" },
    CocHintHighlight = { link = "gruvAquaUnderline" },
    -- telescope.nvim
    TelescopeNormal = { link = "gruvFg1" },
    TelescopeSelection = { link = "gruvOrangeBold" },
    TelescopeSelectionCaret = { link = "gruvRed" },
    TelescopeMultiSelection = { link = "gruvGray" },
    TelescopeBorder = { link = "TelescopeNormal" },
    TelescopePromptBorder = { link = "TelescopeNormal" },
    TelescopeResultsBorder = { link = "TelescopeNormal" },
    TelescopePreviewBorder = { link = "TelescopeNormal" },
    TelescopeMatching = { link = "gruvBlue" },
    TelescopePromptPrefix = { link = "gruvRed" },
    TelescopePrompt = { link = "TelescopeNormal" },
    -- nvim-cmp
    CmpItemAbbr = { link = "gruvFg0" },
    CmpItemAbbrDeprecated = { link = "gruvFg1" },
    CmpItemAbbrMatch = { link = "gruvBlueBold" },
    CmpItemAbbrMatchFuzzy = { link = "gruvBlueUnderline" },
    CmpItemMenu = { link = "gruvGray" },
    CmpItemKindText = { link = "gruvOrange" },
    CmpItemKindVariable = { link = "gruvOrange" },
    CmpItemKindMethod = { link = "gruvBlue" },
    CmpItemKindFunction = { link = "gruvBlue" },
    CmpItemKindConstructor = { link = "gruvYellow" },
    CmpItemKindUnit = { link = "gruvBlue" },
    CmpItemKindField = { link = "gruvBlue" },
    CmpItemKindClass = { link = "gruvYellow" },
    CmpItemKindInterface = { link = "gruvYellow" },
    CmpItemKindModule = { link = "gruvBlue" },
    CmpItemKindProperty = { link = "gruvBlue" },
    CmpItemKindValue = { link = "gruvOrange" },
    CmpItemKindEnum = { link = "gruvYellow" },
    CmpItemKindOperator = { link = "gruvYellow" },
    CmpItemKindKeyword = { link = "gruvPurple" },
    CmpItemKindEvent = { link = "gruvPurple" },
    CmpItemKindReference = { link = "gruvPurple" },
    CmpItemKindColor = { link = "gruvPurple" },
    CmpItemKindSnippet = { link = "gruvGreen" },
    CmpItemKindFile = { link = "gruvBlue" },
    CmpItemKindFolder = { link = "gruvBlue" },
    CmpItemKindEnumMember = { link = "gruvAqua" },
    CmpItemKindConstant = { link = "gruvOrange" },
    CmpItemKindStruct = { link = "gruvYellow" },
    CmpItemKindTypeParameter = { link = "gruvYellow" },
    diffAdded = { link = "gruvGreen" },
    diffRemoved = { link = "gruvRed" },
    diffChanged = { link = "gruvAqua" },
    diffFile = { link = "gruvOrange" },
    diffNewFile = { link = "gruvYellow" },
    diffOldFile = { link = "gruvOrange" },
    diffLine = { link = "gruvBlue" },
    diffIndexLine = { link = "diffChanged" },
    -- navic (highlight icons)
    NavicIconsFile = { link = "gruvBlue" },
    NavicIconsModule = { link = "gruvOrange" },
    NavicIconsNamespace = { link = "gruvBlue" },
    NavicIconsPackage = { link = "gruvAqua" },
    NavicIconsClass = { link = "gruvYellow" },
    NavicIconsMethod = { link = "gruvBlue" },
    NavicIconsProperty = { link = "gruvAqua" },
    NavicIconsField = { link = "gruvPurple" },
    NavicIconsConstructor = { link = "gruvBlue" },
    NavicIconsEnum = { link = "gruvPurple" },
    NavicIconsInterface = { link = "gruvGreen" },
    NavicIconsFunction = { link = "gruvBlue" },
    NavicIconsVariable = { link = "gruvPurple" },
    NavicIconsConstant = { link = "gruvOrange" },
    NavicIconsString = { link = "gruvGreen" },
    NavicIconsNumber = { link = "gruvOrange" },
    NavicIconsBoolean = { link = "gruvOrange" },
    NavicIconsArray = { link = "gruvOrange" },
    NavicIconsObject = { link = "gruvOrange" },
    NavicIconsKey = { link = "gruvAqua" },
    NavicIconsNull = { link = "gruvOrange" },
    NavicIconsEnumMember = { link = "gruvYellow" },
    NavicIconsStruct = { link = "gruvPurple" },
    NavicIconsEvent = { link = "gruvYellow" },
    NavicIconsOperator = { link = "gruvRed" },
    NavicIconsTypeParameter = { link = "gruvRed" },
    NavicText = { link = "gruvWhite" },
    NavicSeparator = { link = "gruvWhite" },
    -- html
    htmlTag = { link = "gruvAquaBold" },
    htmlEndTag = { link = "gruvAquaBold" },
    htmlTagName = { link = "gruvBlue" },
    htmlArg = { link = "gruvOrange" },
    htmlTagN = { link = "gruvFg1" },
    htmlSpecialTagName = { link = "gruvBlue" },
    htmlLink = { fg = colors.fg4, underline = config.underline },
    htmlSpecialChar = { link = "gruvRed" },
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
    xmlTag = { link = "gruvAquaBold" },
    xmlEndTag = { link = "gruvAquaBold" },
    xmlTagName = { link = "gruvBlue" },
    xmlEqual = { link = "gruvBlue" },
    docbkKeyword = { link = "gruvAquaBold" },
    xmlDocTypeDecl = { link = "gruvGray" },
    xmlDocTypeKeyword = { link = "gruvPurple" },
    xmlCdataStart = { link = "gruvGray" },
    xmlCdataCdata = { link = "gruvPurple" },
    dtdFunction = { link = "gruvGray" },
    dtdTagName = { link = "gruvPurple" },
    xmlAttrib = { link = "gruvOrange" },
    xmlProcessingDelim = { link = "gruvGray" },
    dtdParamEntityPunct = { link = "gruvGray" },
    dtdParamEntityDPunct = { link = "gruvGray" },
    xmlAttribPunct = { link = "gruvGray" },
    xmlEntity = { link = "gruvRed" },
    xmlEntityPunct = { link = "gruvRed" },
    -- clojure
    clojureKeyword = { link = "gruvBlue" },
    clojureCond = { link = "gruvOrange" },
    clojureSpecial = { link = "gruvOrange" },
    clojureDefine = { link = "gruvOrange" },
    clojureFunc = { link = "gruvYellow" },
    clojureRepeat = { link = "gruvYellow" },
    clojureCharacter = { link = "gruvAqua" },
    clojureStringEscape = { link = "gruvAqua" },
    clojureException = { link = "gruvRed" },
    clojureRegexp = { link = "gruvAqua" },
    clojureRegexpEscape = { link = "gruvAqua" },
    clojureRegexpCharClass = { fg = colors.fg3, bold = config.bold },
    clojureRegexpMod = { link = "clojureRegexpCharClass" },
    clojureRegexpQuantifier = { link = "clojureRegexpCharClass" },
    clojureParen = { link = "gruvFg3" },
    clojureAnonArg = { link = "gruvYellow" },
    clojureVariable = { link = "gruvBlue" },
    clojureMacro = { link = "gruvOrange" },
    clojureMeta = { link = "gruvYellow" },
    clojureDeref = { link = "gruvYellow" },
    clojureQuote = { link = "gruvYellow" },
    clojureUnquote = { link = "gruvYellow" },
    -- C
    cOperator = { link = "gruvPurple" },
    cppOperator = { link = "gruvPurple" },
    cStructure = { link = "gruvOrange" },
    -- python
    pythonBuiltin = { link = "gruvOrange" },
    pythonBuiltinObj = { link = "gruvOrange" },
    pythonBuiltinFunc = { link = "gruvOrange" },
    pythonFunction = { link = "gruvAqua" },
    pythonDecorator = { link = "gruvRed" },
    pythonInclude = { link = "gruvBlue" },
    pythonImport = { link = "gruvBlue" },
    pythonRun = { link = "gruvBlue" },
    pythonCoding = { link = "gruvBlue" },
    pythonOperator = { link = "gruvRed" },
    pythonException = { link = "gruvRed" },
    pythonExceptions = { link = "gruvPurple" },
    pythonBoolean = { link = "gruvPurple" },
    pythonDot = { link = "gruvFg3" },
    pythonConditional = { link = "gruvRed" },
    pythonRepeat = { link = "gruvRed" },
    pythonDottedName = { link = "gruvGreenBold" },
    -- CSS
    cssBraces = { link = "gruvBlue" },
    cssFunctionName = { link = "gruvYellow" },
    cssIdentifier = { link = "gruvOrange" },
    cssClassName = { link = "gruvGreen" },
    cssColor = { link = "gruvBlue" },
    cssSelectorOp = { link = "gruvBlue" },
    cssSelectorOp2 = { link = "gruvBlue" },
    cssImportant = { link = "gruvGreen" },
    cssVendor = { link = "gruvFg1" },
    cssTextProp = { link = "gruvAqua" },
    cssAnimationProp = { link = "gruvAqua" },
    cssUIProp = { link = "gruvYellow" },
    cssTransformProp = { link = "gruvAqua" },
    cssTransitionProp = { link = "gruvAqua" },
    cssPrintProp = { link = "gruvAqua" },
    cssPositioningProp = { link = "gruvYellow" },
    cssBoxProp = { link = "gruvAqua" },
    cssFontDescriptorProp = { link = "gruvAqua" },
    cssFlexibleBoxProp = { link = "gruvAqua" },
    cssBorderOutlineProp = { link = "gruvAqua" },
    cssBackgroundProp = { link = "gruvAqua" },
    cssMarginProp = { link = "gruvAqua" },
    cssListProp = { link = "gruvAqua" },
    cssTableProp = { link = "gruvAqua" },
    cssFontProp = { link = "gruvAqua" },
    cssPaddingProp = { link = "gruvAqua" },
    cssDimensionProp = { link = "gruvAqua" },
    cssRenderProp = { link = "gruvAqua" },
    cssColorProp = { link = "gruvAqua" },
    cssGeneratedContentProp = { link = "gruvAqua" },
    -- javascript
    javaScriptBraces = { link = "gruvFg1" },
    javaScriptFunction = { link = "gruvAqua" },
    javaScriptIdentifier = { link = "gruvRed" },
    javaScriptMember = { link = "gruvBlue" },
    javaScriptNumber = { link = "gruvPurple" },
    javaScriptNull = { link = "gruvPurple" },
    javaScriptParens = { link = "gruvFg3" },
    -- typescript
    typescriptReserved = { link = "gruvAqua" },
    typescriptLabel = { link = "gruvAqua" },
    typescriptFuncKeyword = { link = "gruvAqua" },
    typescriptIdentifier = { link = "gruvOrange" },
    typescriptBraces = { link = "gruvFg1" },
    typescriptEndColons = { link = "gruvFg1" },
    typescriptDOMObjects = { link = "gruvFg1" },
    typescriptAjaxMethods = { link = "gruvFg1" },
    typescriptLogicSymbols = { link = "gruvFg1" },
    typescriptDocSeeTag = { link = "Comment" },
    typescriptDocParam = { link = "Comment" },
    typescriptDocTags = { link = "vimCommentTitle" },
    typescriptGlobalObjects = { link = "gruvFg1" },
    typescriptParens = { link = "gruvFg3" },
    typescriptOpSymbols = { link = "gruvFg3" },
    typescriptHtmlElemProperties = { link = "gruvFg1" },
    typescriptNull = { link = "gruvPurple" },
    typescriptInterpolationDelimiter = { link = "gruvAqua" },
    -- purescript
    purescriptModuleKeyword = { link = "gruvAqua" },
    purescriptModuleName = { link = "gruvFg1" },
    purescriptWhere = { link = "gruvAqua" },
    purescriptDelimiter = { link = "gruvFg4" },
    purescriptType = { link = "gruvFg1" },
    purescriptImportKeyword = { link = "gruvAqua" },
    purescriptHidingKeyword = { link = "gruvAqua" },
    purescriptAsKeyword = { link = "gruvAqua" },
    purescriptStructure = { link = "gruvAqua" },
    purescriptOperator = { link = "gruvBlue" },
    purescriptTypeVar = { link = "gruvFg1" },
    purescriptConstructor = { link = "gruvFg1" },
    purescriptFunction = { link = "gruvFg1" },
    purescriptConditional = { link = "gruvOrange" },
    purescriptBacktick = { link = "gruvOrange" },
    -- coffescript
    coffeeExtendedOp = { link = "gruvFg3" },
    coffeeSpecialOp = { link = "gruvFg3" },
    coffeeCurly = { link = "gruvOrange" },
    coffeeParen = { link = "gruvFg3" },
    coffeeBracket = { link = "gruvOrange" },
    -- ruby
    rubyStringDelimiter = { link = "gruvGreen" },
    rubyInterpolationDelimiter = { link = "gruvAqua" },
    rubyDefinedOperator = { link = "rubyKeyword" },
    -- objc
    objcTypeModifier = { link = "gruvRed" },
    objcDirective = { link = "gruvBlue" },
    -- go
    goDirective = { link = "gruvAqua" },
    goConstants = { link = "gruvPurple" },
    goDeclaration = { link = "gruvRed" },
    goDeclType = { link = "gruvBlue" },
    goBuiltins = { link = "gruvOrange" },
    -- lua
    luaIn = { link = "gruvRed" },
    luaFunction = { link = "gruvAqua" },
    luaTable = { link = "gruvOrange" },
    -- moonscript
    moonSpecialOp = { link = "gruvFg3" },
    moonExtendedOp = { link = "gruvFg3" },
    moonFunction = { link = "gruvFg3" },
    moonObject = { link = "gruvYellow" },
    -- java
    javaAnnotation = { link = "gruvBlue" },
    javaDocTags = { link = "gruvAqua" },
    javaCommentTitle = { link = "vimCommentTitle" },
    javaParen = { link = "gruvFg3" },
    javaParen1 = { link = "gruvFg3" },
    javaParen2 = { link = "gruvFg3" },
    javaParen3 = { link = "gruvFg3" },
    javaParen4 = { link = "gruvFg3" },
    javaParen5 = { link = "gruvFg3" },
    javaOperator = { link = "gruvOrange" },
    javaVarArg = { link = "gruvGreen" },
    -- elixir
    elixirDocString = { link = "Comment" },
    elixirStringDelimiter = { link = "gruvGreen" },
    elixirInterpolationDelimiter = { link = "gruvAqua" },
    elixirModuleDeclaration = { link = "gruvYellow" },
    -- scala
    scalaNameDefinition = { link = "gruvFg1" },
    scalaCaseFollowing = { link = "gruvFg1" },
    scalaCapitalWord = { link = "gruvFg1" },
    scalaTypeExtension = { link = "gruvFg1" },
    scalaKeyword = { link = "gruvRed" },
    scalaKeywordModifier = { link = "gruvRed" },
    scalaSpecial = { link = "gruvAqua" },
    scalaOperator = { link = "gruvFg1" },
    scalaTypeDeclaration = { link = "gruvYellow" },
    scalaTypeTypePostDeclaration = { link = "gruvYellow" },
    scalaInstanceDeclaration = { link = "gruvFg1" },
    scalaInterpolation = { link = "gruvAqua" },
    -- markdown
    markdownItalic = { fg = colors.fg3, italic = true },
    markdownBold = { fg = colors.fg3, bold = config.bold },
    markdownBoldItalic = { fg = colors.fg3, bold = config.bold, italic = true },
    markdownH1 = { link = "gruvGreenBold" },
    markdownH2 = { link = "gruvGreenBold" },
    markdownH3 = { link = "gruvYellowBold" },
    markdownH4 = { link = "gruvYellowBold" },
    markdownH5 = { link = "gruvYellow" },
    markdownH6 = { link = "gruvYellow" },
    markdownCode = { link = "gruvAqua" },
    markdownCodeBlock = { link = "gruvAqua" },
    markdownCodeDelimiter = { link = "gruvAqua" },
    markdownBlockquote = { link = "gruvGray" },
    markdownListMarker = { link = "gruvGray" },
    markdownOrderedListMarker = { link = "gruvGray" },
    markdownRule = { link = "gruvGray" },
    markdownHeadingRule = { link = "gruvGray" },
    markdownUrlDelimiter = { link = "gruvFg3" },
    markdownLinkDelimiter = { link = "gruvFg3" },
    markdownLinkTextDelimiter = { link = "gruvFg3" },
    markdownHeadingDelimiter = { link = "gruvOrange" },
    markdownUrl = { link = "gruvPurple" },
    markdownUrlTitleDelimiter = { link = "gruvGreen" },
    markdownLinkText = { fg = colors.gray, underline = config.underline },
    markdownIdDeclaration = { link = "markdownLinkText" },
    -- haskell
    haskellType = { link = "gruvBlue" },
    haskellIdentifier = { link = "gruvAqua" },
    haskellSeparator = { link = "gruvFg4" },
    haskellDelimiter = { link = "gruvOrange" },
    haskellOperators = { link = "gruvPurple" },
    haskellBacktick = { link = "gruvOrange" },
    haskellStatement = { link = "gruvPurple" },
    haskellConditional = { link = "gruvPurple" },
    haskellLet = { link = "gruvRed" },
    haskellDefault = { link = "gruvRed" },
    haskellWhere = { link = "gruvRed" },
    haskellBottom = { link = "gruvRedBold" },
    haskellImportKeywords = { link = "gruvPurpleBold" },
    haskellDeclKeyword = { link = "gruvOrange" },
    haskellDecl = { link = "gruvOrange" },
    haskellDeriving = { link = "gruvPurple" },
    haskellAssocType = { link = "gruvAqua" },
    haskellNumber = { link = "gruvAqua" },
    haskellPragma = { link = "gruvRedBold" },
    haskellTH = { link = "gruvAquaBold" },
    haskellForeignKeywords = { link = "gruvGreen" },
    haskellKeyword = { link = "gruvRed" },
    haskellFloat = { link = "gruvAqua" },
    haskellInfix = { link = "gruvPurple" },
    haskellQuote = { link = "gruvGreenBold" },
    haskellShebang = { link = "gruvYellowBold" },
    haskellLiquid = { link = "gruvPurpleBold" },
    haskellQuasiQuoted = { link = "gruvBlueBold" },
    haskellRecursiveDo = { link = "gruvPurple" },
    haskellQuotedType = { link = "gruvRed" },
    haskellPreProc = { link = "gruvFg4" },
    haskellTypeRoles = { link = "gruvRedBold" },
    haskellTypeForall = { link = "gruvRed" },
    haskellPatternKeyword = { link = "gruvBlue" },
    -- json
    jsonKeyword = { link = "gruvGreen" },
    jsonQuote = { link = "gruvGreen" },
    jsonBraces = { link = "gruvFg1" },
    jsonString = { link = "gruvFg1" },
    -- mail
    mailQuoted1 = { link = "gruvAqua" },
    mailQuoted2 = { link = "gruvPurple" },
    mailQuoted3 = { link = "gruvYellow" },
    mailQuoted4 = { link = "gruvGreen" },
    mailQuoted5 = { link = "gruvRed" },
    mailQuoted6 = { link = "gruvOrange" },
    mailSignature = { link = "Comment" },
    -- c#
    csBraces = { link = "gruvFg1" },
    csEndColon = { link = "gruvFg1" },
    csLogicSymbols = { link = "gruvFg1" },
    csParens = { link = "gruvFg3" },
    csOpSymbols = { link = "gruvFg3" },
    csInterpolationDelimiter = { link = "gruvFg3" },
    csInterpolationAlignDel = { link = "gruvAquaBold" },
    csInterpolationFormat = { link = "gruvAqua" },
    csInterpolationFormatDel = { link = "gruvAquaBold" },
    -- rust btw
    rustSigil = { link = "gruvOrange" },
    rustEscape = { link = "gruvAqua" },
    rustStringContinuation = { link = "gruvAqua" },
    rustEnum = { link = "gruvAqua" },
    rustStructure = { link = "gruvAqua" },
    rustModPathSep = { link = "gruvFg2" },
    rustCommentLineDoc = { link = "Comment" },
    rustDefault = { link = "gruvAqua" },
    -- ocaml
    ocamlOperator = { link = "gruvFg1" },
    ocamlKeyChar = { link = "gruvOrange" },
    ocamlArrow = { link = "gruvOrange" },
    ocamlInfixOpKeyword = { link = "gruvRed" },
    ocamlConstructor = { link = "gruvOrange" },
    -- lspsaga.nvim
    LspSagaCodeActionTitle = { link = "Title" },
    LspSagaCodeActionBorder = { link = "gruvFg1" },
    LspSagaCodeActionContent = { fg = colors.green, bold = config.bold },
    LspSagaLspFinderBorder = { link = "gruvFg1" },
    LspSagaAutoPreview = { link = "gruvOrange" },
    TargetWord = { fg = colors.blue, bold = config.bold },
    FinderSeparator = { link = "gruvAqua" },
    LspSagaDefPreviewBorder = { link = "gruvBlue" },
    LspSagaHoverBorder = { link = "gruvOrange" },
    LspSagaRenameBorder = { link = "gruvBlue" },
    LspSagaDiagnosticSource = { link = "gruvOrange" },
    LspSagaDiagnosticBorder = { link = "gruvPurple" },
    LspSagaDiagnosticHeader = { link = "gruvGreen" },
    LspSagaSignatureHelpBorder = { link = "gruvGreen" },
    SagaShadow = { link = "gruvBg0" },
    -- dashboard-nvim
    DashboardShortCut = { link = "gruvOrange" },
    DashboardHeader = { link = "gruvAqua" },
    DashboardCenter = { link = "gruvYellow" },
    DashboardFooter = { fg = colors.purple, italic = true },
    -- mason
    MasonHighlight = { link = "gruvAqua" },
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
    CarbonFile = { link = "gruvFg1" },
    CarbonExe = { link = "gruvYellow" },
    CarbonSymlink = { link = "gruvAqua" },
    CarbonBrokenSymlink = { link = "gruvRed" },
    CarbonIndicator = { link = "gruvGray" },
    CarbonDanger = { link = "gruvRed" },
    CarbonPending = { link = "gruvYellow" },
    -- noice.nvim
    NoiceCursor = { link = "TermCursor" },
    -- notify.nvim
    NotifyDEBUGBorder = { link = "gruvBlue" },
    NotifyDEBUGIcon = { link = "gruvBlue" },
    NotifyDEBUGTitle = { link = "gruvBlue" },
    NotifyERRORBorder = { link = "gruvRed" },
    NotifyERRORIcon = { link = "gruvRed" },
    NotifyERRORTitle = { link = "gruvRed" },
    NotifyINFOBorder = { link = "gruvAqua" },
    NotifyINFOIcon = { link = "gruvAqua" },
    NotifyINFOTitle = { link = "gruvAqua" },
    NotifyTRACEBorder = { link = "gruvGreen" },
    NotifyTRACEIcon = { link = "gruvGreen" },
    NotifyTRACETitle = { link = "gruvGreen" },
    NotifyWARNBorder = { link = "gruvYellow" },
    NotifyWARNIcon = { link = "gruvYellow" },
    NotifyWARNTitle = { link = "gruvYellow" },
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
