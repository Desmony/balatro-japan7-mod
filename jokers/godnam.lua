SMODS.Joker{ --GodNam
    key = "godnam",
    config = {
        extra = {
            xchips = 2,
            Xmult = 1.5,
            Xmult2 = 2,
            Xmult3 = 3
        }
    },
    loc_txt = {
        ['name'] = 'GodNam',
        ['text'] = {
            [1] = '{C:common}Common{} Jokers each gives {X:blue,C:white}x2{} Chips.',
            [2] = '{C:uncommon}Uncommon{} Jokers each gives {X:red,C:white}X1.5{} Mult.',
            [3] = '{C:rare}Rare{} Jokers each gives {X:red,C:white}X2{} Mult.',
            [4] = '{C:legendary}Legendary{} Jokers each gives {X:red,C:white}x3{} Mult.'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 7,
        y = 1
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 20,
    rarity = 4,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["japan7mod_jokers"] = true },
    soul_pos = {
        x = 8,
        y = 1
    },
    in_pool = function(self, args)
          return (
          not args 
          or args.source ~= 'sho' 
          or args.source == 'buf' or args.source == 'jud' or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
          )
          and true
      end,

    calculate = function(self, card, context)
        if context.other_joker  then
            if (function()
    return context.other_joker.config.center.rarity == 1
end)() then
                return {
                    x_chips = card.ability.extra.xchips
                }
            elseif (function()
    return context.other_joker.config.center.rarity == 2
end)() then
                return {
                    Xmult = card.ability.extra.Xmult
                }
            elseif (function()
    return context.other_joker.config.center.rarity == 3
end)() then
                return {
                    Xmult = card.ability.extra.Xmult2
                }
            elseif (function()
    return context.other_joker.config.center.rarity == 4
end)() then
                return {
                    Xmult = card.ability.extra.Xmult3
                }
            end
        end
    end
}