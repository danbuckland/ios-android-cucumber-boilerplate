##
# Step definitions specific to the feature file 'view_app_info.feature' go here.
##

Then(/^I should see the version number "(.*?)"$/) do |version_no|
  unless @screen.home.check_version_no == version_no
    raise 'Incorrect version number displayed'
  end
end
