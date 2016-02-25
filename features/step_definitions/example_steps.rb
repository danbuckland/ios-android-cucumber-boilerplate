##
# Step definitions specific to the feature file 'example.feature' go here.
##

Then(/^I should see the version number "(.*?)"$/) do |expected_version|
  app_version = @screen.home.check_version_no
  unless app_version == expected_version
    raise "Saw #{app_version} instead of #{expected_version}"
  end
end
