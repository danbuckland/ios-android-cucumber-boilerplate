##
# Screen specific methods should be added to a class which inherits from the
# App class defined in '_app.rb'
##

class HomeScreen < App

  def trait
    "view id:'home_screen'"
  end

  def await
    wait_for_element_exists(trait)
  end

  def check_version_no
    query("UILabel id:'version_no'", :text).first
  end

  # Your screen specific methods here

end
