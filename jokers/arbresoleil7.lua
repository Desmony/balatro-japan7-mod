SMODS.Joker{ --Arbre Soleil 7
    name = "Arbre Soleil 7",
    key = "arbresoleil7",
    config = {
        extra = {
            odds = 2,
            odds2 = 1,
            Tarot = 0,
            c_sun = 0,
            c_world = 0,
            c_lovers = 0
        }
    },
    loc_txt = {
        ['name'] = 'Arbre Soleil 7',
        ['text'] = {
            [1] = '{C:green}#1# in #2#{} chance for each played {C:attention}7{}',
            [2] = 'to create a {C:tarot}Sun{} card when scored.',
            [3] = '{C:green}#1# in #2#{} chance for each played {C:attention}7{}',
            [4] = 'to create a {C:tarot}World{} card when scored.',
            [5] = '{C:green}0 in 2{} chance for each played {C:attention}7{}',
            [6] = 'to create a {C:tarot}Lovers{} card when scored.',
            [7] = '{C:inactive}(Must have room){}'
        }
    },
    pos = {
        x = 1,
        y = 1
    },
    cost = 4,
    rarity = 1,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        return {vars = {G.GAME.probabilities.normal, card.ability.extra.odds, card.ability.extra.odds2, card.ability.extra.Tarot}}
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and not context.blueprint then
            if context.other_card:get_id() == 7 then
                if pseudorandom('group_0_49fa6d42') < G.GAME.probabilities.normal / card.ability.extra.odds then
                        local created_consumable = false
                if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                    created_consumable = true
                    G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            local consumable_card = create_card('Tarot', G.consumeables, nil, nil, nil, nil, 'c_sun')
                            consumable_card:add_to_deck()
                            G.consumeables:emplace(consumable_card)
                            G.GAME.consumeable_buffer = 0
                            return true
                        end
                    }))
                end
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = created_consumable and localize('k_plus_tarot') or nil, colour = G.C.PURPLE})
                    end
                if pseudorandom('group_1_d77c10d8') < G.GAME.probabilities.normal / card.ability.extra.odds then
                        local created_consumable = false
                if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                    created_consumable = true
                    G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            local consumable_card = create_card('Tarot', G.consumeables, nil, nil, nil, nil, 'c_world')
                            consumable_card:add_to_deck()
                            G.consumeables:emplace(consumable_card)
                            G.GAME.consumeable_buffer = 0
                            return true
                        end
                    }))
                end
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = created_consumable and localize('k_plus_tarot') or nil, colour = G.C.PURPLE})
                    end
                if pseudorandom('group_2_93b1d2ba') < G.GAME.probabilities.normal * 0 / card.ability.extra.odds2 then
                        local created_consumable = false
                if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                    created_consumable = true
                    G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            local consumable_card = create_card('Tarot', G.consumeables, nil, nil, nil, nil, 'c_lovers')
                            consumable_card:add_to_deck()
                            G.consumeables:emplace(consumable_card)
                            G.GAME.consumeable_buffer = 0
                            return true
                        end
                    }))
                end
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = created_consumable and localize('k_plus_tarot') or nil, colour = G.C.PURPLE})
                    end
            end
        end
    end
}