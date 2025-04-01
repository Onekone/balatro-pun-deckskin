--- STEAMODDED HEADER
--- MOD_NAME: Calambur
--- MOD_ID: calambur
--- PREFIX: calambur
--- MOD_AUTHOR: [Onekone]
--- MOD_DESCRIPTION: Deck skin for Balatro of one of my favorite russian(-ukrainian) comedy shows

local atlas_key = 'calambur_atlas' -- Format: PREFIX_KEY
-- See end of file for notes
local atlas_path = 'calambur_atlas_lc.png' -- Filename for the image in the asset folder
local atlas_path_hc = 'calambur_atlas_hc.png' -- Filename for the high-contrast version of the texture, if existing

local suits = {'diamonds'} -- Which suits to replace
local ranks = {'Jack', 'Queen', "King"} -- Which ranks to replace

local descriptions = {'Fools Village'} -- English-language description, also used as default

-----------------------------------------------------------
-- You should only need to change things above this line --
-----------------------------------------------------------

SMODS.Atlas{
    key = atlas_key..'_lc',
    px = 71,
    py = 95,
    path = atlas_path,
    prefix_config = {key = false}, -- See end of file for notes
}

if atlas_path_hc then
    SMODS.Atlas{
        key = atlas_key..'_hc',
        px = 71,
        py = 95,
        path = atlas_path_hc,
        prefix_config = {key = false}, -- See end of file for notes
    }
end

for i, suit in ipairs(suits) do
    SMODS.DeckSkin{
        key = suit.."_skin",
        suit = suit:gsub("^%l", string.upper),
        ranks = ranks,
        lc_atlas = atlas_key..'_lc',
        hc_atlas = (atlas_path_hc and atlas_key..'_hc') or atlas_key..'_lc',
        loc_txt = {
            ['en-us'] = descriptions[i]
        },
        posStyle = 'collab'
    }
end