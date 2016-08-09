require 'rubygems'
require 'bundler'
require 'gmail'
require 'httparty'
require 'net/ssh'
require 'rspec'
require 'jenkins_api_client'
require 'hipchat'

namespace :test_server do
  desc "Do a git pull on a remote test server and restart all the things from the CLI"
  task :deploy do
      Net::SSH.start('<machine>', '<username>', :password => "<passowrd") do |ssh|
      output = ssh.exec!("cd <app_path> && git checkout db && git fetch && git reset --hard origin/master && bundle --local && bundle exec rake db:migrate && bin/rake assets:precompile")
      puts output
    end
  end
  
  desc "Run all Cucumber Selenium Integration Tests and send notifications of an test failures"
  task :run_tests
    Bundler.with_clean_env do
    console_output = ""
    IO.popen("cucumber --format html --out=Selenium_Build.html --format pretty", 'r+') do |pipe|
      puts console_output = pipe.read
      if console_output.to_s =~ /failed/
        #SEND EMAIL 
        #POST TO SLACK => HTTParty.get("https://slack.com/api/chat.postMessage?token=<token>&channel=%<channel>&text=#{output}")
        #POST TO HIPCHAT
      end
      pipe.close_write
    end
  end
  
  desc "SSH into test server and grep logs for any Error(s)"
  task :grep_logs do
    include HTTParty
      Net::SSH.start('<machine>', '<username>', :password => "<passowrd>") do |ssh|
      output = ssh.exec!("cd <app_path>/log && tail -n 250 test_server.log")
      if output.include? "Error"
        #SEND EMAIL 
        #POST TO SLACK
        HTTParty.get("https://slack.com/api/chat.postMessage?token=<token>&channel=%<channel>&text=#{output}")
        #POST TO HIPCHAT
      end
    end
  end
end