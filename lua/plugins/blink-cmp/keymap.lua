-- Emacs behavior
-- Full discussion: https://github.com/Saghen/blink.cmp/issues/1367
local has_words_before = function()
  local col = vim.api.nvim_win_get_cursor(0)[2]
  if col == 0 then
    return false
  end
  local line = vim.api.nvim_get_current_line()
  return line:sub(col, col):match("%s") == nil
end

return {
  {
    "saghen/blink.cmp",
    opts = {
      keymap = {
        ["<C-space>"] = { "show", "fallback" },
        ["<C-e>"] = { "cancel", "fallback" },
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

        ["<Up>"] = {
          function(cmp)
            if cmp.is_documentation_visible() then
              cmp.scroll_documentation_up(4)
              return true
            end
          end,
          "fallback",
        },
        ["<Down>"] = {
          function(cmp)
            if cmp.is_documentation_visible() then
              cmp.scroll_documentation_down(4)
              return true
            end
          end,
          "fallback",
        },

        -- Confirm candidate on TAB immediately when there's only one completion entry
        ["<Tab>"] = {
          function(cmp)
            if cmp.is_visible() then
              if #cmp.get_items() == 1 then
                cmp.select_and_accept()
              else
                cmp.select_next()
              end
            elseif cmp.snippet_active({ direction = 1 }) then
              cmp.snippet_forward()
            elseif has_words_before() then
              cmp.show()
              if #cmp.get_items() == 1 then
                cmp.select_and_accept()
              end
            else
              return
            end
            return true
          end,
          "fallback",
        },
        -- Super-Tab like mapping
        ["<S-Tab>"] = {
          function(cmp)
            if cmp.is_visible() then
              cmp.select_prev()
            elseif cmp.snippet_active({ direction = -1 }) then
              cmp.snippet_backward()
            else
              return
            end
            return true
          end,
          "fallback",
        },
      },
    },
  },
}
