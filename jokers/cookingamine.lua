SMODS.Joker{ --Cooking Amine
    key = "cookingamine",
    config = {
        extra = {
            number_rounds_remaining = 2,
            japan7mod_food = 0,
            respect = 0
        }
    },
    loc_txt = {
        ['name'] = 'Cooking Amine',
        ['text'] = {
            [1] = 'Generate a {C:attention}Food{} joker every {C:attention}2{} rounds.',
            [2] = '{C:inactive}(Must have room){}',
            [3] = '{C:inactive}(Rounds remaining: {}{C:attention}#1#{}{C:inactive}){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 3
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
        
        return {vars = {card.ability.extra.number_rounds_remaining}}
    end,

    calculate = function(self, card, context)
        if context.setting_blind  then
            if (card.ability.extra.number_rounds_remaining or 0) == 0 then
                return {
                    func = function()
                    card.ability.extra.number_rounds_remaining = 2
                    return true
                end,
                    extra = {
                        func = function()
            local created_joker = false
    if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
        created_joker = true
        G.GAME.joker_buffer = G.GAME.joker_buffer + 1
            G.E_MANAGER:add_event(Event({
                func = function()
                    local joker_card = SMODS.add_card({ set = 'japan7mod_food' })
                    if joker_card then
                        
                        
                    end
                    G.GAME.joker_buffer = 0
                    return true
                end
            }))
            end
            if created_joker then
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Cooking!", colour = G.C.BLUE})
            end
            return true
        end,
                        colour = G.C.BLUE
                        }
                }
            end
        end
        if context.end_of_round and context.game_over == false and context.main_eval  then
                return {
                    func = function()
                    card.ability.extra.number_rounds_remaining = math.max(0, (card.ability.extra.number_rounds_remaining) - 1)
                    return true
                end
                }
        end
    end
}