SMODS.Joker{ --Couché à 22h
    key = "couch22h",
    config = {
        extra = {
            handsremaining = 0
        }
    },
    loc_txt = {
        ['name'] = 'Couché à 22h',
        ['text'] = {
            [1] = 'Earn {C:money}$2{} at end of round for',
            [2] = 'each of your remaining hands.'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
        y = 3
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

    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval  then
                return {
                    dollars = (G.GAME.current_round.hands_left) * 2,
                    message = "Sleeping early"
                }
        end
    end
}