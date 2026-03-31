return {
  {
    "saghen/blink.cmp",
    opts = {
      cmdline = {
        -- use 'inherit' to inherit mappings from top level `keymap` config
        keymap = {
          -- Safely select entries with <CR>
          -- If nothing is selected (including preselections) add a newline as usual.
          -- If something has explicitly been selected by the user, select it.
          ["<CR>"] = {
            function(cmp)
              if cmp.is_visible() and cmp.get_selected_item() then
                cmp.accept()
                return true
              end
            end,
            "fallback",
          },
        },

        completion = {
          -- Displays a preview of the selected item on the current line
          ghost_text = { enabled = false },
        },
      },
    },
  },
}
