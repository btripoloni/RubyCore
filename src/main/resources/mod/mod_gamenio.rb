class Gamenio
	def pre_init
    @gamenio = QuickBlock.new(:rock)
    @gamenio_ingot = QuickItem.new()
    @gamenio_tab = QuickTab.new('Gamenio', @gamenio_ingot)
   # @gamenio.setUnlocalizedName("gamenio")
    #@gamenio_ingot.setUnlocalizedName("gamenio_ingot")
    set_tabs
    set_texture
    set_smeltings
    register_items
	end

  def set_tabs
  	@gamenio.setCreativeTab(@gamenio_tab)
  	@gamenio_ingot.setCreativeTab(@gamenio_tab)
  end

  def set_texture
  	@gamenio.setBlockTextureName("rubycore:gamenio")
  	@gamenio_ingot.setTextureName("rubycore:gamenio")
  end

  def set_smeltings
    GameRegistry.addSmelting(@gamenio, ItemStack.new(@gamenio_ingot), 15)
  end

	def register_items
		GameRegistry.registerBlock(@gamenio, "gamenio")
		GameRegistry.registerItem(@gamenio_ingot, "gamenio_ingot")
	end
end

add_mod(Gamenio, "Gamenio", "0.1")