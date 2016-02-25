##
# Screen specific methods should be added to a class which inherits from the
# Android class defined in '_android.rb'
##

class HomeScreen < Android

  def trait
    'MainActivity'
  end

  def await
    wait_for_activity(trait)
  end

  def check_version_no
    wait_for_element_exists("* id:'home_version_text'", :timeout => 2,
                            :screenshot_on_error => false)
    query("* id:'home_version_text'", :text).first
  end

  # Your screen specific methods here

end
