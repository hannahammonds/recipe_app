module PagesHelper
    def get_eight_recipes
        if Recipe.all.count == 0
            return []
        elseif Recipe.all.count <9
            return Recipe.all.count.times.map{Recipe.all[Random.rand(Recipe.count)]}
        else
            return 8.times.map {Recipe.all[Random.rand(Recipe.count)]}
        end
    end
end
