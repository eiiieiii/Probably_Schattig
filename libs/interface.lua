--[[
	Stolen from Mirakuru
	No, seriously thank you very much for your Help dude <3
]]
ProbablyEngine.command.register('schattig', function(msg, box)
local command, text = msg:match("^(%S*)%s*(.-)$")
	if command == "config" or command == "settings" then
		if GetSpecialization() == 3 then
			schatLib.displayFrame(schattig_config)
		end		
	end
end)

schattig_config = {
	key = "schattigConfig",
	profiles = true,
	title = "schattig",
	subtitle = "Configuration",
	color = "9482C9",
	width = 250,
	height = 600,
	config = {
	--GENERAL CONFIG 
		{
	 	 type = "texture",
  			texture = "Interface\\AddOns\\Probably_Schattig\\texture\\schatt.blp",
 			width = 128,
 			height = 128,
  			offset = 90,
  			y = 42,
 			center = true
		},
				{type = "spacer"},
						{type = "spacer"},
		{
			type = "header",
			text = "General Settings",
			align = "center",
		},
		{type = "rule"},
		{
			type = "checkbox",
			default = false,
			text = "Auto Target",
			key = "auto_target",
			desc = "Set new target if your target is dead or you have no target."
		},

		{
			type = "checkbox",
			default = false,
			text = "Force Attack",
			key = "force_attack",
			desc = "Force attack your target even if not in combat."
		},
		{
			type = "spinner",
			text = "Healthstone HP <=",
			key = "hstone",
			width = 50,
			min = 0,
			max = 100,
			default = 75,
			step = 5,
			desc = "Selfexplaining..."
		},
		{
			type = "header",
			text = "Movement Settings",
			align = "center",
		},
		{type = "rule"},
		{
			type = "checkbox",
			default = false,
			text = "Angelic Feather / Body and Soul",
			key = "feather",
			desc = "Use Angelic Feather / Body and Soul while moving."
		},
		{type = "spacer"},
		{
			type = "checkbox",
			default = false,
			text = "Levitate",
			key = "levitate",
			desc = "Use Levitate when falling"
		},

		{type = "spacer"},
				{
			type = "header",
			text = "SelfHeal / Defensive Settings",
			align = "center",
		},
				{type = "rule"},
		{
			type = "checkbox",
			default = false,
			text = "Selfheal",
			key = "selfheal",
			desc = "Enable/Disable all of the following Features."
		},
		{type = "rule"},
				{
			type = "spinner",
			text = "Vampiric Embrace HP <=",
			key = "ve_health",
			width = 50,
			min = 0,
			max = 100,
			default = 75,
			step = 5,
			desc = "lower then this Health to cast Vampiric Embrace."
		},

				{
			type = "spinner",
			text = "PW:Shield HP <=",
			key = "shield",
			width = 50,
			min = 0,
			max = 100,
			default = 60,
			step = 5,
			desc = "lower then this Health to cast Power Word: Shield."
		},

				{
			type = "spinner",
			text = "Desperate Prayer HP <=",
			key = "instaprayer",
			width = 50,
			min = 0,
			max = 100,
			default = 20,
			step = 5,
			desc = "lower then this Health to cast Desperate Prayer."
		},

				{
			type = "spinner",
			text = "Spectral Guise / Dispersion at HP <=",
			key = "guise",
			width = 50,
			min = 0,
			max = 100,
			default = 20,
			step = 5,
			desc = "lower then this Health to cast Spectral Guise/Dispersion."
		},
				{
			type = "spinner",
			text = "Fade at Threat  >=",
			key = "fade",
			width = 50,
			min = 0,
			max = 100,
			default = 90,
			step = 5,
			desc = "Use Fade to reduce Threat."
		},

		{type = "spacer"},
				{
			type = "header",
			text = "|cff9482C9Schattig|r by b0nze~",
			align = "center",
		},
				{
			type = "header",
			text = "Current Version: |cffC41F3B0|r.|cffC41F3B3|r.|cffC41F3B0|r ",
			align = "center",
		},
		
	}
}