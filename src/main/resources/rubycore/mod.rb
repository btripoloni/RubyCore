module RubyCore
	module Mod
		def new_recipe(block, recipe)
			recipe[:stack] = 0 if recipe[:stack] == nil
			stack = ItemStack.new(block, recipe[:stack])
			
			java_recipe = []

			recipe[:recipe].each {|r| java_recipe << r}

			recipe[:items].each do |i|
					java_recipe << i.first.to_s.ord.to_java(:char)
					java_recipe << i.last
			end
			
			GameRegistry.addRecipe(stack, java_recipe.to_java)
		end
	end

end