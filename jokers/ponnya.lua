SMODS.Joker{ --Pon-nya!
    name = "Pon-nya!",
    key = "ponnya",
    config = {
        extra = {
            mult = 0
        }
    },
    loc_txt = {
        ['name'] = 'Pon-nya!',
        ['text'] = {
            [1] = 'This Joker gains {C:red}+3{} Mult if played hand contains a {C:attention}Three of a Kind{}',
            [2] = '{C:inactive}(Currently {C:red}+#1#{} Mult){}'
        }
    },
    pos = {
        x = 8,
        y = 0
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.mult}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.before then
            if next(context.poker_hands["Three of a Kind"]) then
                card.ability.extra.mult = (card.ability.extra.mult) + 3
                return {
                    message = "Pon-nya!"
                }
            end
        end
        if context.cardarea == G.jokers and context.joker_main then
                return {
                    mult = card.ability.extra.mult
                }
        end
    end
}