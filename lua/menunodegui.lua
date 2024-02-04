Hooks:PreHook(MenuNodeGui, "close", "close_choose_amount_of_ai", function(self, ...)
	Hooks:RemovePreHook("choice_crimenet_team_ai_choose_amount_of_ai_broker")
    --Hooks:RemovePreHook("choice_crimenet_team_ai_choose_amount_of_ai_lobby") 
    --[[
        you must be wondering why is this commented out and not removed too
        the way i did the broker one is that it gets hooked everytime a heist is opened meaning we run into problems (yes i tried if statements and shit it would work but would be ugly and we want it simple)
        while the lobby one gets just hooked once the lobby is created and isnt touched since then meaning no duplicated hooks
    ]]
end)