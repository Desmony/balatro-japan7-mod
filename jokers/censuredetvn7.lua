SMODS.Joker{ --Censure de TVn7
    key = "censuredetvn7",
    config = {
        extra = {
            nb_hands_left = 3,
            Xmult = 3,
            explode = 0
        }
    },
    loc_txt = {
        ['name'] = 'Censure de TVn7',
        ['text'] = {
            [1] = '{X:red,C:white}X3{} Mult. Will destroy itself',
            [2] = 'in {C:attention}#2#{} hands. Played {C:attention}#1#{}',
            [3] = 'increase the countdown by one.',
            [4] = '{C:inactive}(Rank changes every hand){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
        y = 2
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["japan7mod_jokers"] = true },

    loc_vars = function(self, info_queue, card)
        
        return {vars = {localize((G.GAME.current_round.rank_to_achieve_card or {}).rank or 'Ace', 'ranks'), card.ability.extra.nb_hands_left}}
    end,

    set_ability = function(self, card, initial)
        G.GAME.current_round.rank_to_achieve_card = { rank = 'Ace', id = 14 }
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main and not context.blueprint then
                card.ability.extra.nb_hands_left = math.max(0, (card.ability.extra.nb_hands_left) - 1)
                return {
                    message = "Nan, ça ne nous convient pas",
                    colour = G.C.RED
                }
        end
        if context.cardarea == G.jokers and context.joker_main then
                return {
                    Xmult = card.ability.extra.Xmult
                }
        end
        if context.cardarea == G.jokers and context.joker_main and not context.blueprint then
                if G.playing_cards then
                        local valid_rank_to_achieve_cards = {}
                        for _, v in ipairs(G.playing_cards) do
                            if not SMODS.has_no_rank(v) then
                                valid_rank_to_achieve_cards[#valid_rank_to_achieve_cards + 1] = v
                            end
                        end
                        if valid_rank_to_achieve_cards[1] then
                            local rank_to_achieve_card = pseudorandom_element(valid_rank_to_achieve_cards, pseudoseed('rank_to_achieve' .. G.GAME.round_resets.ante))
                            G.GAME.current_round.rank_to_achieve_card.rank = rank_to_achieve_card.base.value
                            G.GAME.current_round.rank_to_achieve_card.id = rank_to_achieve_card.base.id
                        end
                    end
                return {
                    message = "Attention, nouvelles règles!"
                }
        end
        if context.individual and context.cardarea == G.play and not context.blueprint then
            if context.other_card:get_id() == G.GAME.current_round.rank_to_achieve_card.id then
                card.ability.extra.nb_hands_left = (card.ability.extra.nb_hands_left) + 1
                return {
                    message = "Critère rempli"
                }
            end
        end
        if context.after and context.cardarea == G.jokers  then
            if (card.ability.extra.nb_hands_left or 0) <= 0 then
                return {
                    func = function()
                card:explode()
                return true
            end,
                    message = "Censored!"
                }
            end
        end
    end
}