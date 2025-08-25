SMODS.Joker{ --#images-bidons
    name = "images-bidons",
    key = "imagesbidons",
    config = {
        extra = {
            jokercount = 0,
            nb_jokers = 1,
            odds = 20
        }
    },
    loc_txt = {
        ['name'] = 'images-bidons',
        ['text'] = {
            [1] = '{C:blue}+50{} Chips for each {C:attention}Joker{} card.',
            [2] = '{C:green}#1# in 20{} chance of {C:red}dying of cringe{}',
            [3] = 'for each {C:attention}Joker{} at the end of the round.',
            [4] = '{C:inactive}(Currently {C:blue}+#2#{}{C:inactive} Chips and {C:green}#3# in 20{}{C:inactive}){}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 0,
        y = 1
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = false,
	perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
	return {vars = {G.GAME.probabilities.normal, (G.jokers and G.jokers.cards and #G.jokers.cards or 0)*50, (G.jokers and G.jokers.cards and #G.jokers.cards or 0)*(G.GAME.probabilities.normal), card.ability.extra.jokercount}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main then
                return {
                    chips = (#G.jokers.cards) * 50
                }
        end
        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            if true then
                return {
                    func = function()
                    card.ability.extra.nb_jokers = #G.jokers.cards
                    return true
                end
                ,
                    func = function()
                        if pseudorandom('group_0_0ec40cac') < G.GAME.probabilities.normal * (#G.jokers.cards) / card.ability.extra.odds then
                        SMODS.calculate_effect({func = function()
                card:start_dissolve()
                return true
            end}, card)
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Cringe", colour = G.C.RED})
                    end
                        return true
                    end
                }
            end
        end
    end
}