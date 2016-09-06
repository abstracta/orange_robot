require 'rspec'
require 'selenium-webdriver'
require 'byebug'
require 'require_all'
require 'page-object'
require 'colorize'

require_all 'spec/methods/*.rb'
require_all 'spec/page_objects/*.rb'

# Configuration loaded on the start
RSpec.configure do |config|
  
  config.before(:all) do
    $session = Selenium::WebDriver.for :firefox
	$session.manage.window.maximize
  end

  config.after(:all) do
  	$session.quit
  end
end