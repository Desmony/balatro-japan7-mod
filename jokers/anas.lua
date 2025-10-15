SMODS.Joker{ --Anas
    name = "Anas",
    key = "anas",
    config = {
        extra = {
            score_hand = 0,
            Tarot = 0,
            c_fool = 0
        }
    },
    loc_txt = {
        ['name'] = 'Anas',
        ['text'] = {
            [1] = 'Creates a {C:purple}Fool{} consumable',
            [2] = 'if the total of scoring cards is 14.'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 3,
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
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["japan7mod_jokers"] = true },

    loc_vars = function(self, info_queue, card)
        local info_queue_0 = G.P_CENTERS["c_fool"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"c_fool\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        return {vars = {}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.before then
            card.ability.extra.score_hand = 0
        end
        if context.individual and context.cardarea == G.play and not context.blueprint then
            if context.other_card:get_id() == 14 then
                card.ability.extra.score_hand = (card.ability.extra.score_hand) + 11
            elseif context.other_card:get_id() == 13 then
                card.ability.extra.score_hand = (card.ability.extra.score_hand) + 10
            elseif context.other_card:get_id() == 12 then
                card.ability.extra.score_hand = (card.ability.extra.score_hand) + 10
            elseif context.other_card:get_id() == 11 then
                card.ability.extra.score_hand = (card.ability.extra.score_hand) + 10
            elseif context.other_card:get_id() == 10 then
                card.ability.extra.score_hand = (card.ability.extra.score_hand) + 10
            elseif context.other_card:get_id() == 9 then
                card.ability.extra.score_hand = (card.ability.extra.score_hand) + 9
            elseif context.other_card:get_id() == 8 then
                card.ability.extra.score_hand = (card.ability.extra.score_hand) + 8
            elseif context.other_card:get_id() == 7 then
                card.ability.extra.score_hand = (card.ability.extra.score_hand) + 7
            elseif context.other_card:get_id() == 6 then
                card.ability.extra.score_hand = (card.ability.extra.score_hand) + 6
            elseif context.other_card:get_id() == 5 then
                card.ability.extra.score_hand = (card.ability.extra.score_hand) + 5
            elseif context.other_card:get_id() == 4 then
                card.ability.extra.score_hand = (card.ability.extra.score_hand) + 4
            elseif context.other_card:get_id() == 3 then
                card.ability.extra.score_hand = (card.ability.extra.score_hand) + 3
            elseif context.other_card:get_id() == 2 then
                card.ability.extra.score_hand = (card.ability.extra.score_hand) + 2
            end
        end
        if context.after and context.cardarea == G.jokers then
            if (card.ability.extra.score_hand or 0) == 14 then
                return {
                    func = function()local created_consumable = false
                if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                    created_consumable = true
                    G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            local consumable_card = create_card('Tarot', G.consumeables, nil, nil, nil, nil, 'c_fool')
                            consumable_card:add_to_deck()
                            G.consumeables:emplace(consumable_card)
                            G.GAME.consumeable_buffer = 0
                            return true
                        end
                    }))
                end
                    if created_consumable then
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Have you heard of the critically acclaimed MMORPG Final Fantasy XIV?", colour = G.C.PURPLE})
                    end
                    return true
                end
                }
            end
        end
    end
}