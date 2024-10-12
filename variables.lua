local variables = {}

variables.modkey = "Mod4"

variables.terminal = "alacritty"
variables.editor = os.getenv("EDITOR") or "nano"
variables.editor_cmd = variables.terminal .. " -e " .. variables.editor

variables.browser = "chromium"

variables.file_manager = "thunar"

return variables