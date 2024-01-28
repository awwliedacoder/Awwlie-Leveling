local characterMeta = nut.meta.character

nut.command.add("charsetmedxp", {
	adminOnly = true,
	syntax = "<string name> [number amount]",
	onRun = function(client, arguments)
		local amnt = tonumber(arguments[2])
		local target = nut.command.findPlayer(client, arguments[1])

		if (IsValid(target) and target:getChar()) then
			target:getChar():setMedXP(amnt, target:getChar())
		end
end})

nut.command.add("charsetcqcxp", {
	adminOnly = true,
	syntax = "<string name> [number amount]",
	onRun = function(client, arguments)
		local amnt = tonumber(arguments[2])
		local target = nut.command.findPlayer(client, arguments[1])

		if (IsValid(target) and target:getChar()) then
			target:getChar():setXP(amnt, target:getChar())
		end
end})

nut.command.add("charsetengxp", {
	adminOnly = true,
	syntax = "<string name> [number amount]",
	onRun = function(client, arguments)
		local amnt = tonumber(arguments[2])
		local target = nut.command.findPlayer(client, arguments[1])

		if (IsValid(target) and target:getChar()) then
			target:getChar():setEngXP(amnt, target:getChar())
		end
end})

nut.command.add("charsetscixp", {
	adminOnly = true,
	syntax = "<string name> [number amount]",
	onRun = function(client, arguments)
		local amnt = tonumber(arguments[2])
		local target = nut.command.findPlayer(client, arguments[1])

		if (IsValid(target) and target:getChar()) then
			target:getChar():setSciXP(amnt, target:getChar())
		end
end})

nut.command.add("charsetaccxp", {
	adminOnly = true,
	syntax = "<string name> [number amount]",
	onRun = function(client, arguments)
		local amnt = tonumber(arguments[2])
		local target = nut.command.findPlayer(client, arguments[1])

		if (IsValid(target) and target:getChar()) then
			target:getChar():setAccXP(amnt, target:getChar())
		end
end})

nut.command.add("charsethackxp", {
	adminOnly = true,
	syntax = "<string name> [number amount]",
	onRun = function(client, arguments)
		local amnt = tonumber(arguments[2])
		local target = nut.command.findPlayer(client, arguments[1])

		if (IsValid(target) and target:getChar()) then
			target:getChar():setHackXP(amnt, target:getChar())
		end
end})

nut.command.add("charaddcqc", {
	adminOnly = true,
	syntax = "<string name> [number amount]",
	onRun = function(client, arguments)
		local amnt = tonumber(arguments[2])
		local target = nut.command.findPlayer(client, arguments[1])

		if (IsValid(target) and target:getChar()) then
			target:getChar():giveXP(amnt, target:getChar(), target)
		end
end})

nut.command.add("charaddmed", {
	adminOnly = true,
	syntax = "<string name> [number amount]",
	onRun = function(client, arguments)
		local amnt = tonumber(arguments[2])
		local target = nut.command.findPlayer(client, arguments[1])

		if (IsValid(target) and target:getChar()) then
			target:getChar():giveMED(amnt, target:getChar(), target)
		end
end})

nut.command.add("charaddsci", {
	adminOnly = true,
	syntax = "<string name> [number amount]",
	onRun = function(client, arguments)
		local amnt = tonumber(arguments[2])
		local target = nut.command.findPlayer(client, arguments[1])

		if (IsValid(target) and target:getChar()) then
			target:getChar():giveSCI(amnt, target:getChar(), target)
		end
end})

nut.command.add("charaddeng", {
	adminOnly = true,
	syntax = "<string name> [number amount]",
	onRun = function(client, arguments)
		local amnt = tonumber(arguments[2])
		local target = nut.command.findPlayer(client, arguments[1])

		if (IsValid(target) and target:getChar()) then
			target:getChar():giveENG(amnt, target:getChar(), target)
		end
end})

nut.command.add("charaddhack", {
	adminOnly = true,
	syntax = "<string name> [number amount]",
	onRun = function(client, arguments)
		local amnt = tonumber(arguments[2])
		local target = nut.command.findPlayer(client, arguments[1])

		if (IsValid(target) and target:getChar()) then
			target:getChar():giveHACK(amnt, target:getChar(), target)
		end
end})

nut.command.add("charaddacc", {
	adminOnly = true,
	syntax = "<string name> [number amount]",
	onRun = function(client, arguments)
		local amnt = tonumber(arguments[2])
		local target = nut.command.findPlayer(client, arguments[1])

		if (IsValid(target) and target:getChar()) then
			target:getChar():giveACC(amnt, target:getChar(), target)
		end
end})
-- XP HANDLELING
function characterMeta:getXP()
	return self:getData("charXP") or 1
end

local lvlTbl = {}

function characterMeta:getMedXP()
	return self:getData("MedXP") or 1
end

local lvlTbl = {}

function characterMeta:getSciXP()
	return self:getData("SciXP") or 1
end

local lvlTbl = {}

function characterMeta:getAccXP()
	return self:getData("AccXP") or 1
end

local lvlTbl = {}

function characterMeta:getEngXP()
	return self:getData("EngXP") or 1
end

local lvlTbl = {}

function characterMeta:getHackXP()
	return self:getData("HackXP") or 1
end

local lvlTbl = {}


/*
  A table for the experience in the leveling system.
*/

function PLUGIN:InitializedConfig()
	for i = 1, 20 do
		lvlTbl[i] = math.Round(100 * math.pow(i-1, 1.95))
	end
end


function characterMeta:getLevelXP()
	if (self:getLevel() <= 19) then
		return lvlTbl[self:getLevel() + 1]
	else
		return 0
	end
end

function characterMeta:getScienceXP()
	if (self:getLevel() <= 19) then
		return lvlTbl[self:getScience() + 1]
	else
		return 0
	end
end

function characterMeta:getHackingXP()
	if (self:getHacking() <= 19) then
		return lvlTbl[self:getHacking() + 1]
	else
		return 0
	end
end

function characterMeta:getEngineeringXP()
	if (self:getEngineering() <= 19) then
		return lvlTbl[self:getEngineering() + 1]
	else
		return 0
	end
end

function characterMeta:getMedicalXP()
	if (self:getMedical() <= 19) then
		return lvlTbl[self:getMedical() + 1]
	else
		return 0
	end
end

function characterMeta:getAccuracyXP()
	if (self:getAcc() <= 19) then
		return lvlTbl[self:getAcc() + 1]
	else
		return 0
	end
end
-- PAST LEVEL XP
function characterMeta:pastLvlXP()
	return lvlTbl[self:getLevel()]
end

function characterMeta:pastAccXP()
	return lvlTbl[self:getAcc()]
end

function characterMeta:pastEngXP()
	return lvlTbl[self:getEngineering()]
end

function characterMeta:pastHackXP()
	return lvlTbl[self:getHacking()]
end

function characterMeta:pastMedXP()
	return lvlTbl[self:getMedical()]
end

function characterMeta:pastSciXP()
	return lvlTbl[self:getScience()]
end

function characterMeta:getLevel()
	local xp = self:getXP()

	for i = 1, 20 do
		if xp <= lvlTbl[i] and xp > lvlTbl[i-1] then
			return i-1
		else
			if xp >= lvlTbl[20] then
				return 20
			end
		end
	end
end

function characterMeta:getScience()
	local xp = self:getSciXP()

	for i = 1, 20 do
		if xp <= lvlTbl[i] and xp > lvlTbl[i-1] then
			return i-1
		else
			if xp >= lvlTbl[20] then
				return 20
			end
		end
	end
end

function characterMeta:getAcc()
	local xp = self:getAccXP()

	for i = 1, 20 do
		if xp <= lvlTbl[i] and xp > lvlTbl[i-1] then
			return i-1
		else
			if xp >= lvlTbl[20] then
				return 20
			end
		end
	end
end

function characterMeta:getMedical()
	local xp = self:getMedXP()

	for i = 1, 20 do
		if xp <= lvlTbl[i] and xp > lvlTbl[i-1] then
			return i-1
		else
			if xp >= lvlTbl[20] then
				return 20
			end
		end
	end
end

function characterMeta:getEngineering()
	local xp = self:getEngXP()

	for i = 1, 20 do
		if xp <= lvlTbl[i] and xp > lvlTbl[i-1] then
			return i-1
		else
			if xp >= lvlTbl[20] then
				return 20
			end
		end
	end
end

function characterMeta:getHacking()
	local xp = self:getHackXP()

	for i = 1, 20 do
		if xp <= lvlTbl[i] and xp > lvlTbl[i-1] then
			return i-1
		else
			if xp >= lvlTbl[20] then
				return 20
			end
		end
	end
end
 -- Is levels
function characterMeta:isLevel(amount)
	return (self:getLevel() - amount) >= 0
end

function characterMeta:isAccuracy(amount)
	return (self:getAcc() - amount) >= 0
end

function characterMeta:isMedical(amount)
	return (self:getMedical() - amount) >= 0
end

function characterMeta:IsScience(amount)
	return (self:getScience() - amount) >= 0
end

function characterMeta:isEngineering(amount)
	return (self:getEngineering() - amount) >= 0
end

function characterMeta:isHack(amount)
	return (self:getHacking() - amount) >= 0
end
 -- Exacts on LEVELS
function characterMeta:isLevelExact(amount)
	return self:getLevel() == amount
end

function characterMeta:IsScienceExact(amount)
	return self:getScience() == amount
end

function characterMeta:isAccuracyExact(amount)
	return self:getAcc() == amount
end

function characterMeta:isMedicalExact(amount)
	return self:getMedical() == amount
end

function characterMeta:isEngExact(amount)
	return self:getEngineering() == amount
end

function characterMeta:isHackExact(amount)
	return self:getHacking() == amount
end
-- HUD DOWN BELOW

if (CLIENT) then
	local scaleh = math.Clamp(ScrH() / 1080, 0.1, 1)
	local scalew = math.Clamp(ScrH() / 1080, 0.1, 1)
	local teamColor
	function PLUGIN:HUDPaint()
		if (LocalPlayer():getChar()) then
			draw.DrawText("Name : " .. LocalPlayer():GetName(), cDermaLarge, scalew * 50, scaleh * 180, Color( 255, 255, 255, 255 ), TEXT_ALIGN_LEFT )
			draw.DrawText("Accuracy : " .. LocalPlayer():getChar():getAcc(), cDermaLarge, scalew * 50, scaleh * 200, Color( 255, 255, 255, 255 ), TEXT_ALIGN_LEFT )
			draw.DrawText("CQC : " .. LocalPlayer():getChar():getLevel(), cDermaLarge, scalew * 50, scaleh * 220, Color( 255, 255, 255, 255 ), TEXT_ALIGN_LEFT )
			draw.DrawText("Engineering : " .. LocalPlayer():getChar():getEngineering(), cDermaLarge, scalew * 50, scaleh * 240, Color( 255, 255, 255, 255 ), TEXT_ALIGN_LEFT )
			draw.DrawText("Hacking : " .. LocalPlayer():getChar():getHacking(), cDermaLarge, scalew * 50, scaleh * 260, Color( 255, 255, 255, 255 ), TEXT_ALIGN_LEFT )
			draw.DrawText("Medical : " .. LocalPlayer():getChar():getMedical(), cDermaLarge, scalew * 50, scaleh * 280, Color( 255, 255, 255, 255 ), TEXT_ALIGN_LEFT )
			draw.DrawText("Science : " .. LocalPlayer():getChar():getScience(), cDermaLarge, scalew * 50, scaleh * 300, Color( 255, 255, 255, 255 ), TEXT_ALIGN_LEFT )
		end
	end	

else 

-- Server realm

	function characterMeta:setXP(amount, char)
		char:setData("charXP", amount, false, player.GetAll())
	end

    function characterMeta:setMedXP(amount, char)
        char:setData("MedXP", amount, false, player.GetAll())
    end

    function characterMeta:setAccXP(amount, char)
        char:setData("AccXP", amount, false, player.GetAll())
    end
   
    function characterMeta:setEngXP(amount, char)
        char:setData("EngXP", amount, false, player.GetAll())
    end
   
    function characterMeta:setHackXP(amount, char)
        char:setData("HackXP", amount, false, player.GetAll())
    end

    function characterMeta:setSciXP(amount, char)
        char:setData("SciXP", amount, false, player.GetAll())
    end

	function characterMeta:giveXP(amount, char, ply)
		if (IsValid(ply)) then
			local plyLvl = char:getLevel()

			char:setData("charXP", (char:getData("charXP") or 1) + amount, false, player.GetAll())

			if plyLvl < char:getLevel() then
				ply:notify("Level up!")
			end

		else
			char:setData("charXP", (char:getData("charXP") or 1) + amount, false, player.GetAll())
		end
	end

	function characterMeta:giveMED(amount, char, ply)
		if (IsValid(ply)) then
			local plyLvl = char:getMedical()

			char:setData("MedXP", (char:getData("MedXP") or 1) + amount, false, player.GetAll())

			if plyLvl < char:getMedical() then
				ply:notify("Level up!")
			end

		else
			char:setData("medXP", (char:getData("MedXP") or 1) + amount, false, player.GetAll())
		end
	end

		function characterMeta:giveSCI(amount, char, ply)
		if (IsValid(ply)) then
			local plyLvl = char:getScience()

			char:setData("SciXP", (char:getData("SciXP") or 1) + amount, false, player.GetAll())

			if plyLvl < char:getScience() then
				ply:notify("Level up!")
			end

		else
			char:setData("SciXP", (char:getData("SciXP") or 1) + amount, false, player.GetAll())
		end
	end

		function characterMeta:givENG(amount, char, ply)
		if (IsValid(ply)) then
			local plyLvl = char:getEngineering()

			char:setData("EngXP", (char:getData("EngXP") or 1) + amount, false, player.GetAll())

			if plyLvl < char:getEngineering() then
				ply:notify("Level up!")
			end

		else
			char:setData("EngXP", (char:getData("EngXP") or 1) + amount, false, player.GetAll())
		end
	end

	function characterMeta:giveHACK(amount, char, ply)
		if (IsValid(ply)) then
			local plyLvl = char:getHacking()

			char:setData("HackXP", (char:getData("HackXP") or 1) + amount, false, player.GetAll())

			if plyLvl < char:getScience() then
				ply:notify("Level up!")
			end

		else
			char:setData("HackXP", (char:getData("HackXP") or 1) + amount, false, player.GetAll())
		end
	end

	function characterMeta:giveACC(amount, char, ply)
		if (IsValid(ply)) then
			local plyLvl = char:getAcc()

			char:setData("AccXP", (char:getData("AccXP") or 1) + amount, false, player.GetAll())

			if plyLvl < char:getScience() then
				ply:notify("Level up!")
			end

		else
			char:setData("AccXP", (char:getData("AccXP") or 1) + amount, false, player.GetAll())
		end
	end
end
