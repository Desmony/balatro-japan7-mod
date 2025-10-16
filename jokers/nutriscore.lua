SMODS.Joker{ --Nutriscore
    key = "nutriscore",
    config = {
        extra = {
            number_non_enhanced_cards = #(G.playing_cards or {})
        }
    },
    loc_txt = {
        ['name'] = 'Nutriscore',
        ['text'] = {
            [1] = '{C:red}+1 {}Mult for each non-enhanced card in your deck.',
            [2] = '{C:inactive}(Currently {}{C:red}+#1#{} {C:inactive}Mult){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
        y = 1
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
        
        return {vars = {card.ability.extra.number_non_enhanced_cards}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
                --local number_non_enhanced_cards_value = card.ability.extra.number_non_enhanced_cards
                card.ability.extra.number_non_enhanced_cards = (function() local count = 0; for _, card in ipairs(G.playing_cards or {}) do if not next(SMODS.get_enhancements(card)) then count = count + 1 end end; return count end)()
                return {
                    mult = card.ability.extra.number_non_enhanced_cards
                }
        end
        if (context.remove_playing_cards) or (context.buying_card and context.card.config.center.key == self.key and context.cardarea == G.jokers) or (context.playing_card_added) or (context.using_consumeable) or (context.setting_blind) then
                --local number_non_enhanced_cards_value = card.ability.extra.number_non_enhanced_cards
                return {
                    func = function()
                    card.ability.extra.number_non_enhanced_cards = (function() local count = 0; for _, card in ipairs(G.playing_cards or {}) do if not next(SMODS.get_enhancements(card)) then count = count + 1 end end; return count end)()
                    return true
                    end,
                    message = "Change in alimentation"
                }
        end
    end
}