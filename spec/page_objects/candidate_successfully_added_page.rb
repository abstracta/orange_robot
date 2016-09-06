class CandidateSuccessfullyAddedPage
		include PageObject

	 	WAIT = Selenium::WebDriver::Wait.new(timeout: Utils::SHORT_TIMEOUT)

		button(:back_button, :id => "btnBack")
		button(:edit_button, :id => "btnSave")

		def candidate_was_added_correctly?
			returned_value = true

			begin
				self.back_button_element.when_present(Utils::LITTLE_TIMEOUT)
			rescue => e
				returned_value = false
			end

			returned_value
		end

		def go_to_back_page
			self.back_button_element.when_present(Utils::SHORT_TIMEOUT)
			self.back_button
		end
end