module RubyCore
	class UnpackMods
		def initialize
			@path = RubyCore::Paths.new
			@mods_folder = @path.mods_folder()
			@cachied_mods_folder = @path.cachied_mods_folder()
			@cache_folder = @path.cache_folder()
		end
			
		def unpack
			Dir[@mods_folder].each do |mod|
				@folder = mod_folder(mod)
				unless Dir.exist?(@folder)
					Dir.mkdir(@folder)
					extract_mod(mod)
				end
			end
		end

		private
		def write_file(file, content)
			file = File.new(file, 'w+')
			file.write(content)
			file.close
		end

		def mod_folder(mod)
			mod_name = RubyCore::Utilities.mod_name(mod)
			File.join(@cache_folder, mod_name)
		end

		def rubycore_jar
			Dir[File.join(@path.forge_mods_folder, "jruby*.jar")].first
		end

		def extract_ruby(entry)
			dir = File.join(@folder, entry.name)
			content = entry.get_input_stream.read
			write_file(dir, content)
		end

		def cache_assets(entry)
			dir = File.join(@path.cache_assets, File.dirname(entry.name))
			Dir.mkdir(dir)
			write_file(dir, entry.get_input_stream.read) if entry.file?
		end

		def extract_assets(entry)
			cache_assets(entry)
		end

		def extract_mod(mod)
			Zip::File.open(mod) do |zipFile|
				zipFile.each do |entry|
					if entry.name.index(".rb")
						extract_ruby(entry)
					else
						puts entry
						extract_assets(entry)
					end
				end
			end
		end

	end
end
		