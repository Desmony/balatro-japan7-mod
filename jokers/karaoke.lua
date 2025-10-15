SMODS.Joker{ --Karaoke
    name = "Karaoke",
    key = "karaoke",
    config = {
        extra = {
            mult = 1
        }
    },
    loc_txt = {
        ['name'] = 'Karaoke',
        ['text'] = {
            [1] = 'This joker gains {X:red,C:white}X0.5{} Mult',
            [2] = 'if {C:attention}poker hand{} is a {C:attention}#2#{}.',
            [3] = 'The required poker hand changes every hand played.',
            [4] = 'Resets when defeating a boss blind.',
            [5] = '{C:inactive}(Currently {X:red,C:white}X#1#{}{C:inactive} Mult){}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 4,
        y = 1
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
        return {vars = {card.ability.extra.mult, localize((G.GAME.current_round.poker_hand_to_do_hand or 'High Card'), 'poker_hands')}}
    end,

    set_ability = function(self, card, initial)
        G.GAME.current_round.poker_hand_to_do_hand = 'High Card'
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main then
            if context.scoring_name == G.GAME.current_round.poker_hand_to_do_hand then
                card.ability.extra.mult = (card.ability.extra.mult) + 0.5
                local poker_hand_to_do_hands = {}
                for handname, _ in pairs(G.GAME.hands) do
                    if G.GAME.hands[handname].visible then
                        poker_hand_to_do_hands[#poker_hand_to_do_hands + 1] = handname
                    end
                end
                if poker_hand_to_do_hands[1] then
                    G.GAME.current_round.poker_hand_to_do_hand = pseudorandom_element(poker_hand_to_do_hands, pseudoseed('poker_hand_to_do' .. G.GAME.round_resets.ante))
                end
                return {
                    message = "Good singing!",
                    extra = {
                        Xmult = card.ability.extra.mult,
                        extra = {
                            message = "New lyrics",
                            colour = G.C.FILTER
                        }
                        }
                }
            else
                local poker_hand_to_do_hands = {}
                for handname, _ in pairs(G.GAME.hands) do
                    if G.GAME.hands[handname].visible then
                        poker_hand_to_do_hands[#poker_hand_to_do_hands + 1] = handname
                    end
                end
                if poker_hand_to_do_hands[1] then
                    G.GAME.current_round.poker_hand_to_do_hand = pseudorandom_element(poker_hand_to_do_hands, pseudoseed('poker_hand_to_do' .. G.GAME.round_resets.ante))
                end
                return {
                    Xmult = card.ability.extra.mult,
                    extra = {
                        message = "New lyrics",
                        colour = G.C.FILTER
                        }
                }
            end
        end
        if context.end_of_round and context.main_eval and G.GAME.blind.boss and not context.blueprint then
                return {
                    func = function()
                    card.ability.extra.mult = 1
                    return true
                end,
                    message = "New song"
                }
        end
    end
}