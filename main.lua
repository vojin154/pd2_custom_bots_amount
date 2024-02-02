if not TeammateAmountAI then
    _G.TeammateAmountAI = _G.TeammateAmountAI or {}
    TeammateAmountAI._path = ModPath
    TeammateAmountAI._data_path = SavePath .. "AmountOfTeammatesAI.txt"
    TeammateAmountAI.value = 3

	function TeammateAmountAI:Load()
		local file = io.open(self._data_path, "r")
		if file then
			self.value = tonumber(file:read("*all"))
			file:close()
		end
        self.value = self.value or 3 --i guess lol
	end

	function TeammateAmountAI:Save()
		local file = io.open(self._data_path, "w+")
		if file then
			file:write(self.value)
			file:close()
		end
	end

    function TeammateAmountAI:get_item(node, name)
        for i, v in ipairs(node:items()) do
            if v:parameters()["name"] == name then
                return i --, v we dont really need v since we just care for index but i have this just incase i need it in the future ig
            end
        end
        return nil
    end

    function TeammateAmountAI:create_item(node, hook)
        local params = {
            name = "teammate_ai_amount",
            callback = "choose_amount_team_ai",
            enabled_callback = "enabled_amount_team_ai",
            text_id = "AMOUNT OF TEAM AI",
            localize = false,
            filter = true
        }
     
        local options = {
            {
                value = 1,
                text_id = "1",
                localize = false,
                _meta = "option"
            },
            {
                value = 2,
                text_id = "2",
                localize = false,
                _meta = "option"
            },
            {
                value = 3,
                text_id = "3",
                localize = false,
                _meta = "option"
            },
            type = "MenuItemMultiChoice"
        }

        local new_item = node:create_item(options, params)
        new_item:set_current_index(self.value)

        Hooks:PreHook(MenuCallbackHandler, "choice_crimenet_team_ai", "choice_crimenet_team_ai_choose_amount_of_ai_" .. hook, function(self, item)
            new_item:set_enabled(item:value() ~= 0)
        end)

        local menu_index = self:get_item(node, "toggle_ai") + 1

        node:insert_item(new_item, menu_index)

        return new_item
    end
end

TeammateAmountAI:Load()

local required = {}
if RequiredScript and not required[RequiredScript] then
	local fname = TeammateAmountAI._path .. RequiredScript:gsub(".+/(.+)", "lua/%1.lua")
	if io.file_is_readable(fname) then
		dofile(fname)
	end

	required[RequiredScript] = true
end