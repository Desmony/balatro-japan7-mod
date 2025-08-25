SMODS.Joker{ --Nana-Chan
    name = "Nana-Chan",
    key = "nanachan",
    config = {
        extra = {
            money÷15 = 1
        }
    },
    loc_txt = {
        ['name'] = 'Nana-Chan',
        ['text'] = {
            [1] = '{X:red,C:white}X1{} Mult for every {C:gold}$15{} you have',
            [2] = '{C:inactive}(Currently {X:red,C:white}X#1#{}{C:inactive} Mult){}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 20,
    rarity = 4,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    soul_pos = {
        x = 1,
        y = 0
    },
    in_pool = function(self, args)
          return (
          not args 
          or args.source ~= 'sho' 
          or args.source == 'buf' or args.source == 'jud' or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
          )
          and true
      end,

    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.money÷15 + ((math.floor(G.GAME.dollars / 15) or 0))}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main then
                return {
                    Xmult = card.ability.extra.money÷15 + (math.floor(G.GAME.dollars / 15))
                }
        end
    end
}