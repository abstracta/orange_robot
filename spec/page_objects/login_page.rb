class LoginPage
		include PageObject

	 	WAIT = Selenium::WebDriver::Wait.new(timeout: Utils::SHORT_TIMEOUT)

		text_field(:username_textbox, :id => "txtUsername")
		text_field(:password_textbox, :id => "txtPassword")
		button(:login_button, :id => "btnLogin")

		def login_with_username_and_password username, password
			self.username_textbox_element.when_present(Utils::SHORT_TIMEOUT)
			self.username_textbox = username
			self.password_textbox = password
			self.login_button
			puts "Loging..."
		end
end