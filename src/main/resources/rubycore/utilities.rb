module RubyCore
	module Utilities
		def self.time_log
			time = Time.now
			"#{time.hour}:#{time.min}:#{time.sec}"
		end

		def self.mod_name(mod)
			File.basename(mod, ".*")
		end
	end
end