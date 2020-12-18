for _,force in pairs(game.forces) do    
    
    if force.recipes["chunk-steel-chest"] then
        force.recipes["chunk-steel-chest"].enabled = force.technologies["steel-processing"].researched
    end   

end