module RubyCore
	module Utilities
		def self.time_log
			time = Time.now
			"#{time.hour}:#{time.min}:#{time.sec}"
		end
	end
end