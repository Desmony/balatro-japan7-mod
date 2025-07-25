SMODS.Joker{ --Startup flottante
    name = "Startup flottante",
    key = "startupflottante",
    config = {
        extra = {
            chips = 0
        }
    },
    loc_txt = {
        ['name'] = 'Startup flottante',
        ['text'] = {
            [1] = 'This joker gains {C:blue}+1-25{} Chips when selling a {C:attention}Card{}',
            [2] = '{C:inactive}(Currently {C:blue}+#1#{} Chips){}'
        }
    },
    pos = {
        x = 5,
        y = 1
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.chips}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main then
                return {
                    chips = card.ability.extra.chips
                }
        end
        if context.selling_card and not context.blueprint then
                return {
                    func = function()
                    card.ability.extra.chips = (card.ability.extra.chips) + pseudorandom('chips_5cedf832', 1, 10)
                    return true
                end,
                    message = "Upgraded!"
                }
        end
    end
}