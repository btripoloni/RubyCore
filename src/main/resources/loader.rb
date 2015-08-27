# TODO:
			# Criar um botão para mostrar os mods carregados,
			# Melhorar a desconpactação dos mods
			# *Consertar o bug de loads
			# Avisar que gems estão sendo instaladas
            # resouver quando não é declarado o mod de maneira correta

$mods = []
require 'java'
require_relative 'forge'

require_relative 'core/symbol'

require_relative 'minecraft/block'

require_relative 'rubycore/mod'
require_relative 'rubycore/paths'
require_relative 'rubycore/gems'
require_relative 'rubycore/quickclasses'
require_relative 'rubycore/utilities'
require_relative 'rubycore/tools'
require_relative 'rubycore/messages'

def add_mod(mod = nil, name = nil, version = nil)
	if mod && name && version
		$mods << mod
	else	
		puts RubyCore::Menssage.send_menssage(:error, "You need to define a mod class a name and the version of the mod![mod not loaded]")
	end
end

module RubyCore
	class Loader
		def initialize
			@path = RubyCore::Paths.new
			@mods_folder = @path.mods_folder()
			@cachied_mods_folder = @path.cachied_mods_folder()
			@gems_folder = @path.gems_folder()
			@cache_folder = @path.cache_folder()
			@development_folder = @path.development_folder()
			@mods = []

			RubyCore::Gems::process_gems([{rubygem: "rubyzip", as: "zip"}])
			create_base
			unpack_mods
			load_mods
			initialize_mods
		end

		def create_base
			# Creating the paths
			@path.rubycore_folder_create!
			@path.rubycore_mods_create!
			@path.cache_folder_create!
			@path.development_folder_create!
			@path.assets_folder_create!
			@path.gems_folder_create!
		end

		def load_mods
			Dir[@cachied_mods_folder].each do |f|
				puts RubyCore::Message.send_message(:load, f)
				load f
			end

			Dir[@development_folder].each do |f|
				puts RubyCore::Message.send_message(:load, f, true)
				load f
			end
		end

		def unpack_mods
			Dir[@mods_folder].each do |mod|
				mod_name = File.basename(mod, ".*")
				mod_folder = File.join(@cache_folder, mod_name)
				unless Dir.exist?(mod_folder)
					Dir.mkdir(mod_folder)
					Zip::File.open(mod) do |zip_file|
					  zip_file.each do |entry|
					  	directory = File.join(@cache_folder, mod_name, entry.name)# Duplicate
					    directory = File.join(@cache_folder, entry.name) if /assets\/(.*)/.match(entry.name)
					    Dir.mkdir(directory) unless Dir.exist?(directory) if entry.directory?
					  end

					  zip_file.each do |entry|
					    if entry.file?
					    	directory = File.join(@cache_folder, mod_name, entry.name)# Duplicate
					    	directory = File.join(@cache_folder, entry.name) if /assets\/(.*)/.match(entry.name)
					    	content = entry.get_input_stream.read
					    	file = File.new(directory, "w+")
					    	file.write(content)
					    end
					  end
					end
				end
			end
		end

		def initialize_mods
			$mods.each do |mod|
				@mods << mod.new
			end
		end

		def init
			call_method(:init)
		end

		def pre_init
			call_method(:pre_init)
		end

		def post_init
			call_method(:post_init)
		end

		def call_method(name)
			@mods.each_with_index do |mod, index|
				mod.send(name.to_s) if $mods[index].method_defined? name
			end
		end
	end
end

RubyCore::Loader
