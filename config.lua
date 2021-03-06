RT_PARAM = {L = 80, W = 2, N = 10000, OFFSET = 0}
HOST_PORT = 8
PARENT_TURTLE_PORT = 10
REFUEL_THRESHOLD = 8000

EMPTY_BUCKET_ITEM_ID = 'minecraft:bucket'
LAVA_BUCKET_ITEM_ID  = 'minecraft:lava_bucket'
CHUNK_LOADER_ITEM_ID = 'kibe:chunk_loader'
ENTANGLED_CHEST_ITEM_ID = 'kibe:entangled_chest'

WANT_BLOCK_ID = {
  -- vanilla
  'minecraft:gold_ore',
  'minecraft:iron_ore',
  'minecraft:copper_ore',
  'minecraft:coal_ore',
  'minecraft:lapis_ore',
  'minecraft:diamond_ore',
  'minecraft:redstone_ore',
  'minecraft:lit_redstone_ore',
  'minecraft:emerald_ore',
  'minecraft:deepslate_gold_ore',
  'minecraft:deepslate_iron_ore',
  'minecraft:deepslate_copper_ore',
  'minecraft:deepslate_coal_ore',
  'minecraft:deepslate_lapis_ore',
  'minecraft:deepslate_diamond_ore',
  'minecraft:deepslate_redstone_ore',
  'minecraft:deepslate_lit_redstone_ore',
  'minecraft:deepslate_emerald_ore',
  -- vanilla-nether
  'minecraft:nether_gold_ore',
  'minecraft:nether_quartz_ore',
  'minecraft:ancient_debris',
  -- applied energistics
  'appliedenergistics2:quartz_ore',
  'appliedenergistics2:deepslate_quartz_ore',
  -- techreborn
  'techreborn:sapphire_ore',
  'techreborn:ruby_ore',
  'techreborn:peridot_ore',
  'techreborn:galena_ore',
  -- industrial revolution
  'indrev:nikolite_ore',
  'indrev:deepslate_nikolite_ore',
  -- modern industrialization
  'modern_industrialization:lead_ore',
  'modern_industrialization:silver_ore',
  'modern_industrialization:tin_ore',
  'modern_industrialization:tungsten_ore',
  'modern_industrialization:uranium_ore',
  'modern_industrialization:titanium_ore',
  'modern_industrialization:bauxite_ore',
  'modern_industrialization:platinum_ore',
  'modern_industrialization:mozanite_ore',
  'modern_industrialization:antimony_ore',
  'modern_industrialization:nickel_ore',
  'modern_industrialization:iridium_ore',
  'modern_industrialization:lignite_coal_ore',
  'modern_industrialization:deepslate_lead_ore',
  'modern_industrialization:deepslate_silver_ore',
  'modern_industrialization:deepslate_tin_ore',
  'modern_industrialization:deepslate_tungsten_ore',
  'modern_industrialization:deepslate_uranium_ore',
  'modern_industrialization:deepslate_titanium_ore',
  'modern_industrialization:deepslate_bauxite_ore',
  'modern_industrialization:deepslate_platinum_ore',
  'modern_industrialization:deepslate_mozanite_ore',
  'modern_industrialization:deepslate_antimony_ore',
  'modern_industrialization:deepslate_nickel_ore',
  'modern_industrialization:deepslate_iridium_ore',
  'modern_industrialization:deepslate_lignite_coal_ore'
}

WANT_ITEM_ID = {
  -- vanilla
  'minecraft:diamond',
  'minecraft:raw_gold',
  'minecraft:raw_iron',
  'minecraft:raw_copper',
  'minecraft:redstone',
  'minecraft:lapis_lazuli',
  'minecraft:coal',
  'minecraft:emerald',
   -- vanilla-nether
  'minecraft:nether_gold_ore',
  'minecraft:nether_quartz_ore',
  'minecraft:ancient_debris',
  -- modern industrialization
  'modern_industrialization:raw_lead',
  'modern_industrialization:raw_silver',
  'modern_industrialization:raw_tin',
  'modern_industrialization:raw_tungsten',
  'modern_industrialization:raw_uranium',
  'modern_industrialization:raw_titanium',
  'modern_industrialization:bauxite_dust',
  'modern_industrialization:raw_platinum',
  'modern_industrialization:mozanite_dust',
  'modern_industrialization:raw_antimony',
  'modern_industrialization:raw_nickel',
  'modern_industrialization:raw_iridium',
  'modern_industrialization:lignite_coal',
  -- techreborn
  'techreborn:sapphire_gem',
  'techreborn:ruby_gem',
  'techreborn:peridot_gem',
  'techreborn:galena_ore',
  -- applied energistics 2
  'appliedenergistics2:certus_quartz_dust',
  -- industrial revolution
  'indrev:nikolite_dust',
  'indrev:sulfur_crystal',
  -- etc.
  CHUNK_LOADER_ITEM_ID,  -- do not delete
  LAVA_BUCKET_ITEM_ID,   -- do not delete
  EMPTY_BUCKET_ITEM_ID,  -- do not delete
  ENTANGLED_CHEST_ITEM_ID
}

FUEL_ITEM_ID = {
  'minecraft:lava_bucket',
  'minecraft:coal',
  'minecraft:charcoal'
}

TRANSPARENT_BLOCK_ID = {
  'minecraft:water',
  'minecraft:lava',
  'NO_BLOCK'
}
