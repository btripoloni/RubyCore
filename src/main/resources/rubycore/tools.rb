require 'csv'

module RubyCore
	#Deprecated
	class Tools	
		#melhorar
		def self.get_name_of_class(name)
			name.split('.').last
		end

		def self.create_class_with_methods(class_name, csv_path, class_path)
			name_methods = []
			obfuscated_methods = []
			parameters_size = []
			methods = RubyCoreApi.get_methods_from_a_class(class_name)
			methods.each do |method|
				CSV.foreach(csv_path) do |row|
					if method.getName == row[0]
						name_methods << row[1]
						obfuscated_methods << method.getName
						parameters_size << method.parameters.size
					end
				end
			end

			name_of_class = get_name_of_class(class_name)
			#Melhorar
			file = File.new(File.join(class_path, "#{name_of_class.downcase}.rb"), "w+")
			file.write("class #{name_of_class}\n")
			name_methods.each_with_index do |name, index|
				parameters = ""
				parameters_size[index].times do |params|
					parameters << "arg#{params}"
					parameters << ", " unless params == (parameters_size[index] - 1)
				end
				file.write("  def self.#{name}(#{parameters})\n")
				file.write("    #{obfuscated_methods[index]}(#{parameters})\n")
				file.write("  end\n")
			end
			file.write("end")
			file.close
		end

		def self.create_class_with_fields(class_name, csv_path, class_path)
			name_fields = []
			obfuscated_fields = []
			fields = RubyCoreApi.get_fields_from_a_class(class_name)
			fields.each do |field|
				CSV.foreach(csv_path) do |row|
					if field.getName == row[0]
						name_fields << row[1]
						obfuscated_fields << field.getName
					end
				end
			end

			name_of_class = get_name_of_class(class_name)
			#Melhorar
			file = File.new(File.join(class_path, "#{name_of_class.downcase}.rb"), "w+")
			file.write("class #{name_of_class}\n")
			name_fields.each_with_index do |name, index|
				file.write("  def self.#{name}\n")
				file.write("    #{obfuscated_fields[index]}\n")
				file.write("  end\n\n")
			end
			file.write("end")
			file.close
		end
	end
end