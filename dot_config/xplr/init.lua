version = '0.20.0'

-- Necessary for plugins
local home = os.getenv("HOME")
local xpm_path = home .. "/.local/share/xplr/dtomvan/xpm.xplr"
local xpm_url = "https://github.com/dtomvan/xpm.xplr"

package.path = package.path
  .. ";"
  .. xpm_path
  .. "/?.lua;"
  .. xpm_path
  .. "/?/init.lua"

os.execute(
  string.format(
    "[ -e '%s' ] || git clone '%s' '%s'",
    xpm_path,
    xpm_url,
    xpm_path
  )
)

-- Trash files and directories
require("xpm").setup ({
      auto_install = true,
      auto_cleanup = true,
      plugins = {
	 -- Let xpm manage itself
	 "dtomvan/xpm.xplr",

	 {
	    name = "sayanarijit/trash-cli.xplr",
	    setup = function()
	       require("trash-cli").setup({
		     trash_mode = "delete",
		     trash_key = "d",
		     restore_mode = "delete",
		     restore_key = "r",
		     -- Use skim to restore trashed files
		     trash_list_selector = "sk | cut -d' ' -f3-"
					 })
	    end,
	 },
	 {
	    -- Copy and pasting files
	    name = "sayanarijit/xclip.xplr",
	    setup = function()
	    require("xclip").setup({
		  copy_command = "xclip-copyfile",
		  copy_paths_command = "xclip -sel clip",
		  paste_command = "xclip-pastefile",
		  keep_selection = false,
				  })
	    end
	 },
	 {
	    -- Painless compression and decompression
	    name = "sayanarijit/ouch.xplr",
	    setup = function()
	       require("ouch").setup({
		     mode = "default",
		     key = "o",
				    })
	    end
	 },

      }
		     })


xplr.config.general.global_key_bindings = {
   on_key = {
      esc = {
	 help = "escape",
	 messages = {
	    "PopMode",
	 },
      },
      ["ctrl-c"] = {
	 help = "terminate",
	 messages = {
	    "Terminate",
	 },
      },
   },
}
   
-- Change the color of the prompt
xplr.config.general.prompt.style.fg = "Red"

-- Change the layout of xplr
xplr.config.layouts.builtin.default = {
   Horizontal = {
      config = {
	 constraints = {
	    { Percentage = 70 },
	    { Percentage = 30 },
	 }
      },
      splits = {
	 {
	    Vertical = {
	       config = {
		  constraints = {
		     {
			Percentage = 8,
		     },
		     {
			Percentage = 92,
		     }
		  }
	       },
	       splits = {
		  "InputAndLogs",
		  "Table",
	       }
	    }
	 },
	 {
	    Vertical = {
	       config = {
		  constraints = {
		     {
			Percentage = 50,
		     },
		     {
			Percentage = 94,
		     }
		  }
	       },
	       splits = {
		  "Selection",
		  "HelpMenu",
	       }
	    }
	 }
      }
   }
}

-- Border definitions
xplr.config.general.panel_ui.default.border_type = "Thick"
xplr.config.general.panel_ui.default.border_style.fg = "DarkGray"

-- Change format of the second column of the table's header
xplr.config.general.table.header.cols[2] = {
   format = "path",
}

-- Table definitions
xplr.config.general.table.style.fg = "Blue"
xplr.config.general.table.header.style.fg = "Yellow"
xplr.config.general.table.header.style.add_modifiers = { "Bold" }
