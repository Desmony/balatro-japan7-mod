SMODS.Joker{ --Detective Odrian
    name = "Detective Odrian",
    key = "detectiveodrian",
    config = {
        extra = {
            active_chase = 'j7_no',
            mult = 1
        }
    },
    loc_txt = {
        ['name'] = 'Detective Odrian',
        ['text'] = {
            [1] = 'When a face card is destroyed,',
            [2] = 'Detective Odrian will designate a suspect card.',
            [3] = 'When the suspect card is played,',
            [4] = 'the card will be destroyed and',
            [5] = 'this Joker will gain {X:red,C:white}X1{} Mult.',
            [6] = '{C:inactive}(Current suspect: {C:attention}#4#{}{C:inactive} of {C:attention}#3#{}.',
            [7] = '{C:inactive}Currently investigating: {C:attention}#1#{}.',
            [8] = '{C:inactive}Currently provides {X:red,C:white}X#2#{}{C:inactive} Mult)'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 2,
        y = 1
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 8,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    soul_pos = {
        x = 6,
        y = 1
    },

    loc_vars = function(self, info_queue, card)
        return {vars = {localize(card.ability.extra.active_chase), card.ability.extra.mult, localize((G.GAME.current_round.suit_suspect_card or {}).suit or 'Spades', 'suits_singular'), localize((G.GAME.current_round.rank_suspect_card or {}).rank or 'Ace', 'ranks')}, colours = {G.C.SUITS[(G.GAME.current_round.suit_suspect_card or {}).suit or 'Spades']}}
    end,

    set_ability = function(self, card, initial)
        G.GAME.current_round.suit_suspect_card = { suit = 'Spades' }
        G.GAME.current_round.rank_suspect_card = { rank = 'Ace', id = 14 }
    end,

    calculate = function(self, card, context)
        if context.remove_playing_cards and not context.blueprint then
            if (function()
                for k, removed_card in ipairs(context.removed) do
                    if removed_card:is_face() then
                        return true
                    end
                end
                return false
            end)() then
                if G.playing_cards then
                    local valid_suit_suspect_cards = {}
                    for _, v in ipairs(G.playing_cards) do
                        if not SMODS.has_no_suit(v) then
                            valid_suit_suspect_cards[#valid_suit_suspect_cards + 1] = v
                        end
                    end
                    if valid_suit_suspect_cards[1] then
                        local suit_suspect_card = pseudorandom_element(valid_suit_suspect_cards, pseudoseed('suit_suspect' .. G.GAME.round_resets.ante))
                        G.GAME.current_round.suit_suspect_card.suit = suit_suspect_card.base.suit
                    end
                end
                if G.playing_cards then
                        local valid_rank_suspect_cards = {}
                        for _, v in ipairs(G.playing_cards) do
                            if not SMODS.has_no_rank(v) then
                                valid_rank_suspect_cards[#valid_rank_suspect_cards + 1] = v
                            end
                        end
                        if valid_rank_suspect_cards[1] then
                            local rank_suspect_card = pseudorandom_element(valid_rank_suspect_cards, pseudoseed('rank_suspect' .. G.GAME.round_resets.ante))
                            G.GAME.current_round.rank_suspect_card.rank = rank_suspect_card.base.value
                            G.GAME.current_round.rank_suspect_card.id = rank_suspect_card.base.id
                        end
                    end
                return {
                    func = function()
                    card.ability.extra.active_chase = 'j7_yes'
                    return true
                end,
                    extra = {
                        message = "A new criminal is on the loose",
                        colour = G.C.WHITE
                        }
                }
            end
        end
        if context.destroy_card and context.destroy_card.should_destroy and not context.blueprint then
            return { remove = true }
        end
        if context.individual and context.cardarea == G.play and not context.blueprint then
            
            if ((card.ability.extra.active_chase or 'j7_no') == 'j7_yes' and context.other_card:get_id() == G.GAME.current_round.rank_suspect_card.id and context.other_card:is_suit(G.GAME.current_round.suit_suspect_card.suit)) then
                context.other_card.should_destroy = true
                card.ability.extra.active_chase = 'j7_no'
                card.ability.extra.mult = (card.ability.extra.mult) + 1
                return {
                    message = "The criminal has been arrested!"
                }
            end
        end
        if context.cardarea == G.jokers and context.joker_main then
                return {
                    Xmult = card.ability.extra.mult
                }
        end
    end
}