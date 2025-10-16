SMODS.Joker{ --Pictarine
    key = "pictarine",
    config = {
        extra = {
            odds = 1
        }
    },
    loc_txt = {
        ['name'] = 'Pictarine',
        ['text'] = {
            [1] = 'Add {C:dark_edition}Negative{} to a random joker',
            [2] = 'when defeating the {C:attention}Boss Blind{}.'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
        y = 2
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
    pools = { ["japan7mod_jokers"] = true },

    calculate = function(self, card, context)
        if context.end_of_round and context.main_eval and G.GAME.blind.boss  then
            if pseudorandom('pictarine') < G.GAME.probabilities.normal / card.ability.extra.odds then
            local editionless_jokers = SMODS.Edition:get_edition_cards(G.jokers, true)
            local eligible_card = pseudorandom_element(editionless_jokers, pseudoseed('pictarine'))
                if eligible_card then
                    eligible_card:set_edition("e_negative", true)
                    check_for_unlock({ type = 'have_edition' })
                end
            end
        end
    end
}