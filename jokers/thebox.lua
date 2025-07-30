SMODS.Joker{ --The Box
    name = "The Box",
    key = "thebox",
    config = {
        extra = {
            mult = 15,
            mult2 = -5,
            finalmult = 0
        }
    },
    loc_txt = {
        ['name'] = 'The Box',
        ['text'] = {
            [1] = '{C:red}+15{} Mult if played hand is now',
            [2] = 'your most played hand.',
            [3] = '{C:red}-5{} Mult otherwise.'
        }
    },
    pos = {
        x = 5,
        y = 0
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        return {vars = {}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.before then
            if (function()
                local current_played = G.GAME.hands[context.scoring_name].played or 0
                for handname, values in pairs(G.GAME.hands) do
                    if handname ~= context.scoring_name and values.played > current_played and values.visible then
                        return false
                    end
                end
                return true
            end)() then
            card.ability.extra.finalmult = card.ability.extra.mult
            else
                card.ability.extra.finalmult = card.ability.extra.mult2
            end
        end
        if context.cardarea == G.jokers and context.joker_main then
                return {
                    mult = card.ability.extra.finalmult
                }
        end
    end
}