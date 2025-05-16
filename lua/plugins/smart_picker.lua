local function smart_picker(state)
  local inputs = require("neo-tree.ui.inputs")
  local renderer = require("neo-tree.ui.renderer")
  local path = require("plenary.path")

  local entries = {}
  for _, node in ipairs(state.tree.nodes) do
    if node.type == "directory" then
      table.insert(entries, {
        label = node.name,
        path = node:get_id(),
        node = node,
      })
    end
  end

  if #entries == 0 then
    print("No directories to pick.")
    return
  end

  local labels = "abcdefghijklmnopqrstuvwxyz"

  local choices = {}
  for i, entry in ipairs(entries) do
    local label = labels:sub(i, i)
    if not label then
      break
    end
    table.insert(choices, {
      label = label,
      entry = entry,
    })
  end

  inputs.pick("Choose directory:", choices, function(choice)
    if choice and choice.entry then
      local id = choice.entry.path
      renderer.focus_node(state, id)
      renderer.toggle_node(state, id)
    end
  end)
end
return {}
