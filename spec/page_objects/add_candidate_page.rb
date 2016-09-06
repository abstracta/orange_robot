class AddCandidatePage
		include PageObject

	 	WAIT = Selenium::WebDriver::Wait.new(timeout: Utils::SHORT_TIMEOUT)

		text_field(:first_name_txt, :id => "addCandidate_firstName")
		text_field(:middle_name_txt, :id => "addCandidate_middleName")
		text_field(:last_name_txt, :id => "addCandidate_lastName")

		text_field(:email_txt, :id => "addCandidate_email")
		text_field(:candidate_resume_button, :id => "addCandidate_resume")
		text_field(:keywords_txt, :id => "addCandidate_keyWords")
		text_field(:comment_txt, :id => "addCandidate_comment")
		text_field(:applied_date_txt, :id => "addCandidate_appliedDate")
		button(:save_button, :id => "btnSave")

		def create_new_candidate data
			puts "Posting a new candidate..."
			self.first_name_txt_element.when_present(Utils::SHORT_TIMEOUT)
			self.first_name_txt = data[ :first_name]
			self.last_name_txt = data[ :last_name]
			self.email_txt = data[ :email]
			upload_file data[ :resume]
			self.keywords_txt_element.when_present(Utils::SHORT_TIMEOUT)
			self.keywords_txt = data[ :keywords]
			self.comment_txt = data[ :comments]
			self.save_button
		end

		def upload_file file
			self.candidate_resume_button_element.when_present(Utils::SHORT_TIMEOUT)
			self.candidate_resume_button_element.value = Dir.pwd + "/cvs/" + "#{file}" if !file.nil?
		end
end