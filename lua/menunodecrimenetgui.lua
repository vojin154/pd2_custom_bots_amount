Hooks:PreHook(MenuNodeCrimenetGui, "init", "init_choose_amount_of_ai", function(self, node, layer, parameters)
    if not node:item("toggle_ai") then
        return
    end

    TeammateAmountAI:create_item(node, "broker")
end)