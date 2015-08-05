module RubyCore
	class Message
		def self.send_message(type, mensage, debug = nil)
			"[#{RubyCore::Utilities.time_log}][RubyCore:development][#{type.to_s.capitalize}]: #{mensage}" unless debug
			"[#{RubyCore::Utilities.time_log}][RubyCore][#{type.to_s.capitalize}]: #{mensage}" if debug
		end
	end
end