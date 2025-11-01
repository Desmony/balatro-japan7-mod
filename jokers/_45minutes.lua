SMODS.Joker{ --45minutes
    key = "_45minutes",
    config = {
        extra = {
            time_bought = 0
        }
    },
    loc_txt = {
        ['name'] = '45minutes',
        ['text'] = {
            [1] = 'Adds 3 times the number of minutes',
            [2] = 'since you bought this joker to Mult.'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
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

    add_to_deck = function(self, card, from_debuff)
        card.ability.extra.time_bought = os.time()
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            local temp = os.time()
            temp = temp - card.ability.extra.time_bought
            temp = (math.floor(temp / 20))
            return {
                mult = temp
            }
        end
    end
}