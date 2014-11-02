--Schattig by eiii, credits to whoever deserves them, 
--specially phelps for fixing Insanity
ProbablyEngine.rotation.register_custom(258, "|cff9482C9Schattig|r 0.1.5 by eiii~", {
   
	--Feather InCombat
	{ "!121536", {"player.moving", "toggle.feather", "!player.buff(121557)", "player.spell(121536).charges >= 1" }, "player.ground" }, --Feather
	
    -- Rotation
	{ "589", "target.debuff(589).duration <= 3" }, -- SW:P
	{ "34914", { "target.debuff(34914).duration <= 3.5", "!modifier.last", "!player.buff(132573)" }}, -- Vampiric Touch
    { "8092" }, -- Mind Blast 
	{ "!8092",  "player.buff(162452)" }, --Mind Blast with Shadowy Insight
    { "!2944", "player.shadoworbs = 3" }, -- Devouring Plague with 3 Orbs Up (for now)
    { "73510", "player.buff(162448)" }, -- Mind Spike with Procc
    { "32379", "target.health <= 20" }, -- SW:D under 20%
    { "32379", "target.debuff(32379).duration <= 3" }, -- wat
	{ "15407" }, --Mind Flay as filler
    { "129197", "player.buff(132573)" }, --Insanity with Procc Up
	{ "15286", "player.health <= 75" }, -- Vampiric Embrace
	
	-- Cooldowns
    { "10060", "modifier.cooldowns" }, -- Power Infusion
    { "34433", "modifier.cooldowns" }, -- Shadowfiend
    
    -- AoE
	{ "48045", { "modifier.multitarget", "target.area(10).enemies >= 4" } }, -- Mind Sear
	{ "127632", { "modifier.multitarget", "target.area(10).enemies >= 4" } }, --Cascade if Chosen 
    { "12064", { "modifier.multitarget", "target.area(10).enemies >= 4" } }, -- Halo
	{ "122121", { "modifier.multitarget", "target.area(10).enemies >= 4" } }, --Divine Star...
	
    -- Moving Around
	{ "121536", {"player.moving", "toggle.feather", "!player.buff(121557)", "player.spell(121536).charges >= 1" }, "player.ground" },
    { "73510", { "player.moving", "player.buff(162448)" }}, --Mind Spike when Moving and Procc
    { "127632", { "player.moving", "modifier.multitarget" }}, -- Cascade when Moving...
    { "120644", { "player.moving", "modifier.multitarget" }}, --Halo when Moving
	{ "122121", { "player.moving", "modifier.multitarget" }}, --Divine Star when Moving
	{ "589", "player.moving" }, -- SW:Pain when Moving
	{ "32379", { "player.moving", "target.health <= 20" }}, -- SW:D when Health under 20 Percent and Moving
	
	--Utility and Interrupts
    { "15487", "modifier.interrupts" }, -- Silence
	{ "/script TargetNearestEnemy()", { "toggle.autotarget", "!target.exists" } },
	{ "/script TargetNearestEnemy()", { "toggle.autotarget", "target.exists", "target.dead" } },
	
	--Defensive/Heal
	{ "#5512", "player.health < 35"}, -- Healthstone
	{ "17", {"player.health <= 55", "toggle.heal"}}, -- PW:Shield 
	{ "47585", {"player.health <= 10", "toggle.heal"}}, -- Dispersion when shit is getting tricky
	{ "2061", {"player.health <= 20", "toggle.heal"}}, -- Flash Heal 
	
},
-- OOC
{ 
	--Forms 'n Buffs
	
	{ "25162", "!player.buff(25162)" },
	{ "589", "tank.combat", "target" }, -- ty to MRTSZ, didn't know about "tank.combat"
	{ "21562", {"!player.buff(21562).any","!player.buff(588)"}}, -- PW:F
    { "15473", "!player.buff(15473)" }, -- Shadowform)
	{ "121536", {"player.movingfor > 2", "toggle.feather", "!player.buff(121557)", "player.spell(121536).charges >= 1" }, "player.ground" }, --Feather
	{ "33076", { "player.buff(41635).duration <= 3", "toggle.heal"} },
	{ "17", "!player.debuff(6788)" },
	
},
function()
	ProbablyEngine.toggle.create( 'embrace', 'Interface\\Icons\\spell_shadow_improvedvampiricembrace', "Vampiric Embrace", "Vampiric Embrace, <= 75% health")
	ProbablyEngine.toggle.create( 'feather', 'Interface\\Icons\\Ability_priest_angelicfeather', "Guess what", "Feather, if chosen, if not, l2p")
	ProbablyEngine.toggle.create('autotar', 'Interface\\Icons\\ability_hunter_markedfordeath', 'Auto Target', 'Too lazy to cycle trough mobs')
	ProbablyEngine.toggle.create('heal', 'Interface\\Icons\\ability_paladin_selflesshealer', 'Heal OOC', 'Healing between Fights, for Questing/Grinding')
end
)