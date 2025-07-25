SMODS.Joker{ --Le Maillon Faible
    name = "Le Maillon Faible",
    key = "lemaillonfaible",
    config = {
        extra = {
            lowestrankinhand = 0,
            odds = 9,
		dollars = 5
        }
    },
    loc_txt = {
        ['name'] = 'Le Maillon Faible',
        ['text'] = {
            [1] = 'Destroys the lowest ranked cards in your played hand if they score.',
            [2] = '{C:green}#1# in #2#{} chance of earning {C:gold}$5{} when destroying those cards.'
        }
    },
    pos = {
        x = 3,
        y = 1
    },
    cost = 7,
    rarity = 3,
    blueprint_compat = false,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        return {vars = {G.GAME.probabilities.normal, card.ability.extra.odds, card.ability.extra.lowestrankinhand}}
    end,

    calculate = function(self, card, context)
        if context.destroy_card and context.destroy_card.should_destroy and not context.blueprint then
            return { remove = true }
        end
        if context.individual and context.cardarea == G.play and not context.blueprint then
		card.ability.extra.lowestrankinhand = (function() local min = 14; for _, card in ipairs(G.play.cards) do if card.base.id < min then min = card.base.id end end; return min end)()
            context.other_card.should_destroy = false
            if context.other_card:get_id() == card.ability.extra.lowestrankinhand then
                context.other_card.should_destroy = true
                return {
                    message = "Vous êtes le maillon faible."
                ,
                    func = function()
                        if pseudorandom('group_0_a80c8962') < G.GAME.probabilities.normal / card.ability.extra.odds then
                        SMODS.calculate_effect({dollars = card.ability.extra.dollars}, card)
                    end
                        return true
                    end
                }
            end
        end
    end
}