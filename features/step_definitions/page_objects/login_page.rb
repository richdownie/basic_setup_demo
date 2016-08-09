class Login
  include PageObject
  
  text_field(:login, :id => "login_name")
  text_field(:password, :id => "login_password")
  
  def login
    @browser.first(:name, 'commit')
  end
end