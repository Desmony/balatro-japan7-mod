SMODS.Joker{ --Fumo Friday
    key = "fumofriday",
    config = {
        extra = {
            nb_rounds = 0,
            currentweekday = 0,
            Xmult = 3,
            Xmult2 = 1.5
        }
    },
    loc_txt = {
        ['name'] = 'Fumo Friday',
        ['text'] = {
            [1] = '{X:red,C:white}X3{} Mult after {C:attention}5{} rounds.',
            [2] = '{C:inactive}(Currently {}{C:attention}#1#{}{C:inactive}/5){}',
            [3] = '{C:inactive,s:0.75}(Something might happen if it\'s really Friday...){}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 2
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 6,
    rarity = 3,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["japan7mod_jokers"] = true },

    loc_vars = function(self, info_queue, card)
        
        return {vars = {card.ability.extra.nb_rounds}}
    end,

    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
                return {
                    func = function()
                    card.ability.extra.nb_rounds = (card.ability.extra.nb_rounds) + 1
                    return true
                end
                }
        end
        if context.cardarea == G.jokers and context.joker_main  then
            if (card.ability.extra.nb_rounds or 0) >= 5 then
                if os.date("*t", os.time()).wday == 6 then
                    return {
                        Xmult = card.ability.extra.Xmult * card.ability.extra.Xmult2,
                        message = "Real Fumo Friday!"
                    }
                else
                    return {
                        Xmult = card.ability.extra.Xmult
                    }
                end
            elseif os.date("*t", os.time()).wday == 6 then
                return {
                    Xmult = card.ability.extra.Xmult2,
                    message = "Real Fumo Friday!"
                }
            end
        end
    end
}