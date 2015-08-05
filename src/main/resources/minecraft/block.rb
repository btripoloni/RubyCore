class Block 
	def initialize(material)
		if material.is_a? Symbol
			super(material.to_material)
		else
			super(material)
		end
	end

	def set_creative_tab(tab)
		if tab.is_a? Symbol
			setCreativeTab(tab.to_tab)
		else
			setCreativeTab(tab)
		end
	end
end