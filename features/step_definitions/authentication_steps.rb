Given /I am on the login page/i do
  @browser.first(:link, 'LOGIN').click
end

Given /I login with an Invalid User/i  do
  @login_page.login=("richdownie")
  @login_page.password=("new_yorker")
  @login_page.login.click
end