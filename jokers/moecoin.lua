SMODS.Joker{ --Moecoin
    key = "moecoin",
    config = {
        extra = {
            return_on_investment = 1
        }
    },
    loc_txt = {
        ['name'] = 'Moecoin',
        ['text'] = {
            [1] = 'Earn {C:money}$#1#{} when buying a card.',
            [2] = 'Bonus increases by {C:money}$1{} when',
            [3] = '{C:attention}Boss Blind{} is defeated.'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 2
    },
    display_size = {
        w = 71 * 1, 
        h = 69 * 1
    },
    pixel_size = {
        w = 71 * 1, 
        h = 69 * 1
    },
    cost = 7,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["japan7mod_jokers"] = true },

    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.return_on_investment}}
    end,

    calculate = function(self, card, context)
        if context.buying_card  then
                return {
                    dollars = card.ability.extra.return_on_investment
                }
        end
        if context.end_of_round and context.main_eval and G.GAME.blind.boss  then
                return {
                    func = function()
                    card.ability.extra.return_on_investment = (card.ability.extra.return_on_investment) + 1
                    return true
                end,
                    message = "Inflation"
                }
        end
    end
}