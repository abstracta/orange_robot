class HomePage
		include PageObject

	 	WAIT = Selenium::WebDriver::Wait.new(timeout: Utils::SHORT_TIMEOUT)

		a(:recruitment_option, :id => "menu_recruitment_viewRecruitmentModule")
		a(:recruitment_candidates_option, :id => "menu_recruitment_viewCandidates")

		def select_candidate_option_from_recruitment
			self.recruitment_option_element.when_present(Utils::SHORT_TIMEOUT)
			self.recruitment_option_element.click
			self.recruitment_candidates_option_element.when_present(Utils::SHORT_TIMEOUT)
			self.recruitment_candidates_option_element.click
			puts "Accessing to Candidates option..."
		end
end