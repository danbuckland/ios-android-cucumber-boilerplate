##
# App specific methods that are screen agnostic should be added here.
# An example is included below.
##

class App < Calabash::ABase

  def clear_settings
    unless get_preferences("prefs")["user"] == nil
      backdoor('clearSettings',[])
      start_test_server_in_background
    end
  end

  # Your screen agnostic methods here

end
