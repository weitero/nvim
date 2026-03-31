return {
  {
    "saghen/blink.cmp",
    opts = {
      sources = {
        providers = {
          -- Buffer completion from all open buffers
          -- The default behavior is to only show completions from visible "normal" buffers (e.g. it wouldn't include neo-tree). This will instead show completions from all buffers, even if they're not visible on screen. Note that the performance impact of this has not been tested.
          buffer = {
            opts = {
              -- or (recommended) filter to only "normal" buffers
              get_bufnrs = function()
                return vim.tbl_filter(function(bufnr)
                  return vim.bo[bufnr].buftype == ""
                end, vim.api.nvim_list_bufs())
              end,
            },
            -- Keep first letter capitalization on buffer source
            -- keep case of first char
            transform_items = function(a, items)
              local keyword = a.get_keyword()
              local correct, case
              if keyword:match("^%l") then
                correct = "^%u%l+$"
                case = string.lower
              elseif keyword:match("^%u") then
                correct = "^%l+$"
                case = string.upper
              else
                return items
              end

              -- avoid duplicates from the corrections
              local seen = {}
              local out = {}
              for _, item in ipairs(items) do
                local raw = item.insertText
                if raw:match(correct) then
                  local text = case(raw:sub(1, 1)) .. raw:sub(2)
                  item.insertText = text
                  item.label = text
                end
                if not seen[item.insertText] then
                  seen[item.insertText] = true
                  table.insert(out, item)
                end
              end
              return out
            end,
          },
          -- Hide snippets after trigger character
          -- Trigger characters are defined by the sources. For example, for Lua, the trigger characters are ., ", '.
          snippets = {
            should_show_items = function(ctx)
              return ctx.trigger.initial_kind ~= "trigger_character"
            end,
          },
        },
        -- Dynamically picking providers by treesitter node/filetype
        default = function()
          local success, node = pcall(vim.treesitter.get_node)
          if success and node and vim.tbl_contains({ "comment", "line_comment", "block_comment" }, node:type()) then
            return { "buffer" }
          end
          return { "lsp", "path", "snippets", "buffer" }
        end,
      },
    },
  },
}
