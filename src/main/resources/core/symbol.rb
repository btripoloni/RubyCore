class Symbol
	def to_tab
		tab_name = "tab#{to_s.capitalize}"
		CreativeTabs.send(tab_name)
	end 

	def to_material
		Material.send(to_s)
	end 
end