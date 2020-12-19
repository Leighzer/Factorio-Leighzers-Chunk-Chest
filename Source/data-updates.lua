-- update steel processing tech to unlock our chunk chest recipe
table.insert(data.raw.technology["steel-processing"].effects,{
    type = "unlock-recipe",
    recipe = "chunk-steel-chest"
})