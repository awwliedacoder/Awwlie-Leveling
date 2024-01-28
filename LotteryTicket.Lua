ITEM.name = "Lottery Ticket"
ITEM.desc = "A Lottey Ticket"
ITEM.model = "models/props_lab/clipboard.mdl"
ITEM.price = 300
ITEM.width = 2
ITEM.height = 1
-- Item functions
ITEM.functions._use = { 
    name = "Check",
    tip = "checkTip",
    icon = "icon16/coins.png",
    onRun = function(item)
        local client = item.player
        local char = client:getChar()

        if math.random(100) > 50 then
            client:notify("You won!")
            char:giveMoney(1000)
        else
            client:notify("You have not won this time")
        end

        return true
    end
}
