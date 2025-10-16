SMODS.Joker{ --Janken Invitational
    key = "jankeninvitational",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Janken Invitational',
        ['text'] = {
            [1] = 'Scored {C:attention}Stone{}, {C:attention}Lucky{} and {C:attention}Steel{} cards',
            [2] = 'receives a random seal if they don\'t have one.'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
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

    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_CENTERS["m_stone"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"m_stone\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        local info_queue_1 = G.P_CENTERS["m_steel"]
        if info_queue_1 then
            info_queue[#info_queue + 1] = info_queue_1
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"m_steel\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        local info_queue_2 = G.P_CENTERS["m_lucky"]
        if info_queue_2 then
            info_queue[#info_queue + 1] = info_queue_2
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"m_lucky\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        return {vars = {}}
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if (SMODS.get_enhancements(context.other_card)["m_stone"] == true or SMODS.get_enhancements(context.other_card)["m_lucky"] == true or SMODS.get_enhancements(context.other_card)["m_steel"] == true and not (context.other_card.seal ~= nil)) then
                local random_seal = SMODS.poll_seal({mod = 10, guaranteed = true})
                if random_seal then
                    context.other_card:set_seal(random_seal, true)
                end
                return {
                    message = "Card Modified!"
                }
            end
        end
    end
}