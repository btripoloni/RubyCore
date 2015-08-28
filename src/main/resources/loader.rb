# TODO:
			# Criar um botão para mostrar os mods carregados,
			# Melhorar a desconpactação dos mods
			# *Consertar o bug de loads
			# Avisar que gems estão sendo instaladas

$mods = []
$debug = false
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
require_relative 'rubycore/unpack_mods'

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
			u = RubyCore::UnpackMods.new
			u.unpack
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
			@path.cache_assets_create!
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

		def initialize_mods
			$mods.each do |mod|
				@mods << mod.new
			end
		end
		
		def call_method(name)
			@mods.each_with_index do |mod, index|
				mod.send(name.to_s) if $mods[index].method_defined? name
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

	end
end

RubyCore::Loader
