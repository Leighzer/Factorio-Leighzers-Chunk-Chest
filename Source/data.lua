if not leighzermods then --generic mod variable to store information that may be needed later
  leighzermods = {}        
end

if not leighzermods.leighzerchunkchest then
  leighzermods.leighzerchunkchest = {}
  leighzermods.leighzerchunkchest.chunkChestTint = {r=255/255,g=182/255,b=193/255}
  leighzermods.leighzerchunkchest.itemIcons = {{icon="__base__/graphics/icons/steel-chest.png",icon_size=64,tint=leighzermods.leighzerchunkchest.chunkChestTint}}
end

local hit_effects = require ("__base__.prototypes.entity.hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")

--add item
--add recipe
--add actual chest
--add recipe unlock on steel-processing research
data:extend({
  {
    type = "item",
    name = "chunk-steel-chest",
    icons = leighzermods.leighzerchunkchest.itemIcons,
    subgroup = "storage",
    order = "a[items]-d[chunk-steel-chest]",
    place_result = "chunk-steel-chest",
    stack_size = 50,
  },
  {
    type = "recipe",
    name = "chunk-steel-chest",
    enabled = false,
    energy_required = 0.5 * 32,
    ingredients =
    {
      {"steel-chest", 32},      
    },    
    result = "chunk-steel-chest",
  },
  {
    type = "container",
    name = "chunk-steel-chest",
    icons = leighzermods.leighzerchunkchest.itemIcons,    
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 1, result = "chunk-steel-chest"},
    max_health = 350 * 32,
    --corpse = "chunk-steel-chest-remnants", -- we are opting for no corpse since it is so big it would pollute the map plus remnant wasn't placing in same place as orig building
    dying_explosion = "nuke-explosion", -- "steel-chest-explosion",
    open_sound = { filename = "__base__/sound/metallic-chest-open.ogg", volume=0.43 },
    close_sound = { filename = "__base__/sound/metallic-chest-close.ogg", volume = 0.43 },
    resistances =
    {
      {
        type = "fire",
        percent = 90
      },
      {
        type = "impact",
        percent = 60
      }
    },
    collision_box = {{(-0.5 * 32) + 0.15, (-0.5 * 32) + 0.15}, {(0.5 * 32) - 0.15, (0.5 * 32) -0.15}},
    --collision_box = {{-0.35 * 32, -0.35 * 32}, {0.35 * 32, 0.35 * 32}},
    selection_box = {{-0.5 * 32, -0.5 * 32}, {0.5 * 32, 0.5 * 32}},
    damaged_trigger_effect = hit_effects.entity(),
    fast_replaceable_group = "container",
    inventory_size = 48 * 32,
    vehicle_impact_sound = sounds.generic_impact,
    picture =
    {
      layers =
      {
        {
          filename = "__leighzerchunkchest__/graphics/entity/steel-chest/steel-chest.png",
          tint = leighzermods.leighzerchunkchest.chunkChestTint,
          priority = "extra-high",
          width = 32,
          height = 40,
          shift = util.by_pixel(0, -0.5),
          scale = 1 * 32,
          hr_version =
          {
            filename = "__leighzerchunkchest__/graphics/entity/steel-chest/hr-steel-chest.png",
            tint = leighzermods.leighzerchunkchest.chunkChestTint,
            priority = "extra-high",
            width = 64,
            height = 80,
            shift = util.by_pixel(-0.25, -0.5),
            scale = 0.5 * 32,            
          }
        },
        -- { -- not drawing shadow as that wasn't rendering quite right either
        --   filename = "__base__/graphics/entity/steel-chest/steel-chest-shadow.png",
        --   priority = "extra-high",
        --   width = 56,
        --   height = 22,
        --   shift = util.by_pixel(12, 7.5),
        --   draw_as_shadow = true,
        --   scale = 1 * 32,
        --   hr_version =
        --   {
        --     filename = "__base__/graphics/entity/steel-chest/hr-steel-chest-shadow.png",
        --     priority = "extra-high",
        --     width = 110,
        --     height = 46,
        --     shift = util.by_pixel(12.25, 8),
        --     draw_as_shadow = true,
        --     scale = 0.5 * 32
        --   }
        -- }
      }
    },
    circuit_wire_connection_point = circuit_connector_definitions["chest"].points,
    circuit_connector_sprites = circuit_connector_definitions["chest"].sprites,
    circuit_wire_max_distance = default_circuit_wire_max_distance
  },
  -- {
  --   type = "corpse",
  --   name = "chunk-steel-chest-remnants",
  --   icons = leighzermods.leighzerchunkchest.itemIcons,
  --   flags = {"placeable-neutral", "building-direction-8-way", "not-on-map"},
  --   subgroup = "storage-remnants",
  --   order = "a-c-b",
  --   selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
  --   tile_width = 1,
  --   tile_height = 1,
  --   selectable_in_game = false,
  --   time_before_removed = 60 * 60 * 15, -- 15 minutes
  --   final_render_layer = "remnants",
  --   remove_on_tile_placement = false,
  --   animation =
  --   {
  --     filename = "__leighzerchunkchest__/graphics/entity/steel-chest/remnants/steel-chest-remnants.png",
  --     tint = leighzermods.leighzerchunkchest.chunkChestTint,
  --     line_length = 1,
  --     width = 76,
  --     height = 44,
  --     frame_count = 1,
  --     direction_count = 1,
  --     shift = util.by_pixel(15, -1),
  --     scale = 1 * 32,
  --     hr_version =
  --     {
  --       filename = "__leighzerchunkchest__/graphics/entity/steel-chest/remnants/hr-steel-chest-remnants.png",
  --       tint = leighzermods.leighzerchunkchest.chunkChestTint,
  --       line_length = 1,
  --       width = 150,
  --       height = 88,
  --       frame_count = 1,
  --       direction_count = 1,
  --       shift = util.by_pixel(15, -1),
  --       scale = 0.5 * 32
  --     }
  --   }
  -- }  
})