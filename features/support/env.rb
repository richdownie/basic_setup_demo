require 'selenium-webdriver'
require 'rspec'
require 'page-object'
require 'pry'
require 'pry-byebug'
require 'eyes_selenium'

World(PageObject::PageFactory)

Before do
  @browser = Selenium::WebDriver.for :chrome
  @browser.get("http://www.e-xact.com")
end