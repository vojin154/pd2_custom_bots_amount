function MenuCallbackHandler:choose_amount_team_ai(item)
    TeammateAmountAI.value = item:value() or 3

    TeammateAmountAI:Save()
end

function MenuCallbackHandler:enabled_amount_team_ai()
    return Global.game_settings.team_ai
end

Hooks:PostHook(LobbyOptionInitiator, "modify_node", "_modify_node_choose_amount_of_ai", function(self, node)
    if not node:item("toggle_ai") then
        return
    end

    TeammateAmountAI:create_item(node, "lobby")
end)