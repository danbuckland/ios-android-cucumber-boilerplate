Boilerplate code for starting a new BDD Android project using Cucumber with
calabash-android and a Page/Screen Object Model structure.


## Documentation

In most cases this code is intended to be self documenting, i.e. there are explanatory comments in many of the files. This Readme focuses on explaining how to run the tests and provide insight into decisions made with regards to structure and naming conventions.

## Running tests

This code was created with the intention of providing a solid base that can be extended into a full BDD test suite for your own Android application. An example application **example.apk** has been provided along with a passing scenario for demo purposes.

To run, you'll need to have a version of Ruby greater than 2.0 installed. I'd recommend using [RVM](https://rvm.io/) with the latest stable version of Ruby, and [creating](https://rvm.io/gemsets/creating) and [using](https://rvm.io/gemsets/using) a specific Gemset for running the tests.

1. In a terminal, navigate to the project root directory.
2. Enter `gem install bundler` to install **bundler**.
3. Enter `bundle install` to install required Ruby gems including **cucumber** and **calabash-android**.
4. Enter `calabash-android run build/example.apk` to install the built app and run the example scenarios.


## Adding to your own project

Clone this repository and place the files in your project's root folder, then do the following:

#### Safely remove example files
The following files and folders are specific to the **example** application, or are otherwise not required, and can safely be deleted:
  * `build/`
  * `features/example.feature`
  * `LICENSE`
  * `README.md`
  * `features/step_definitions/example_steps.rb`

#### Add your first .feature file
All feature files should be placed in the `features/` directory and use the `.feature` extension.

#### Add step definitions for your feature
All step definitions should be placed in the `features/step_definitions` directory and use the `.rb` extension.

#### Create your first page object
The **HomeScreen** object can be renamed and used as your own page object:
  1. Rename the file `features/support/screens/home_screen.rb` to match with your own screen name.
  2. In the renamed file, rename the `HomeScreen` class to match your screen name.
  3. In `features/support/screens/_screens.rb` rename the `home` method to the name you want to use for your screen when calling its methods.
  4. Change the line `@home ||= page(HomeScreen)` to reference your method name and class name.

#### Add additional page objects
You should create additional page objects with screen specific methods for each new screen/activity/dialog in your application:
  1. All page objects should be added to the `features/support/screens/` directory and use the `.rb` extension.
  2. Each page object should contain a single class matching your screen name.
  3. Add a new method to `features/support/screens/_screens.rb` with the name you want to use for your screen when calling its methods.
  4. Add the line `@yourscreen ||= page(YourScreen)` to the new method referencing your page object's class and the name by which you want to refer to the screen.

## Copyright

Copyright (c) 2016 Dan Buckland and Contributors. See LICENSE for details.
