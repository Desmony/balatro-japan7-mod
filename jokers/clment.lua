SMODS.Joker{ --Clément
    name = "Zogogo",
    key = "clment",
    config = {
        extra = {
            clement_variable = 0,
            nb_hands_played = 0
        }
    },
    loc_txt = {
        ['name'] = 'Zogogo',
        ['text'] = {
            [1] = 'This joker gains {C:red}+9{} Mult',
            [2] = 'when you finish a round in one hand.',
            [3] = '{C:inactive}(Currently {C:red}+#1#{}{C:inactive} Mult){}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 2,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.clement_variable}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main then
                card.ability.extra.nb_hands_played = (card.ability.extra.nb_hands_played) + 1
                return {
                    mult = card.ability.extra.clement_variable
                }
        end
        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            if card.ability.extra.nb_hands_played == 1 then
                return {
                    func = function()
                    card.ability.extra.clement_variable = (card.ability.extra.clement_variable) + 9
                    return true
                end,
                    message = "One clap!",
                    extra = {
                        func = function()
                    card.ability.extra.nb_hands_played = 0
                    return true
                end,
                        colour = G.C.BLUE
                        }
                }
            else
                return {
                    func = function()
                    card.ability.extra.nb_hands_played = 0
                    return true
                end
                }
            end
        end
    end
}