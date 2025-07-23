SMODS.Joker{ --NAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM
    name = "NAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM",
    key = "naaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaam",
    config = {
        extra = {
            mult = 1
        }
    },
    loc_txt = {
        ['name'] = 'NAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM',
        ['text'] = {
            [1] = 'This Joker gains {X:red,C:white}X0.5{} Mult when using a {C:attention}Wheel of Fortune{}',
            [2] = '{C:inactive}(Currently {X:red,C:white}X#1#{} Mult){}'
        }
    },
    pos = {
        x = 7,
        y = 0
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.mult}}
    end,

    calculate = function(self, card, context)
        if context.using_consumeable and not context.blueprint then
            if context.consumeable and context.consumeable.ability.set == 'Tarot' and context.consumeable.config.center.key == 'c_wheel_of_fortune' then
                return {
                    func = function()
                    card.ability.extra.mult = (card.ability.extra.mult) + 0.5
                    return true
                end,
                    message = "Naaaaaaaaaaaaaaam!"
                }
            end
        end
        if context.cardarea == G.jokers and context.joker_main then
                return {
                    Xmult = card.ability.extra.mult
                }
        end
    end
}