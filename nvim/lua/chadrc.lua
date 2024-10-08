---@type ChadrcConfig

local M = {}

local modes = {
  ["no"] = { "NORMAL (no)", "Normal" },
  ["nov"] = { "NORMAL (nov)", "Normal" },
  ["noV"] = { "NORMAL (noV)", "Normal" },
  ["noCTRL-V"] = { "NORMAL", "Normal" },
  ["niI"] = { "NORMAL i", "Normal" },
  ["niR"] = { "NORMAL r", "Normal" },
  ["niV"] = { "NORMAL v", "Normal" },
  ["ntT"] = { "NTERMINAL (ntT)", "NTerminal" },

  ["vs"] = { "V-CHAR (Ctrl O)", "Visual" },
  ["Vs"] = { "V-LINE", "Visual" },

  ["ic"] = { "INSERT (completion)", "Insert" },
  ["ix"] = { "INSERT completion", "Insert" },

  ["n"]  = {  "(ᴗ_ ᴗ。)",  "Normal"    }, -- normal
  ["nt"] = {  "(ᴗ_ ᴗ。)",  "NTerminal" }, -- normal in terminal
  ["c"]  = {  "(ó﹏ò｡ )",  "Command"   },
  ["s"] =  {  "(• ᴖ •｡)", "Select" },
  ["R"]  = {  "( ,Ծ‸Ծ,)",  "Replace"   },
  [""] = {  "( ·•᷄ࡇ •᷅)",  "Visual"    }, -- v-block
  ["v"]  = {  "(•̀ - •́ )",  "Visual"    }, -- visual
  ["V"]  = {  "(⊙ _ ⊙ )",  "Visual"    }, -- v-line
  ["i"]  = {  "( •̯́ ₃ •̯̀)",  "Insert"    }, -- insert
  ["t"]  = {  "( ⌐■_■ )",  "Terminal"  },

  ["Rc"] = { "REPLACE (Rc)", "Replace" },
  ["Rx"] = { "REPLACEa (Rx)", "Replace" },
  ["Rv"] = { "V-REPLACE", "Replace" },
  ["Rvc"] = { "V-REPLACE (Rvc)", "Replace" },
  ["Rvx"] = { "V-REPLACE (Rvx)", "Replace" },

  ["S"] = { "S-LINE", "Select" },
  [""] = { "S-BLOCK", "Select" },
  ["cv"] = { "COMMAND", "Command" },
  ["ce"] = { "COMMAND", "Command" },
  ["cr"] = { "COMMAND", "Command" },
  ["r"] = { "PROMPT", "Confirm" },
  ["rm"] = { "MORE", "Confirm" },
  ["r?"] = { "CONFIRM", "Confirm" },
  ["x"] = { "CONFIRM", "Confirm" },
  ["!"] = { "SHELL", "Terminal" },
}

M.ui = {
  theme = "chocolate",
  statusline = {
    theme = "minimal",
    separator_style = "round",
    modules = {
      mode = function()
        local m = vim.api.nvim_get_mode().mode
        return " %#St_"
          .. modes[m][2]
          .. "ModeSep#"
          .. ""
          .. "%#St_"
          .. modes[m][2]
          .. "Mode#"
          .. "󰇥  "
          .. modes[m][1]
          .. " %#St_"
          .. modes[m][2]
          .. "ModeSep#"
          .. "  "
      end,
    },
  },

  nvdash = {
    load_on_startup = true,
    header = {
      "⢀⣠⣤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⠖⠛⢶",
      "⣾⠀⠀⣹⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣸⣤⣀⡼",
      "⠘⠓⢶⡿⢷⣦⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⣴⡾⠛⠉⣿⠁⠀",
      "⠀⠀⢸⣧⠀⠈⠙⠻⠷⣦⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣤⡾⠟⠋⠀⠀⠀⢰⡟⠀⠀",
      "⠀⠀⠈⣿⠀⠀⠀⠀⠀⠀⠉⠛⠷⣦⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣤⡶⠟⠋⠁⠀⠀⠀⠀⠀⠀⢸⡇⠀⠀",
      "⠀⠀⠀⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠛⠷⣦⡄⠀⣀⣀⣀⢀⣠⠤⠤⣄⠀⣀⣀⡀⣰⡾⠛⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⠃⠀⠀",
      "⠀⠀⠀⢹⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡤⠾⠷⠞⠁⠀⠈⠉⠀⠀⠀⠈⠉⠁⠀⠉⢻⣇⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⠀⠀⠀",
      "⠀⠀⠀⢸⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⡏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⣦⠀⠀⠀⠀⠀⠀⠀⠀⢠⡟⠀⠀⠀",
      "⠀⠀⠀⠈⣷⠀⠀⠀⠀⠀⠀⢀⣴⠞⠋⠁⠀⠀⢀⠀⠀⠀⢰⠀⠀⠀⠀⣰⠀⠀⠀⠀⢀⡀⠀⠀⠙⠳⢦⡀⠀⠀⠀⠀⠀⢸⡇⠀⠀⠀",
      "⠀⠀⠀⠀⣿⠀⠀⠀⠀⠀⣰⣿⣿⡀⠀⠀⠀⠀⣫⣤⡴⠶⠟⢛⣛⣛⣛⡛⠒⠲⠦⣤⣼⠁⠀⠀⠀⠀⢸⣿⣆⠀⠀⠀⠀⣾⠃⠀⠀⠀",
      "⠀⠀⠀⠀⢻⣇⠀⠀⢀⣼⡟⠉⣟⠀⠀⢈⡶⠞⠉⠀⠀⢠⣾⣿⣿⣿⣿⣿⣷⡄⠀⠀⠈⠙⠶⣤⡄⠀⠘⣿⠻⣷⣀⣤⣴⠿⠀⠀⠀⠀",
      "⠀⠀⠀⠀⠈⠛⠛⢷⣾⠏⠀⠀⠻⢦⡴⠋⠀⠀⠀⠀⠀⣿⠟⠻⣿⣿⣿⠟⠻⣿⡀⠀⠀⠀⠀⠈⠻⣦⣴⠟⠀⢹⣿⠁⠀⠀⠀⠀⠀⠀",
      "⠀⠀⠀⠀⠀⠀⠀⢰⡏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢿⡀⣰⣿⣿⣿⣄⢀⡿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢿⡇⠀⠀⠀⠀⠀⠀",
      "⠀⠀⠀⠀⠀⠀⠀⣿⠇⠀⠀⠀⠀⠀⠀⠀⣀⣠⣤⣤⣤⣀⡉⠛⣿⢻⢿⣿⢋⣠⣤⡴⢤⣤⣀⠀⠀⠀⠀⠀⠀⠀⢸⣿⠀⠀⠀⠀⠀⠀",
      "⠀⠀⠀⠀⠀⠀⠀⣿⠀⠀⠀⠀⠀⢀⣴⡿⠋⠁⠀⠀⠀⠉⠛⠳⢶⣤⡴⠟⠋⠁⠀⠀⠀⠈⠙⢷⣄⠀⠀⠀⠀⠀⠀⣿⠀⠀⠀⠀⠀⠀",
      "⠀⠀⠀⠀⠀⠀⠀⣿⡇⠀⠀⠀⢠⡾⠃⣴⣤⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣴⡇⠹⣷⡀⠀⠀⠀⢰⣿⠀⠀⠀⠀⠀⠀",
      "⠀⠀⠀⠀⠀⠀⠀⢹⣧⠀⠀⠀⣿⠁⠀⢸⣿⣿⣿⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢴⣿⣿⣿⡁⠀⠸⣇⠀⠀⠀⣼⡇⠀⠀⠀⠀⠀⠀",
      "⠀⠀⠀⠀⠀⠀⠀⠀⢿⣆⠀⢰⣏⠀⠀⠸⣿⣿⣿⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⣿⣿⣿⠃⠀⠀⣿⠀⠀⣰⡟⠀⠀⠀⠀⠀⠀⠀",
      "⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⣦⣈⣿⡀⠀⠀⠉⠉⠁⠀⠀⠀⠀⠀⢸⣉⡳⠀⠀⠀⠀⠀⠈⠉⠁⠀⠀⢠⡏⣠⣾⠟⠀⠀⠀⠀⠀⠀⠀⠀",
      "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⣿⣧⡀⠀⠀⠀⠀⠀⠀⠀⠀⠰⢦⣀⡤⠖⠀⠀⠀⠀⠀⠀⠀⠀⣠⣿⣿⠟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀",
      "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢉⣿⡷⣶⣤⣄⣀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣀⣤⣴⣾⠛⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
      "⠀⠀⠀⠀⠀⠀⠀⠀⢀⡤⠢⣤⣾⠛⠁⠀⠀⢈⠉⠉⠙⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⠉⠉⠁⠙⢷⣤⡤⢤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
      "⠀⠀⠀⠀⠀⠀⠀⠀⠸⣇⣀⡟⠛⠛⠛⠛⠛⢻⡆⠀⠀⠀⢀⣠⣴⢶⣤⣀⠀⠀⠀⣼⠛⠛⠛⠛⠛⢻⣄⣀⡿⠀⠀⠀⠀⠀⠀⠀⠀⠀",
      "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡿⣤⣴⠾⠛⠉⠀⠀⠈⠙⠳⣦⡴⢏⡀⠀⠀⠀⠀⠀⠈⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
      "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣏⡀⢸⠄⠀⠀⠀⠀⠀⠀⠀⠀⢸⡀⢀⡗⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
    },
    buttons = {
    },
  },
  hl_override = {
    Comment = { italic = true },
    ["@comment"] = { italic = true },
    NvDashAscii = {
      fg = "dark_purple",
      bg = "black",
    },
    NvDashButtons = {
      fg = "black",
      bg = "black",
    },
  },
}

return M
