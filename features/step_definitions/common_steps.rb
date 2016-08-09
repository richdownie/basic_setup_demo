Given /I should (NOT )?see "(.*)" on the page/i do |visibility, text|
  text = text.to_s.strip
  if (visibility.to_s.strip == 'NOT') then
    @browser.find_element(:tag_name => "body").text.should_not include("#{text}")
  else
    @browser.find_element(:tag_name => "body").text.should include("#{text}")
  end
end

Given /I should (NOT )?be on the "(.*)" page/ do |visibility, value|
  url = @browser.current_url.to_s
  if (visibility.to_s.strip == 'NOT') then
     url.should_not include value
  else
    Selenium::WebDriver::Wait.new(:timeout => 5).until {@browser.current_url.to_s.should include value}
  end
end