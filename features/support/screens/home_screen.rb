##
# Screen specific methods should be added to a class which inherits from the
# Android class defined in '_android.rb'
##

class HomeScreen < App

  def trait
    'MainActivity'
  end

  def await
    wait_for_activity(trait)
  end

  def check_version_no
    query("* id:'home_version_text'", :text).first
  end

  # Your screen specific methods here

end
