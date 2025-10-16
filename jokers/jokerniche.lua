SMODS.Joker{ --Joker niche
    key = "jokerniche",
    config = {
        extra = {
            nb_cards_sold = 0,
            n = 0
        }
    },
    loc_txt = {
        ['name'] = 'Joker niche',
        ['text'] = {
            [1] = 'Creates a {C:spectral}Soul{} card after selling {C:attention}24{} cards.',
            [2] = '{C:inactive}(Currently {}{C:attention}#1#{}{C:inactive}/24){}',
            [3] = '{C:inactive}(Must have room){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
        y = 2
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 10,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["apan7mod_jokers"] = true },

    loc_vars = function(self, info_queue, card)
        local info_queue_0 = G.P_CENTERS["c_soul"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"c_soul\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        return {vars = {card.ability.extra.nb_cards_sold}}
    end,

    calculate = function(self, card, context)
        if context.selling_card  and not context.blueprint then
            if (card.ability.extra.nb_cards_sold or 0) == 23 then
                return {
                    func = function()
                    card.ability.extra.nb_cards_sold = 0
                    return true
                end,
                    extra = {
                        func = function()
      
    for i = 1, math.min(1, G.consumeables.config.card_limit - #G.consumeables.cards) do
            G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
            play_sound('timpani')
            SMODS.add_card({ set = 'Spectral', key = 'c_soul'})                            
            card:juice_up(0.3, 0.5)
            return true
        end
        }))
    end
    delay(0.6)

                    if created_consumable then
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Reincarnation", colour = G.C.SECONDARY_SET.Spectral})
                    end
                    return true
                  end,
                        colour = G.C.SECONDARY_SET.Spectral
                        }
                }
            else
                return {
                    func = function()
                    card.ability.extra.nb_cards_sold = (card.ability.extra.nb_cards_sold) + 1
                    return true
                end
                }
            end
        end
    end
}