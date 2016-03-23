if ENV['PLATFORM'] == 'android'
  require 'calabash-android/cucumber'
  require 'calabash-android/abase'
elsif ENV['PLATFORM'] == 'ios'
  require 'calabash-cucumber/cucumber'
  require 'calabash-cucumber/ibase'
end
