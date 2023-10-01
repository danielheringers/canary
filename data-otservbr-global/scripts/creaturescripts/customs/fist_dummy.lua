local mType = Game.createMonsterType("Dummy Shield")
local monster = {}

monster.description = "a tamed troll"
monster.experience = 20
monster.outfit = {
	lookType = 15,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.raceId = 15
monster.Bestiary = {
	class = "Humanoid",
	race = BESTY_RACE_HUMANOID,
	toKill = 50,
	FirstUnlock = 10,
	SecondUnlock = 20,
	CharmsPoints = 5,
	Stars = 1,
	Occurrence = 0,
	Locations = "Nos arredores da cidade de Inita. Atraidos pela grande movimentação de humanos ficam a espreita esperando uma oportunidade para atacar os viajantes...",
}

monster.health = 50000
monster.maxHealth = 50000
monster.race = "blood"
monster.corpse = 5960
monster.speed = 0
monster.manaCost = 290

monster.changeTarget = {
	interval = 4000,
	chance = 0,
}

monster.strategiesTarget = {
	nearest = 100,
}

monster.flags = {
	summonable = true,
	attackable = true,
	hostile = true,
	convinceable = false,
	pushable = false,
	rewardBoss = false,
	illusionable = false,
	canPushItems = false,
	canPushCreatures = false,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = false,
	canWalkOnPoison = false,
}

monster.light = {
	level = 0,
	color = 0,
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "Hmmm, humanos", yell = false },
	{ text = "Hmmm, cães", yell = false },
	{ text = "Grrr", yell = false },
	{ text = "Groar", yell = false },
	{ text = "Gruntz!", yell = false },
}

monster.loot = {
}

monster.attacks = {
	{ name = "melee", interval = 0500, chance = 100, minDamage = -1, maxDamage = -15 },
}

monster.defenses = {
	defense = 10,
	armor = 6,
	mitigation = 0.20,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 100 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 20 },
	{ type = COMBAT_EARTHDAMAGE, percent = -10 },
	{ type = COMBAT_FIREDAMAGE, percent = 0 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 0 },
	{ type = COMBAT_HOLYDAMAGE, percent = 10 },
	{ type = COMBAT_DEATHDAMAGE, percent = -10 },
}

monster.immunities = {
	{ type = "paralyze", condition = false },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = false },
	{ type = "bleed", condition = false },
}

mType:register(monster)
