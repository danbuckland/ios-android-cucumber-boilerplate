require 'calabash-cucumber/launcher'

# You can find examples of more complicated launch hooks in these
# two repositories:
#
# https://github.com/calabash/ios-smoke-test-app/blob/master/CalSmokeApp/features/support/01_launch.rb
# https://github.com/calabash/ios-webview-test-app/blob/master/CalWebViewApp/features/support/01_launch.rb

module Calabash::Launcher
  @@launcher = nil

  def self.launcher
    @@launcher ||= Calabash::Cucumber::Launcher.new
  end

  def self.launcher=(launcher)
    @@launcher = launcher
  end
end

Before do |scenario|

  ##
  # Create page objects which allows methods methods to be called in step
  # definitions the following way:
  #
  #   @platform.wait_for_progress_to_complete
  #   @app.clear_settings
  #   @screen.home.await
  #
  ##
  @platform ||= page(Ios)
  @app      ||= page(App)
	@screen   ||= page(Screens)

  scenario_tags = scenario.source_tag_names
  condition = (scenario_tags.include?('@reinstall') || scenario_tags.include?('@reset')) ? true : false

  launcher = Calabash::Launcher.launcher
  options = {
    reset: condition
  }

  launcher.relaunch(options)
  launcher.calabash_notify(self)
end

After do |scenario|
  # Calabash can shutdown the app cleanly by calling the app life cycle methods
  # in the UIApplicationDelegate.  This is really nice for CI environments, but
  # not so good for local development.
  #
  # See the documentation for QUIT_APP_AFTER_SCENARIO for a nice debugging workflow
  #
  # http://calabashapi.xamarin.com/ios/file.ENVIRONMENT_VARIABLES.html#label-QUIT_APP_AFTER_SCENARIO
  # http://calabashapi.xamarin.com/ios/Calabash/Cucumber/Core.html#console_attach-instance_method
  if launcher.quit_app_after_scenario?
    calabash_exit
  end
end
