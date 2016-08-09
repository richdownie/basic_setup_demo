Given /I am on the login page/i do
  @browser.first(:link, 'LOGIN').click
end

Given /I login with an Invalid User/i  do
  @login_page.login=("richdownie")
  @login_page.password=("new_yorker")
  @login_page.login.click
  #Enable Applitools below to verify the Login Page is styled correctly
  # eyes = Applitools::Eyes.new
  # eyes.api_key = 'api_key'git 
  # eyes.test(app_name: 'E-xact Transactions Ltd. - Please Log In', test_name: 'E-xact Transaction Login page', viewport_size: {width: 1024, height: 768}, driver: @browser) do |driver|
  #   eyes.check_window('E-xact Transactions Ltd. - Please Log In')
  # end
end