class Example
	def pre_init
		@block = QuickBlock.new(:wood)
		@block.setBlockName("block")

		@item = QuickItem.new
		@item.setUnlocalizedName("item")

		@tab = QuickTab.new("Tab", @item)

		@item.setCreativeTab(@tab)
		@block.setCreativeTab(@tab)

		GameRegistry.registerBlock(@block, "block")
		GameRegistry.registerItem(@item, "item")
	end
end

add_mod(Example, "Example", '0.1')