require 'spreadsheet'

class Utils
	# CONSTANTS
	LITTLE_TIMEOUT = 20
	SHORT_TIMEOUT = 60
	LONG_TIMEOUT = 120

	# Method to read a file that is passed by parameter
	def self.read_excel_file file, sheet
		book = Spreadsheet.open file
		sheet1 = book.worksheet sheet
	end

	def self.title_log
		today_date = Time.new
		f = File.new "./result-#{today_date.day}-#{today_date.month}-#{today_date.year}.csv","a"
		f.puts "Name,LastName,Email,Comment"
		f.close
	end

	def self.log_in_live text
		logger = Logger.new(STDOUT)	
		logger = Logger.new("./result_in_live.log")
		logger.add(Logger::INFO) {text}
		logger.close
	end

	def self.write_into_the_log name, lastname, email, comment
		today_date = Time.new
		f = File.new "./result-#{today_date.day}-#{today_date.month}-#{today_date.year}.csv","a"
		f.puts "#{name},#{lastname},#{email},#{comment}"
		f.close
	end
end