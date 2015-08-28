module RubyCore
	class Paths
		def minecraft_folder
			RubyCoreApi.minecraft_home.to_s
		end

		def mods_folder
			File.join(minecraft_folder, 'mods' , 'rubymods', '*.zip')
		end

		def forge_mods_folder
			File.join(minecraft_folder, 'mods')
		end

		def cache_assets
			File.join(cache_folder, "cache_assets")
		end

		def rubycore_folder
			File.join(minecraft_folder, 'rubycore')
		end

		def cache_folder
			File.join(rubycore_folder, 'cache')
		end

		def cachied_mods_folder
			File.join(cache_folder, '/*/', 'mod_*.rb')
		end


		def gems_folder
			File.join(cache_folder, 'gems')
		end

		def development_folder
			File.join(rubycore_folder, 'development', "mod_*.rb")
		end

		def assets_folder
			File.join(cache_folder, 'assets')
		end

		def method_missing(name, *args)
			methods = name.to_s.match "(.+)_(.+)"
			if methods
				dir = methods[0]
				method = methods[1]
				exist?(dir) if method == "exist?"
				create(dir) if method == "create!"
			else
				super
			end
		end

		private
		def exist?(path)
			Dir.exist?(send(path))
		end

		def create(path)
			dir = send("path")
			Dir.mkdir(dir) unless exists(dir)
		end
	end
end
