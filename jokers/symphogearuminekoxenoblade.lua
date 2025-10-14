SMODS.Joker{ --Symphogear Umineko Xenoblade
    name = "Symphogear Umineko Xenoblade",
    key = "symphogearuminekoxenoblade",
    config = {
        extra = {
            Xmult = 1.5,
            dollars = 3
        }
    },
    loc_txt = {
        ['name'] = 'Symphogear Umineko Xenoblade',
        ['text'] = {
            [1] = 'Each {C:attention}Queen{} of {C:spades}Spade{} held',
            [2] = 'in hand gives {X:red,C:white}x1.5{} Mult.',
            [3] = 'Each {C:attention}Queen{} of {C:spades}Spade{} held',
            [4] = 'in hand at the end of the round gives {C:gold}$3{}.'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 9,
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
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.hand and not context.end_of_round  then
            if (context.other_card:get_id() == 12 and context.other_card:is_suit("Spades")) then
                return {
                    Xmult = card.ability.extra.Xmult,
                    message = "Radiant Force!"
                }
            end
        end
        if context.cardarea == G.hand and context.end_of_round  then
            if (context.other_card:get_id() == 12 and context.other_card:is_suit("Spades")) then
                return {
                    dollars = card.ability.extra.dollars,
                    message = "ahaha.wav"
                }
            end
        end
    end
}