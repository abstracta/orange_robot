class DataMethods
	def hash_from_row row
		file_name = have_a_cv_for_this_person? row[1], row[2], row[4]

		hash = {
			first_name: row[1],
			last_name: row[2],
			email: row[4],
			resume: file_name,
			keywords: (map_of_keywords_from_excel row),
			comments: row[16]
		}

		hash
	end

	private
	def map_of_keywords_from_excel row
		keywords = ""

		profile = row[6]
		seniority = row[7]
		english = row[8]
		automation = row[9] 
		performance = row[10] 
		
		name = row[1]
		lastname = row[2]
		email = row[4]

		if profile.nil?
			Utils.write_into_the_log name, lastname, email, "No se pudo encontrar el keyword de 'Perfil' para agregar. Campo vacío en el excel"
		else
			keywords = keywords + ", " if keywords != ""
			keywords = keywords + "perfil:#{profile}"
		end

		if seniority.nil?
			Utils.write_into_the_log name, lastname, email, "No se pudo encontrar el keyword de 'Seniority' para agregar. Campo vacío en el excel"
		else
			keywords = keywords + ", " if keywords != ""
			keywords = keywords + "seniority:#{seniority}"
		end

		if english.nil?
			Utils.write_into_the_log name, lastname, email, "No se pudo encontrar el keyword de 'Ingles' para agregar. Campo vacío en el excel"
		else
			keywords = keywords + ", " if keywords != ""
			keywords = keywords + "ingles:#{english}"
		end

		if automation.nil?
			Utils.write_into_the_log name, lastname, email, "No se pudo encontrar el keyword de 'Automatizacion' para agregar. Campo vacío en el excel"
		else
			keywords = keywords + ", " if keywords != ""
			keywords = keywords + "automatizacion"
		end

		if performance.nil?
			Utils.write_into_the_log name, lastname, email, "No se pudo encontrar el keyword de 'Performance' para agregar. Campo vacío en el excel"
		else
			keywords = keywords + ", " if keywords != ""
			keywords = keywords + "performance"
		end

		keywords
	end

	def have_a_cv_for_this_person? name, lastname, email
		Dir.chdir("cvs")
		files = Dir.glob "*"
		results = files.find_all {|i| i.downcase.include? "#{name.downcase}"}.find_all{|i| i.downcase.include? "#{lastname.downcase}"}
		returned_file = nil
 		Dir.chdir("../")

		if results == []
			Utils.write_into_the_log name, lastname, email, "No se pudo encontrar el CV para subir"
		elsif results.size > 1
			Utils.write_into_the_log name, lastname, email, "Se encontro mas de un CV para esta persona!"
		else
			returned_file = results[0]
		end

		returned_file 
	end
end