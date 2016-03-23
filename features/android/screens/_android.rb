##
# Generic Android methods should be added here.
# A non working example is included below.
##

class Android < Calabash::ABase

  def wait_for_progress_to_complete
    wait_for_element_does_not_exist("android.widget.ProgressBar")
  end

  # Your generic Android methods here

end
