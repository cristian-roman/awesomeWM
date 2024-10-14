local awful = require("awful")
local beautiful = require("beautiful")
local keyboard_client_keys = require("keybindings.clients.client_keys")
local mousebindings = require("mousebindings.clients_bindings")

awful.rules.rules = 
{
  { 
    rule = { },
    properties = { 
      border_width = beautiful.border_width,
      border_color = beautiful.border_normal,
      focus = awful.client.focus.filter,
      raise = true,
      keys = keyboard_client_keys,
      buttons = mousebindings,
      screen = awful.screen.preferred,
      placement = awful.placement.no_overlap+awful.placement.no_offscreen
    }
  },
  
  { 
    rule_any = {
      instance = {
        "DTA",
        "copyq",
        "pinentry",
      },

      class = {
        "Arandr",
        "Blueman-manager",
        "Gpick",
        "Kruler",
        "MessageWin",
        "Sxiv",
        "Tor Browser",
        "Wpa_gui",
        "veromix",
        "xtightvncviewer"},
      
        name = {
          "Event Tester",
        },

        role = {
          "AlarmWindow",
          "ConfigManager",
          "pop-up",
        }
    }, 
    
    properties = { floating = true }
  
  }
}