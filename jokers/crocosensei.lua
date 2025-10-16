SMODS.Joker{ --Croco-sensei
    key = "crocosensei",
    config = {
        extra = {
            nb_chips = 0,
            jokercount = 0
        }
    },
    loc_txt = {
        ['name'] = 'Croco-sensei',
        ['text'] = {
            [1] = 'Gains {C:blue}+10{} Chips for each other',
            [2] = 'joker at the end of the round.',
            [3] = '{C:inactive}(Currently {}{C:blue}+#1#{} {C:inactive}Chips){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 3
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["japan7mod_jokers"] = true },

    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.nb_chips}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
                return {
                    chips = card.ability.extra.nb_chips
                }
        end
        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
                return {
                    func = function()
                    card.ability.extra.nb_chips = (card.ability.extra.nb_chips) + ((#(G.jokers and G.jokers.cards or {})) - 1) * 10
                    return true
                end,
                     message = "See you next class!"
                }
        end
    end
}