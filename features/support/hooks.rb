Before do
  puts @browser.capabilities.browser_name + " " + @browser.capabilities.version
  @login_page = Login.new(@browser)
end