SMODS.Joker{ --MKV Cocktail
    name = "MKV Cocktail",
    key = "mkvcocktail",
    config = {
        extra = {
            multvar = 1,
            nbrounds = 7
        }
    },
    loc_txt = {
        ['name'] = 'MKV Cocktail',
        ['text'] = {
            [1] = 'This joker gains {X:red,C:white}x0.5{} at the end of the round.',
            [2] = '{C:red}Self-destructs{} after {C:attention}#2#{} rounds.',
            [3] = '{C:inactive}(Currently {X:red,C:white}X#1#{}{C:inactive} Mult)'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 6,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = false,
	perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["japan7mod_jokers"] = true, ["japan7mod_food"] = true},

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.multvar, card.ability.extra.nbrounds}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main then
                return {
                    Xmult = card.ability.extra.multvar
                }
        end
        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            if (card.ability.extra.nbrounds or 0) == 1 then
                return {
                    func = function()
                card:start_dissolve()
                return true
            end,
                    message = "The glass is finally empty"
                }
            else
                return {
                    func = function()
                    card.ability.extra.nbrounds = math.max(0, (card.ability.extra.nbrounds) - 1)
                    return true
                end,
                    message = "Consume",
                    extra = {
                        func = function()
                    card.ability.extra.multvar = (card.ability.extra.multvar) + 0.5
                    return true
                end,
                        colour = G.C.GREEN
                        }
                }
            end
        end
    end
}