Hooks:PreHook(CriminalsManager, "init", "init_choose_amount_of_ai", function(self)
	self.MAX_NR_TEAM_AI = TeammateAmountAI.value
end)