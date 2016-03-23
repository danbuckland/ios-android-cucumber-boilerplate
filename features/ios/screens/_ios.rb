##
# Generic iOS methods should be added here.
# A non working example is included below.
##

class Ios < Calabash::IBase

  def wait_for_progress_to_complete
    wait_for_no_network_indicator
  end

  # Your generic iOS methods here

end
