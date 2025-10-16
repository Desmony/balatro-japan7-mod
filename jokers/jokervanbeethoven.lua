SMODS.Joker{ --Joker van Beethoven
    key = "jokervanbeethoven",
    config = {
        extra = {
            Xmult = 5
        }
    },
    loc_txt = {
        ['name'] = 'Joker van Beethoven',
        ['text'] = {
            [1] = '{X:red,C:white}X5{} Mult if played hand',
            [2] = 'contains four {C:attention}5s{}.'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
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

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main  then
            if (function()
    local rankCount = 0
    for i, c in ipairs(context.full_hand) do
        if c:get_id() == 5 then
            rankCount = rankCount + 1
        end
    end
    
    return rankCount >= 4
end)() then
                return {
                    Xmult = card.ability.extra.Xmult,
                    message = "Dun dun dun duuuun"
                }
            end
        end
    end
}