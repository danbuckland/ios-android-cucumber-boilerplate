##
# Methods to create page objects from each screen class go here.
# Add your own screens below.
##

class Screens < Calabash::IBase

	def home
		@home ||= page(HomeScreen)
	end

	# Your screens here

end
