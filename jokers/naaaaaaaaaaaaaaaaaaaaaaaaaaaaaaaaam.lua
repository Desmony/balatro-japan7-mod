SMODS.Joker{ --NAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM
    name = "NAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM",
    key = "naaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaam",
    config = {
        extra = {
            mult = 1
        }
    },
    loc_txt = {
        ['name'] = 'NAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM',
        ['text'] = {
            [1] = 'This Joker gains {X:red,C:white}X0.5{} Mult',
            [2] = 'when using a {C:attention}Wheel of Fortune{}',
            [3] = '{C:inactive}(Currently {X:red,C:white}X#1#{}{C:inactive} Mult){}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 7,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 5,
    rarity = 2,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["japan7mod_jokers"] = true },

    loc_vars = function(self, info_queue, card)
        local info_queue_0 = G.P_CENTERS["c_wheel_of_fortune"]
        if info_queue_0 then
            info_queue[#info_queue + 1] = info_queue_0
        else
            error("JOKERFORGE: Invalid key in infoQueues. \"c_wheel_of_fortune\" isn't a valid Object key, Did you misspell it or forgot a modprefix?")
        end
        return {vars = {card.ability.extra.mult}}
    end,

    calculate = function(self, card, context)
        if context.using_consumeable and not context.blueprint then
            if context.consumeable and context.consumeable.ability.set == 'Tarot' and context.consumeable.config.center.key == 'c_wheel_of_fortune' then
                return {
                    func = function()
                    card.ability.extra.mult = (card.ability.extra.mult) + 0.5
                    return true
                end,
                    message = "Naaaaaaaaaaaaaaam!"
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