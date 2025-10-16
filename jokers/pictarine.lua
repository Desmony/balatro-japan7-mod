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
            [1] = 'Destroy a random joker and',
            [2] = 'add {C:dark_edition}Negative{} to another joker',
            [3] = 'when defeating the {C:attention}Boss Blind{}.',
            [4] = 'Can\'t destroy {C:dark_edition}Negative{} Jokers.'
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
            --Destroy a Joker
            local destructable_jokers = {}
                for i, joker in ipairs(G.jokers.cards) do
                    if joker ~= card and not SMODS.is_eternal(joker) and not joker.getting_sliced and not (joker.edition and joker.edition.negative) then
                        table.insert(destructable_jokers, joker)
                    end
                end
                local target_joker = #destructable_jokers > 0 and pseudorandom_element(destructable_jokers, pseudoseed('destroy_joker')) or nil
                
                if target_joker then
                    target_joker.getting_sliced = true
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            target_joker:start_dissolve({G.C.RED}, nil, 1.6)
                            return true
                        end
                    }))
                    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Destroyed!", colour = G.C.RED})
                end

                -- Adds negative
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