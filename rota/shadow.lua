version = "0.3.0"


local btn = function()
	ProbablyEngine.toggle.create( 'GUI', 'Interface\\Icons\\trade_engineering.png"', 'Open/Close GUI','Toggle GUI', (function() schatLib.displayFrame(schattig_config) end) )     
local fetch = ProbablyEngine.interface.fetchKey
end
-- Dynamically evaluate settings
local fetch = ProbablyEngine.interface.fetchKey

local function dynamicEval(condition, spell)
	if not condition then return false end
	return ProbablyEngine.dsl.parse(condition, spell or '')
end
-- [[ooC Rotation]] --
local beforeCombat = {
	--Forms 'n Buffs
		{ "!15473", "!player.buff(15473)" }, -- Shadowform
		{ "25162", "!player.buff(25162)"},
		{ "1706",{ "player.falling >= 2", "!modifier.last", 
			(function() return fetch('schattigConfig', 'levitate') end)}},
		{ "589", "player.moving", "tank.combat", "target" }, -- Engage when Tank in Combat with SW:P while Moving
		{ "34914", "!player.moving", "tank.combat", "target" }, -- Engage when Tank in Combat with VT whilst not Moving
		{ "!121536", {"player.moving", "!player.buff(121557)", "player.spell(121536).charges >= 1" , "talent(2, 2)",
			(function() return fetch('schattigConfig', 'feather') end)}, "player.ground"},
		{ "!17", {"talent(2, 1)", "player.moving", "!player.buff(6788)", 
			(function() return fetch('schattigConfig', 'feather') end)}},
	
}
-- [[Combat Rotation]] --
local combatRotation = {
	{ "!15473", "!player.buff(15473)" }, -- Shadowform
 	{{
		{"/targetenemy [noexists]", "!target.exists"},
		{"/targetenemy [dead]", {"target.exists", "target.dead"}},
	}, (function() return fetch('schattigConfig', 'auto_target') end)},

	{ "#5512", 
	(function() return dynamicEval("player.health <= " .. fetch('schattigConfig', 'hstone')) end)}, -- Healthstone

 	-- Cooldowns
		{ "123040", "talent(3, 2)"}, -- Mindbender on CD if chosen
 		{ "10060", {"talent(5, 2)", "modifier.cooldowns" }}, -- Power Infusion
		{ "34433", "modifier.cooldowns" }, -- Shadowfiend
		{ "15286", {
			(function() return dynamicEval("player.health <= " .. fetch('schattigConfig', 've_health')) end), 
			(function() return fetch('schattigConfig', 'selfheal') end)}}, --VE < 75% hp

			--Defensive/Heal
		{ "586", {
				(function() return dynamicEval("player.threat >= " .. fetch('schattigConfig', 'fade')) end),
				(function() return fetch('schattigConfig', 'selfheal') end) }}, -- FADE
		{ "!12963", {
			(function() return dynamicEval("player.health <= " .. fetch('schattigConfig', 'instaprayer')) end), 
			(function() return fetch('schattigConfig', 'selfheal') end) }},
		{ "17", {"!player.debuff(6788)", 
			(function() return dynamicEval("player.health <= " .. fetch('schattigConfig', 'shield')) end),
			(function() return fetch('schattigConfig', 'selfheal') end)}}, --PW:S on HP
		{ "47585", {
			(function() return dynamicEval("player.health <= " .. fetch('schattigConfig', 'guise')) end), 
			(function() return fetch('schattigConfig', 'selfheal') end)}}, -- Dispersion when shit is getting tricky
		{ "112833", { "talent(1, 2)", 
			(function() return dynamicEval("player.health <= " .. fetch('schattigConfig', 'guise')) end), 
			(function() return fetch('schattigConfig', 'selfheal') end)}}, --Guise
		{ "2061", {"player.health <= 20",}}, -- Flash Heal 
  --[[EXPErIMENTAL MULTIDOTTING ]]--
	{{
		-- SW:P
		{ "589", {"!mouseover.debuff(589)", "!player.casting(48181)"}, "mouseover"},
		{ "589", {"mouseover.debuff(589).duration < 5", "!player.casting(15407)", "!player.casting(129197)","!player.casting(34914)", "!player.casting(8092)", }, "mouseover"},
		
		-- Vampiric Touch
		{ "34914", {"!mouseover.debuff(34914)", "!player.casting(48181)", "!player.moving"}, "mouseover"},
		{ "34914", {"mouseover.debuff(34914).duration < 5", "!player.casting(15407)", "!player.casting(129197)", "!player.casting(8092)" }, "mouseover"},
		
	}, "modifier.multitarget", "modifier.lshift", },

	
	-- [[ AoE ]] --
		{ "48045", { "modifier.multitarget", "target.area(10).enemies >= 4" } }, -- Mind Sear
		{ "127632", { "modifier.multitarget", "target.area(10).enemies >= 4", "modifier.lalt"  } }, --Cascade if Chosen 
		{ "12064", { "modifier.multitarget", "target.area(10).enemies >= 4", "modifier.lalt"  } }, -- Halo
		{ "122121", { "modifier.multitarget", "target.area(10).enemies >= 4", "modifier.lalt"  } }, --Divine Star...
	
	-- [[ Rotation ]] -- 
	--Feather InCombat
		{ "!121536", {"player.moving", "!player.buff(121557)", "player.spell(121536).charges >= 1" , "talent(2, 2)",
			(function() return fetch('schattigConfig', 'feather') end)}}, "player.ground"},
		{ "!17", {"talent(2, 1)", "player.moving", "!player.buff(6788)", 
			(function() return fetch('schattigConfig', 'feather') end)}},
	
    -- Rotation
    { "32379", "target.health <= 20" }, -- SW:D under 20%
	{ "589", "target.debuff(589).duration <= 3" }, -- SW:P
	{ "34914", { "target.debuff(34914).duration <= 3.5", "!modifier.last", "!player.buff(132573)" }}, -- Vampiric Touch
	{ "!8092", { "player.buff(162452)", "!player.buff(132573" }}, --Mind Blast with Shadowy Insight
	{ "73510", "player.buff(87160)" }, -- Mind Spike with Procc
	{ "!2944", "player.shadoworbs = 3" }, -- Devouring Plague with 3 Orbs Up (for now)
	{ "129197", "player.buff(132573)" }, --Insanity with Procc Up
	{ "8092" }, -- Mind Blast
	{ "15407" }, --Mind Flay as filler
	
	
    -- Moving Around
    	{ "32379", { "player.moving", "target.health <= 20" }}, -- SW:D when Health under 20 Percent and Moving
		{ "121536", {"player.moving", "toggle.feather", "!player.buff(121557)", "player.spell(121536).charges >= 1" }, "player.ground" },
		{ "73510", { "player.moving", "player.buff(162448)" }}, --Mind Spike when Moving and Procc
		{ "127632", { "player.moving", "modifier.multitarget" }}, -- Cascade when Moving...
		{ "120644", { "player.moving", "modifier.multitarget" }}, --Halo when Moving
		{ "122121", { "player.moving", "modifier.multitarget" }}, --Divine Star when Moving
		{ "589", "player.moving" }, -- SW:Pain when Moving


}




-- Register our rotation
ProbablyEngine.rotation.register_custom(258, "|cff9482C9BETA|r by b0nze~", combatRotation, beforeCombat, btn)