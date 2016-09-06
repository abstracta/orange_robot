class CandidatesPage
		include PageObject

	 	WAIT = Selenium::WebDriver::Wait.new(timeout: Utils::SHORT_TIMEOUT)

		button(:add_new_candidate_button, :id => "btnAdd")

		def click_on_add_new_candidate
			self.add_new_candidate_button_element.when_present(Utils::SHORT_TIMEOUT)
			self.add_new_candidate_button
			puts "Accessing to Add a new candidate..."
		end
end