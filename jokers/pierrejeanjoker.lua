SMODS.Joker{ --Pierre Jeanjoker
    name = "Pierre Jeanjoker",
    key = "pierrejeanjoker",
    config = {
        extra = {
            pluschips = 0,
            chips2 = -50
        }
    },
    loc_txt = {
        ['name'] = 'Pierre Jeanjoker',
        ['text'] = {
            [1] = 'When a {C:attention}Stone{} Card is scored, it is',
            [2] = 'destroyed and this Joker gains {C:blue}+25{} Chips.',
            [3] = '{C:attention}Stone{} Cards held in hand provides {C:blue}-50{} Chips.',
            [4] = '{C:inactive}(Currently provides {C:blue}+#1#{}{C:inactive} Chips){}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 4,
        y = 0
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
    enhancement_gate = 'm_stone',
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.pluschips}}
    end,

    calculate = function(self, card, context)
        if context.destroy_card and context.destroy_card.should_destroy and not context.blueprint then
            return { remove = true }
        end
        if context.individual and context.cardarea == G.play and not context.blueprint then
            if SMODS.get_enhancements(context.other_card)["m_stone"] == true then
                context.other_card.should_destroy = true
                card.ability.extra.pluschips = (card.ability.extra.pluschips) + 25
                return {
                    message = "Jeanjean take"
                }
            end
        end
        if context.cardarea == G.jokers and context.joker_main then
                return {
                    chips = card.ability.extra.pluschips
                }
        end
        if context.individual and context.cardarea == G.hand and not context.end_of_round and not context.blueprint then
            if SMODS.get_enhancements(context.other_card)["m_stone"] == true then
                return {
                    chips = card.ability.extra.chips2
                }
            end
        end
    end
}