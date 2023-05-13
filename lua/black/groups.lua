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
  local config = require("black").config
  local colors = require("black.palette").get_base_colors(vim.o.background, config.contrast)

  set_terminal_colors(colors)

  local groups = {
    -- Base groups
    blackFg0 = { fg = colors.fg0 },
    blackFg1 = { fg = colors.fg1 },
    blackFg2 = { fg = colors.fg2 },
    blackFg3 = { fg = colors.fg3 },
    blackFg4 = { fg = colors.fg4 },
    blackGray = { fg = colors.gray },
    blackBg0 = { fg = colors.bg0 },
    blackBg1 = { fg = colors.bg1 },
    blackBg2 = { fg = colors.bg2 },
    blackBg3 = { fg = colors.bg3 },
    blackBg4 = { fg = colors.bg4 },
    blackRed = { fg = colors.red },
    blackRedBold = { fg = colors.red, bold = config.bold },
    blackGreen = { fg = colors.green },
    blackGreenBold = { fg = colors.green, bold = config.bold },
    blackYellow = { fg = colors.yellow },
    blackYellowBold = { fg = colors.yellow, bold = config.bold },
    blackBlue = { fg = colors.blue },
    blackBlueBold = { fg = colors.blue, bold = config.bold },
    blackPurple = { fg = colors.purple },
    blackPurpleBold = { fg = colors.purple, bold = config.bold },
    blackAqua = { fg = colors.aqua },
    blackAquaBold = { fg = colors.aqua, bold = config.bold },
    blackOrange = { fg = colors.orange },
    blackOrangeBold = { fg = colors.orange, bold = config.bold },
    blackRedSign = config.transparent_mode and { fg = colors.red, reverse = config.invert_signs }
        or { fg = colors.red, bg = colors.bg1, reverse = config.invert_signs },
    blackGreenSign = config.transparent_mode and { fg = colors.green, reverse = config.invert_signs }
        or { fg = colors.green, bg = colors.bg1, reverse = config.invert_signs },
    blackYellowSign = config.transparent_mode and { fg = colors.yellow, reverse = config.invert_signs }
        or { fg = colors.yellow, bg = colors.bg1, reverse = config.invert_signs },
    blackBlueSign = config.transparent_mode and { fg = colors.blue, reverse = config.invert_signs }
        or { fg = colors.blue, bg = colors.bg1, reverse = config.invert_signs },
    blackPurpleSign = config.transparent_mode and { fg = colors.purple, reverse = config.invert_signs }
        or { fg = colors.purple, bg = colors.bg1, reverse = config.invert_signs },
    blackAquaSign = config.transparent_mode and { fg = colors.aqua, reverse = config.invert_signs }
        or { fg = colors.aqua, bg = colors.bg1, reverse = config.invert_signs },
    blackOrangeSign = config.transparent_mode and { fg = colors.orange, reverse = config.invert_signs }
        or { fg = colors.orange, bg = colors.bg1, reverse = config.invert_signs },
    blackRedUnderline = { undercurl = config.undercurl, sp = colors.red },
    blackGreenUnderline = { undercurl = config.undercurl, sp = colors.green },
    blackYellowUnderline = { undercurl = config.undercurl, sp = colors.yellow },
    blackBlueUnderline = { undercurl = config.undercurl, sp = colors.blue },
    blackPurpleUnderline = { undercurl = config.undercurl, sp = colors.purple },
    blackAquaUnderline = { undercurl = config.undercurl, sp = colors.aqua },
    blackOrangeUnderline = { undercurl = config.undercurl, sp = colors.orange },
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
    NonText = { link = "blackBg2" },
    SpecialKey = { link = "blackFg4" },
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
    Directory = { link = "blackBlueBold" },
    Title = { link = "blackGreenBold" },
    ErrorMsg = { fg = colors.bg0, bg = colors.red, bold = config.bold },
    MoreMsg = { link = "blackYellowBold" },
    ModeMsg = { link = "blackYellowBold" },
    Question = { link = "blackOrangeBold" },
    WarningMsg = { link = "blackRedBold" },
    LineNr = { fg = colors.bg4 },
    SignColumn = config.transparent_mode and { bg = nil } or { bg = colors.bg1 },
    Folded = { fg = colors.gray, bg = colors.bg1, italic = config.italic.folds },
    FoldColumn = config.transparent_mode and { fg = colors.gray, bg = nil } or { fg = colors.gray, bg = colors.bg1 },
    Cursor = { reverse = config.inverse },
    vCursor = { link = "Cursor" },
    iCursor = { link = "Cursor" },
    lCursor = { link = "Cursor" },
    Special = { link = "blackOrange" },
    Comment = { fg = colors.gray, italic = config.italic.comments },
    Todo = { fg = colors.fg0, bold = config.bold, italic = config.italic.comments },
    Done = { fg = colors.orange, bold = config.bold, italic = config.italic.comments },
    Error = { fg = colors.red, bold = config.bold, reverse = config.inverse },
    Statement = { link = "blackRed" },
    Conditional = { link = "blackRed" },
    Repeat = { link = "blackRed" },
    Label = { link = "blackRed" },
    Exception = { link = "blackRed" },
    Operator = { fg = colors.orange, italic = config.italic.operators },
    Keyword = { link = "blackRed" },
    Identifier = { link = "blackBlue" },
    Function = { link = "blackGreenBold" },
    PreProc = { link = "blackAqua" },
    Include = { link = "blackAqua" },
    Define = { link = "blackAqua" },
    Macro = { link = "blackAqua" },
    PreCondit = { link = "blackAqua" },
    Constant = { link = "blackPurple" },
    Character = { link = "blackPurple" },
    String = { fg = colors.green, italic = config.italic.strings },
    Boolean = { link = "blackPurple" },
    Number = { link = "blackPurple" },
    Float = { link = "blackPurple" },
    Type = { link = "blackYellow" },
    StorageClass = { link = "blackOrange" },
    Structure = { link = "blackAqua" },
    Typedef = { link = "blackYellow" },
    Pmenu = { fg = colors.fg1, bg = colors.bg2 },
    PmenuSel = { fg = colors.bg2, bg = colors.blue, bold = config.bold },
    PmenuSbar = { bg = colors.bg2 },
    PmenuThumb = { bg = colors.bg4 },
    DiffDelete = { fg = colors.red, bg = colors.bg0, reverse = config.inverse },
    DiffAdd = { fg = colors.green, bg = colors.bg0, reverse = config.inverse },
    DiffChange = { fg = colors.aqua, bg = colors.bg0, reverse = config.inverse },
    DiffText = { fg = colors.yellow, bg = colors.bg0, reverse = config.inverse },
    SpellCap = { link = "blackBlueUnderline" },
    SpellBad = { link = "blackRedUnderline" },
    SpellLocal = { link = "blackAquaUnderline" },
    SpellRare = { link = "blackPurpleUnderline" },
    Whitespace = { fg = colors.bg2 },
    -- LSP Diagnostic
    DiagnosticError = { link = "blackRed" },
    DiagnosticSignError = { link = "blackRedSign" },
    DiagnosticUnderlineError = { link = "blackRedUnderline" },
    DiagnosticWarn = { link = "blackYellow" },
    DiagnosticSignWarn = { link = "blackYellowSign" },
    DiagnosticUnderlineWarn = { link = "blackYellowUnderline" },
    DiagnosticInfo = { link = "blackBlue" },
    DiagnosticSignInfo = { link = "blackBlueSign" },
    DiagnosticUnderlineInfo = { link = "blackBlueUnderline" },
    DiagnosticHint = { link = "blackAqua" },
    DiagnosticSignHint = { link = "blackAquaSign" },
    DiagnosticUnderlineHint = { link = "blackAquaUnderline" },
    DiagnosticFloatingError = { link = "blackRed" },
    DiagnosticFloatingWarn = { link = "blackOrange" },
    DiagnosticFloatingInfo = { link = "blackBlue" },
    DiagnosticFloatingHint = { link = "blackAqua" },
    DiagnosticVirtualTextError = { link = "blackRed" },
    DiagnosticVirtualTextWarn = { link = "blackYellow" },
    DiagnosticVirtualTextInfo = { link = "blackBlue" },
    DiagnosticVirtualTextHint = { link = "blackAqua" },
    LspReferenceRead = { link = "blackYellowBold" },
    LspReferenceText = { link = "blackYellowBold" },
    LspReferenceWrite = { link = "blackOrangeBold" },
    LspCodeLens = { link = "blackGray" },
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
    ["@keyword.operator"] = { link = "blackRed" },
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
    ["@variable"] = { link = "blackFg1" },
    -- @variable.builtin ; built-in variable names (e.g. `this`)
    ["@variable.builtin"] = { link = "Special" },
    -- @constant         ; constant identifiers
    ["@constant"] = { link = "Constant" },
    -- @constant.builtin ; built-in constant values
    ["@constant.builtin"] = { link = "Special" },
    -- @constant.macro   ; constants defined by the preprocessor
    ["@constant.macro"] = { link = "Define" },
    -- @namespace        ; modules or namespaces
    ["@namespace"] = { link = "blackFg1" },
    -- @symbol           ; symbols or atoms
    ["@symbol"] = { link = "Identifier" },
    --
    -- Text
    --
    -- @text                  ; non-structured text
    ["@text"] = { link = "blackFg1" },
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
    gitcommitSelectedFile = { link = "blackGreen" },
    gitcommitDiscardedFile = { link = "blackRed" },
    -- gitsigns.nvim
    GitSignsAdd = { link = "blackGreenSign" },
    GitSignsChange = { link = "blackAquaSign" },
    GitSignsDelete = { link = "blackRedSign" },
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
    debugBreakpoint = { link = "blackRedSign" },
    -- vim-startify
    StartifyBracket = { link = "blackFg3" },
    StartifyFile = { link = "blackFg1" },
    StartifyNumber = { link = "blackBlue" },
    StartifyPath = { link = "blackGray" },
    StartifySlash = { link = "blackGray" },
    StartifySection = { link = "blackYellow" },
    StartifySpecial = { link = "blackBg2" },
    StartifyHeader = { link = "blackOrange" },
    StartifyFooter = { link = "blackBg2" },
    StartifyVar = { link = "StartifyPath" },
    StartifySelect = { link = "Title" },
    -- vim-dirvish
    DirvishPathTail = { link = "blackAqua" },
    DirvishArg = { link = "blackYellow" },
    -- netrw
    netrwDir = { link = "blackAqua" },
    netrwClassify = { link = "blackAqua" },
    netrwLink = { link = "blackGray" },
    netrwSymLink = { link = "blackFg1" },
    netrwExe = { link = "blackYellow" },
    netrwComment = { link = "blackGray" },
    netrwList = { link = "blackBlue" },
    netrwHelpCmd = { link = "blackAqua" },
    netrwCmdSep = { link = "blackFg3" },
    netrwVersion = { link = "blackGreen" },
    -- nerdtree
    NERDTreeDir = { link = "blackAqua" },
    NERDTreeDirSlash = { link = "blackAqua" },
    NERDTreeOpenable = { link = "blackOrange" },
    NERDTreeClosable = { link = "blackOrange" },
    NERDTreeFile = { link = "blackFg1" },
    NERDTreeExecFile = { link = "blackYellow" },
    NERDTreeUp = { link = "blackGray" },
    NERDTreeCWD = { link = "blackGreen" },
    NERDTreeHelp = { link = "blackFg1" },
    NERDTreeToggleOn = { link = "blackGreen" },
    NERDTreeToggleOff = { link = "blackRed" },
    -- coc.nvim
    CocErrorSign = { link = "blackRedSign" },
    CocWarningSign = { link = "blackOrangeSign" },
    CocInfoSign = { link = "blackBlueSign" },
    CocHintSign = { link = "blackAquaSign" },
    CocErrorFloat = { link = "blackRed" },
    CocWarningFloat = { link = "blackOrange" },
    CocInfoFloat = { link = "blackBlue" },
    CocHintFloat = { link = "blackAqua" },
    CocDiagnosticsError = { link = "blackRed" },
    CocDiagnosticsWarning = { link = "blackOrange" },
    CocDiagnosticsInfo = { link = "blackBlue" },
    CocDiagnosticsHint = { link = "blackAqua" },
    CocSelectedText = { link = "blackRed" },
    CocMenuSel = { link = "PmenuSel" },
    CocCodeLens = { link = "blackGray" },
    CocErrorHighlight = { link = "blackRedUnderline" },
    CocWarningHighlight = { link = "blackOrangeUnderline" },
    CocInfoHighlight = { link = "blackBlueUnderline" },
    CocHintHighlight = { link = "blackAquaUnderline" },
    -- telescope.nvim
    TelescopeNormal = { link = "blackFg1" },
    TelescopeSelection = { link = "blackOrangeBold" },
    TelescopeSelectionCaret = { link = "blackRed" },
    TelescopeMultiSelection = { link = "blackGray" },
    TelescopeBorder = { link = "TelescopeNormal" },
    TelescopePromptBorder = { link = "TelescopeNormal" },
    TelescopeResultsBorder = { link = "TelescopeNormal" },
    TelescopePreviewBorder = { link = "TelescopeNormal" },
    TelescopeMatching = { link = "blackBlue" },
    TelescopePromptPrefix = { link = "blackRed" },
    TelescopePrompt = { link = "TelescopeNormal" },
    -- nvim-cmp
    CmpItemAbbr = { link = "blackFg0" },
    CmpItemAbbrDeprecated = { link = "blackFg1" },
    CmpItemAbbrMatch = { link = "blackBlueBold" },
    CmpItemAbbrMatchFuzzy = { link = "blackBlueUnderline" },
    CmpItemMenu = { link = "blackGray" },
    CmpItemKindText = { link = "blackOrange" },
    CmpItemKindVariable = { link = "blackOrange" },
    CmpItemKindMethod = { link = "blackBlue" },
    CmpItemKindFunction = { link = "blackBlue" },
    CmpItemKindConstructor = { link = "blackYellow" },
    CmpItemKindUnit = { link = "blackBlue" },
    CmpItemKindField = { link = "blackBlue" },
    CmpItemKindClass = { link = "blackYellow" },
    CmpItemKindInterface = { link = "blackYellow" },
    CmpItemKindModule = { link = "blackBlue" },
    CmpItemKindProperty = { link = "blackBlue" },
    CmpItemKindValue = { link = "blackOrange" },
    CmpItemKindEnum = { link = "blackYellow" },
    CmpItemKindOperator = { link = "blackYellow" },
    CmpItemKindKeyword = { link = "blackPurple" },
    CmpItemKindEvent = { link = "blackPurple" },
    CmpItemKindReference = { link = "blackPurple" },
    CmpItemKindColor = { link = "blackPurple" },
    CmpItemKindSnippet = { link = "blackGreen" },
    CmpItemKindFile = { link = "blackBlue" },
    CmpItemKindFolder = { link = "blackBlue" },
    CmpItemKindEnumMember = { link = "blackAqua" },
    CmpItemKindConstant = { link = "blackOrange" },
    CmpItemKindStruct = { link = "blackYellow" },
    CmpItemKindTypeParameter = { link = "blackYellow" },
    diffAdded = { link = "blackGreen" },
    diffRemoved = { link = "blackRed" },
    diffChanged = { link = "blackAqua" },
    diffFile = { link = "blackOrange" },
    diffNewFile = { link = "blackYellow" },
    diffOldFile = { link = "blackOrange" },
    diffLine = { link = "blackBlue" },
    diffIndexLine = { link = "diffChanged" },
    -- navic (highlight icons)
    NavicIconsFile = { link = "blackBlue" },
    NavicIconsModule = { link = "blackOrange" },
    NavicIconsNamespace = { link = "blackBlue" },
    NavicIconsPackage = { link = "blackAqua" },
    NavicIconsClass = { link = "blackYellow" },
    NavicIconsMethod = { link = "blackBlue" },
    NavicIconsProperty = { link = "blackAqua" },
    NavicIconsField = { link = "blackPurple" },
    NavicIconsConstructor = { link = "blackBlue" },
    NavicIconsEnum = { link = "blackPurple" },
    NavicIconsInterface = { link = "blackGreen" },
    NavicIconsFunction = { link = "blackBlue" },
    NavicIconsVariable = { link = "blackPurple" },
    NavicIconsConstant = { link = "blackOrange" },
    NavicIconsString = { link = "blackGreen" },
    NavicIconsNumber = { link = "blackOrange" },
    NavicIconsBoolean = { link = "blackOrange" },
    NavicIconsArray = { link = "blackOrange" },
    NavicIconsObject = { link = "blackOrange" },
    NavicIconsKey = { link = "blackAqua" },
    NavicIconsNull = { link = "blackOrange" },
    NavicIconsEnumMember = { link = "blackYellow" },
    NavicIconsStruct = { link = "blackPurple" },
    NavicIconsEvent = { link = "blackYellow" },
    NavicIconsOperator = { link = "blackRed" },
    NavicIconsTypeParameter = { link = "blackRed" },
    NavicText = { link = "blackWhite" },
    NavicSeparator = { link = "blackWhite" },
    -- html
    htmlTag = { link = "blackAquaBold" },
    htmlEndTag = { link = "blackAquaBold" },
    htmlTagName = { link = "blackBlue" },
    htmlArg = { link = "blackOrange" },
    htmlTagN = { link = "blackFg1" },
    htmlSpecialTagName = { link = "blackBlue" },
    htmlLink = { fg = colors.fg4, underline = config.underline },
    htmlSpecialChar = { link = "blackRed" },
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
    xmlTag = { link = "blackAquaBold" },
    xmlEndTag = { link = "blackAquaBold" },
    xmlTagName = { link = "blackBlue" },
    xmlEqual = { link = "blackBlue" },
    docbkKeyword = { link = "blackAquaBold" },
    xmlDocTypeDecl = { link = "blackGray" },
    xmlDocTypeKeyword = { link = "blackPurple" },
    xmlCdataStart = { link = "blackGray" },
    xmlCdataCdata = { link = "blackPurple" },
    dtdFunction = { link = "blackGray" },
    dtdTagName = { link = "blackPurple" },
    xmlAttrib = { link = "blackOrange" },
    xmlProcessingDelim = { link = "blackGray" },
    dtdParamEntityPunct = { link = "blackGray" },
    dtdParamEntityDPunct = { link = "blackGray" },
    xmlAttribPunct = { link = "blackGray" },
    xmlEntity = { link = "blackRed" },
    xmlEntityPunct = { link = "blackRed" },
    -- clojure
    clojureKeyword = { link = "blackBlue" },
    clojureCond = { link = "blackOrange" },
    clojureSpecial = { link = "blackOrange" },
    clojureDefine = { link = "blackOrange" },
    clojureFunc = { link = "blackYellow" },
    clojureRepeat = { link = "blackYellow" },
    clojureCharacter = { link = "blackAqua" },
    clojureStringEscape = { link = "blackAqua" },
    clojureException = { link = "blackRed" },
    clojureRegexp = { link = "blackAqua" },
    clojureRegexpEscape = { link = "blackAqua" },
    clojureRegexpCharClass = { fg = colors.fg3, bold = config.bold },
    clojureRegexpMod = { link = "clojureRegexpCharClass" },
    clojureRegexpQuantifier = { link = "clojureRegexpCharClass" },
    clojureParen = { link = "blackFg3" },
    clojureAnonArg = { link = "blackYellow" },
    clojureVariable = { link = "blackBlue" },
    clojureMacro = { link = "blackOrange" },
    clojureMeta = { link = "blackYellow" },
    clojureDeref = { link = "blackYellow" },
    clojureQuote = { link = "blackYellow" },
    clojureUnquote = { link = "blackYellow" },
    -- C
    cOperator = { link = "blackPurple" },
    cppOperator = { link = "blackPurple" },
    cStructure = { link = "blackOrange" },
    -- python
    pythonBuiltin = { link = "blackOrange" },
    pythonBuiltinObj = { link = "blackOrange" },
    pythonBuiltinFunc = { link = "blackOrange" },
    pythonFunction = { link = "blackAqua" },
    pythonDecorator = { link = "blackRed" },
    pythonInclude = { link = "blackBlue" },
    pythonImport = { link = "blackBlue" },
    pythonRun = { link = "blackBlue" },
    pythonCoding = { link = "blackBlue" },
    pythonOperator = { link = "blackRed" },
    pythonException = { link = "blackRed" },
    pythonExceptions = { link = "blackPurple" },
    pythonBoolean = { link = "blackPurple" },
    pythonDot = { link = "blackFg3" },
    pythonConditional = { link = "blackRed" },
    pythonRepeat = { link = "blackRed" },
    pythonDottedName = { link = "blackGreenBold" },
    -- CSS
    cssBraces = { link = "blackBlue" },
    cssFunctionName = { link = "blackYellow" },
    cssIdentifier = { link = "blackOrange" },
    cssClassName = { link = "blackGreen" },
    cssColor = { link = "blackBlue" },
    cssSelectorOp = { link = "blackBlue" },
    cssSelectorOp2 = { link = "blackBlue" },
    cssImportant = { link = "blackGreen" },
    cssVendor = { link = "blackFg1" },
    cssTextProp = { link = "blackAqua" },
    cssAnimationProp = { link = "blackAqua" },
    cssUIProp = { link = "blackYellow" },
    cssTransformProp = { link = "blackAqua" },
    cssTransitionProp = { link = "blackAqua" },
    cssPrintProp = { link = "blackAqua" },
    cssPositioningProp = { link = "blackYellow" },
    cssBoxProp = { link = "blackAqua" },
    cssFontDescriptorProp = { link = "blackAqua" },
    cssFlexibleBoxProp = { link = "blackAqua" },
    cssBorderOutlineProp = { link = "blackAqua" },
    cssBackgroundProp = { link = "blackAqua" },
    cssMarginProp = { link = "blackAqua" },
    cssListProp = { link = "blackAqua" },
    cssTableProp = { link = "blackAqua" },
    cssFontProp = { link = "blackAqua" },
    cssPaddingProp = { link = "blackAqua" },
    cssDimensionProp = { link = "blackAqua" },
    cssRenderProp = { link = "blackAqua" },
    cssColorProp = { link = "blackAqua" },
    cssGeneratedContentProp = { link = "blackAqua" },
    -- javascript
    javaScriptBraces = { link = "blackFg1" },
    javaScriptFunction = { link = "blackAqua" },
    javaScriptIdentifier = { link = "blackRed" },
    javaScriptMember = { link = "blackBlue" },
    javaScriptNumber = { link = "blackPurple" },
    javaScriptNull = { link = "blackPurple" },
    javaScriptParens = { link = "blackFg3" },
    -- typescript
    typescriptReserved = { link = "blackAqua" },
    typescriptLabel = { link = "blackAqua" },
    typescriptFuncKeyword = { link = "blackAqua" },
    typescriptIdentifier = { link = "blackOrange" },
    typescriptBraces = { link = "blackFg1" },
    typescriptEndColons = { link = "blackFg1" },
    typescriptDOMObjects = { link = "blackFg1" },
    typescriptAjaxMethods = { link = "blackFg1" },
    typescriptLogicSymbols = { link = "blackFg1" },
    typescriptDocSeeTag = { link = "Comment" },
    typescriptDocParam = { link = "Comment" },
    typescriptDocTags = { link = "vimCommentTitle" },
    typescriptGlobalObjects = { link = "blackFg1" },
    typescriptParens = { link = "blackFg3" },
    typescriptOpSymbols = { link = "blackFg3" },
    typescriptHtmlElemProperties = { link = "blackFg1" },
    typescriptNull = { link = "blackPurple" },
    typescriptInterpolationDelimiter = { link = "blackAqua" },
    -- purescript
    purescriptModuleKeyword = { link = "blackAqua" },
    purescriptModuleName = { link = "blackFg1" },
    purescriptWhere = { link = "blackAqua" },
    purescriptDelimiter = { link = "blackFg4" },
    purescriptType = { link = "blackFg1" },
    purescriptImportKeyword = { link = "blackAqua" },
    purescriptHidingKeyword = { link = "blackAqua" },
    purescriptAsKeyword = { link = "blackAqua" },
    purescriptStructure = { link = "blackAqua" },
    purescriptOperator = { link = "blackBlue" },
    purescriptTypeVar = { link = "blackFg1" },
    purescriptConstructor = { link = "blackFg1" },
    purescriptFunction = { link = "blackFg1" },
    purescriptConditional = { link = "blackOrange" },
    purescriptBacktick = { link = "blackOrange" },
    -- coffescript
    coffeeExtendedOp = { link = "blackFg3" },
    coffeeSpecialOp = { link = "blackFg3" },
    coffeeCurly = { link = "blackOrange" },
    coffeeParen = { link = "blackFg3" },
    coffeeBracket = { link = "blackOrange" },
    -- ruby
    rubyStringDelimiter = { link = "blackGreen" },
    rubyInterpolationDelimiter = { link = "blackAqua" },
    rubyDefinedOperator = { link = "rubyKeyword" },
    -- objc
    objcTypeModifier = { link = "blackRed" },
    objcDirective = { link = "blackBlue" },
    -- go
    goDirective = { link = "blackAqua" },
    goConstants = { link = "blackPurple" },
    goDeclaration = { link = "blackRed" },
    goDeclType = { link = "blackBlue" },
    goBuiltins = { link = "blackOrange" },
    -- lua
    luaIn = { link = "blackRed" },
    luaFunction = { link = "blackAqua" },
    luaTable = { link = "blackOrange" },
    -- moonscript
    moonSpecialOp = { link = "blackFg3" },
    moonExtendedOp = { link = "blackFg3" },
    moonFunction = { link = "blackFg3" },
    moonObject = { link = "blackYellow" },
    -- java
    javaAnnotation = { link = "blackBlue" },
    javaDocTags = { link = "blackAqua" },
    javaCommentTitle = { link = "vimCommentTitle" },
    javaParen = { link = "blackFg3" },
    javaParen1 = { link = "blackFg3" },
    javaParen2 = { link = "blackFg3" },
    javaParen3 = { link = "blackFg3" },
    javaParen4 = { link = "blackFg3" },
    javaParen5 = { link = "blackFg3" },
    javaOperator = { link = "blackOrange" },
    javaVarArg = { link = "blackGreen" },
    -- elixir
    elixirDocString = { link = "Comment" },
    elixirStringDelimiter = { link = "blackGreen" },
    elixirInterpolationDelimiter = { link = "blackAqua" },
    elixirModuleDeclaration = { link = "blackYellow" },
    -- scala
    scalaNameDefinition = { link = "blackFg1" },
    scalaCaseFollowing = { link = "blackFg1" },
    scalaCapitalWord = { link = "blackFg1" },
    scalaTypeExtension = { link = "blackFg1" },
    scalaKeyword = { link = "blackRed" },
    scalaKeywordModifier = { link = "blackRed" },
    scalaSpecial = { link = "blackAqua" },
    scalaOperator = { link = "blackFg1" },
    scalaTypeDeclaration = { link = "blackYellow" },
    scalaTypeTypePostDeclaration = { link = "blackYellow" },
    scalaInstanceDeclaration = { link = "blackFg1" },
    scalaInterpolation = { link = "blackAqua" },
    -- markdown
    markdownItalic = { fg = colors.fg3, italic = true },
    markdownBold = { fg = colors.fg3, bold = config.bold },
    markdownBoldItalic = { fg = colors.fg3, bold = config.bold, italic = true },
    markdownH1 = { link = "blackGreenBold" },
    markdownH2 = { link = "blackGreenBold" },
    markdownH3 = { link = "blackYellowBold" },
    markdownH4 = { link = "blackYellowBold" },
    markdownH5 = { link = "blackYellow" },
    markdownH6 = { link = "blackYellow" },
    markdownCode = { link = "blackAqua" },
    markdownCodeBlock = { link = "blackAqua" },
    markdownCodeDelimiter = { link = "blackAqua" },
    markdownBlockquote = { link = "blackGray" },
    markdownListMarker = { link = "blackGray" },
    markdownOrderedListMarker = { link = "blackGray" },
    markdownRule = { link = "blackGray" },
    markdownHeadingRule = { link = "blackGray" },
    markdownUrlDelimiter = { link = "blackFg3" },
    markdownLinkDelimiter = { link = "blackFg3" },
    markdownLinkTextDelimiter = { link = "blackFg3" },
    markdownHeadingDelimiter = { link = "blackOrange" },
    markdownUrl = { link = "blackPurple" },
    markdownUrlTitleDelimiter = { link = "blackGreen" },
    markdownLinkText = { fg = colors.gray, underline = config.underline },
    markdownIdDeclaration = { link = "markdownLinkText" },
    -- haskell
    haskellType = { link = "blackBlue" },
    haskellIdentifier = { link = "blackAqua" },
    haskellSeparator = { link = "blackFg4" },
    haskellDelimiter = { link = "blackOrange" },
    haskellOperators = { link = "blackPurple" },
    haskellBacktick = { link = "blackOrange" },
    haskellStatement = { link = "blackPurple" },
    haskellConditional = { link = "blackPurple" },
    haskellLet = { link = "blackRed" },
    haskellDefault = { link = "blackRed" },
    haskellWhere = { link = "blackRed" },
    haskellBottom = { link = "blackRedBold" },
    haskellImportKeywords = { link = "blackPurpleBold" },
    haskellDeclKeyword = { link = "blackOrange" },
    haskellDecl = { link = "blackOrange" },
    haskellDeriving = { link = "blackPurple" },
    haskellAssocType = { link = "blackAqua" },
    haskellNumber = { link = "blackAqua" },
    haskellPragma = { link = "blackRedBold" },
    haskellTH = { link = "blackAquaBold" },
    haskellForeignKeywords = { link = "blackGreen" },
    haskellKeyword = { link = "blackRed" },
    haskellFloat = { link = "blackAqua" },
    haskellInfix = { link = "blackPurple" },
    haskellQuote = { link = "blackGreenBold" },
    haskellShebang = { link = "blackYellowBold" },
    haskellLiquid = { link = "blackPurpleBold" },
    haskellQuasiQuoted = { link = "blackBlueBold" },
    haskellRecursiveDo = { link = "blackPurple" },
    haskellQuotedType = { link = "blackRed" },
    haskellPreProc = { link = "blackFg4" },
    haskellTypeRoles = { link = "blackRedBold" },
    haskellTypeForall = { link = "blackRed" },
    haskellPatternKeyword = { link = "blackBlue" },
    -- json
    jsonKeyword = { link = "blackGreen" },
    jsonQuote = { link = "blackGreen" },
    jsonBraces = { link = "blackFg1" },
    jsonString = { link = "blackFg1" },
    -- mail
    mailQuoted1 = { link = "blackAqua" },
    mailQuoted2 = { link = "blackPurple" },
    mailQuoted3 = { link = "blackYellow" },
    mailQuoted4 = { link = "blackGreen" },
    mailQuoted5 = { link = "blackRed" },
    mailQuoted6 = { link = "blackOrange" },
    mailSignature = { link = "Comment" },
    -- c#
    csBraces = { link = "blackFg1" },
    csEndColon = { link = "blackFg1" },
    csLogicSymbols = { link = "blackFg1" },
    csParens = { link = "blackFg3" },
    csOpSymbols = { link = "blackFg3" },
    csInterpolationDelimiter = { link = "blackFg3" },
    csInterpolationAlignDel = { link = "blackAquaBold" },
    csInterpolationFormat = { link = "blackAqua" },
    csInterpolationFormatDel = { link = "blackAquaBold" },
    -- rust btw
    rustSigil = { link = "blackOrange" },
    rustEscape = { link = "blackAqua" },
    rustStringContinuation = { link = "blackAqua" },
    rustEnum = { link = "blackAqua" },
    rustStructure = { link = "blackAqua" },
    rustModPathSep = { link = "blackFg2" },
    rustCommentLineDoc = { link = "Comment" },
    rustDefault = { link = "blackAqua" },
    -- ocaml
    ocamlOperator = { link = "blackFg1" },
    ocamlKeyChar = { link = "blackOrange" },
    ocamlArrow = { link = "blackOrange" },
    ocamlInfixOpKeyword = { link = "blackRed" },
    ocamlConstructor = { link = "blackOrange" },
    -- lspsaga.nvim
    LspSagaCodeActionTitle = { link = "Title" },
    LspSagaCodeActionBorder = { link = "blackFg1" },
    LspSagaCodeActionContent = { fg = colors.green, bold = config.bold },
    LspSagaLspFinderBorder = { link = "blackFg1" },
    LspSagaAutoPreview = { link = "blackOrange" },
    TargetWord = { fg = colors.blue, bold = config.bold },
    FinderSeparator = { link = "blackAqua" },
    LspSagaDefPreviewBorder = { link = "blackBlue" },
    LspSagaHoverBorder = { link = "blackOrange" },
    LspSagaRenameBorder = { link = "blackBlue" },
    LspSagaDiagnosticSource = { link = "blackOrange" },
    LspSagaDiagnosticBorder = { link = "blackPurple" },
    LspSagaDiagnosticHeader = { link = "blackGreen" },
    LspSagaSignatureHelpBorder = { link = "blackGreen" },
    SagaShadow = { link = "blackBg0" },
    -- dashboard-nvim
    DashboardShortCut = { link = "blackOrange" },
    DashboardHeader = { link = "blackAqua" },
    DashboardCenter = { link = "blackYellow" },
    DashboardFooter = { fg = colors.purple, italic = true },
    -- mason
    MasonHighlight = { link = "blackAqua" },
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
    CarbonFile = { link = "blackFg1" },
    CarbonExe = { link = "blackYellow" },
    CarbonSymlink = { link = "blackAqua" },
    CarbonBrokenSymlink = { link = "blackRed" },
    CarbonIndicator = { link = "blackGray" },
    CarbonDanger = { link = "blackRed" },
    CarbonPending = { link = "blackYellow" },
    -- noice.nvim
    NoiceCursor = { link = "TermCursor" },
    -- notify.nvim
    NotifyDEBUGBorder = { link = "blackBlue" },
    NotifyDEBUGIcon = { link = "blackBlue" },
    NotifyDEBUGTitle = { link = "blackBlue" },
    NotifyERRORBorder = { link = "blackRed" },
    NotifyERRORIcon = { link = "blackRed" },
    NotifyERRORTitle = { link = "blackRed" },
    NotifyINFOBorder = { link = "blackAqua" },
    NotifyINFOIcon = { link = "blackAqua" },
    NotifyINFOTitle = { link = "blackAqua" },
    NotifyTRACEBorder = { link = "blackGreen" },
    NotifyTRACEIcon = { link = "blackGreen" },
    NotifyTRACETitle = { link = "blackGreen" },
    NotifyWARNBorder = { link = "blackYellow" },
    NotifyWARNIcon = { link = "blackYellow" },
    NotifyWARNTitle = { link = "blackYellow" },
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
