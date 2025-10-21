SMODS.Joker{ --Kakegurui
    key = "kakegurui",
    config = {
        extra = {
            repetitions = 2,
            odds = 5,
            blind_size = 1.2
        }
    },
    loc_txt = {
        ['name'] = 'Kakegurui',
        ['text'] = {
            [1] = 'Retriggers {C:attention}Lucky{} cards',
            [2] = '2 additional times.',
            [3] = '{C:green}#1# in #2#{} chance to increase',
            [4] = 'blind requirement by 20%.'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
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
    enhancement_gate = 'm_lucky',
    atlas = 'CustomJokers',
    pools = { ["japan7mod_jokers"] = true },

    loc_vars = function(self, info_queue, card)
        
        local info_queue_0 = G.P_CENTERS["m_lucky"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"m_lucky\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_japan7mo_kakegurui') 
        return {vars = {new_numerator, new_denominator}}
    end,

    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play  then
            if SMODS.get_enhancements(context.other_card)["m_lucky"] == true then
                return {
                    repetitions = card.ability.extra.repetitions,
                    message = "Gambling time!"
                }
            end
        end
        if context.cardarea == G.jokers and context.joker_main  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_1aff8f0c', 1, card.ability.extra.odds, 'j_japan7mo_kakegurui', false) then
              SMODS.calculate_effect({func = function()
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Raising the stakes!", colour = G.C.GREEN})
                G.GAME.blind.chips = G.GAME.blind.chips * card.ability.extra.blind_size
                G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
                G.HUD_blind:recalculate()
                return true
            end}, card)
          end
            end
        end
    end
}