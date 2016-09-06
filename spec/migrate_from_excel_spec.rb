require 'spec_helper'

describe "Migration from Excel to Orange System" do

  it "Migration from excel", :migration_from_excel => true do
  	$session.navigate.to 'http://opensource.demo.orangehrmlive.com/index.php/auth/login'
  	puts "Accessing to Login Page..."

  	@page = LoginPage.new $session
  	@page.login_with_username_and_password "admin", "admin"

  	@page = HomePage.new $session
  	@page.select_candidate_option_from_recruitment

  	@data_methods = DataMethods.new
  	Utils.title_log

  	excel_sheet = Utils.read_excel_file "candidates.xls", "Hoja1"
  	counter = 1

  	excel_sheet.each do |row|
  		break if row[0].nil?
  		@page = CandidatesPage.new $session
  		@page.click_on_add_new_candidate

  		@page = AddCandidatePage.new $session
  		Utils.log_in_live "Estamos agregando el candidato numero... #{counter}"
  		@page.create_new_candidate @data_methods.hash_from_row row
  		
  		@page = CandidateSuccessfullyAddedPage.new $session

  		# IF there is an error creating the user
  		if !@page.candidate_was_added_correctly?
  			Utils.write_into_the_log row[1], row[2], row[4], "ERROR al agregar usuario!"
  			@page = HomePage.new $session
  			@page.select_candidate_option_from_recruitment
        puts "It was an error saving the candidate :(".red
  		else
        puts "Candidate saved correctly!".green
  			@page.go_to_back_page
  		end

  		counter += 1
  	end
  end
end