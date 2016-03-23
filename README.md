Boilerplate code for starting a new BDD Android project using Cucumber with
Calabash and a Page Object Model structure.


## Documentation

In most cases this code is intended to be self documenting, i.e. there are explanatory comments in many of the files. This Readme focuses on explaining how to run the tests and provides insight into decisions made with regards to structure and naming conventions.

## Running tests

This code was created with the intention of providing a solid base that can be extended into a full BDD test suite for your own cross-platform applications. Example applications – **example.apk** and **example.app** have been provided along with a single passing scenario for demo purposes.

To run, you'll need to have a version of Ruby greater than 2.0 installed. I'd recommend using [RVM](https://rvm.io/) with the latest stable version of Ruby, and [creating](https://rvm.io/gemsets/creating) and [using](https://rvm.io/gemsets/using) a specific Gemset for running the tests.

1. In a terminal, navigate to the project root directory.
2. Enter `gem install bundler` to install **bundler**.
3. Enter `bundle install` to install required Ruby gems including **cucumber**, **calabash-android** and **calabash-cucumber** (iOS).

#### Android

1. Enter `calabash-android run build/example.apk -p android` to install the built app and run the example scenario.

#### iOS

1. Enter `cucumber -p ios` to install the iOS app on a simulator and run the example scenario.

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
All feature files should be placed in the `features/` directory and use the `.feature` extension. Features should be UI agnostic, i.e. they don't refer to specific on screen elements, and simultaneously describe the behaviours of the app on both platforms.

#### Add step definitions for your feature
Step definitions are platform specific, i.e. they are different for iOS and Android, and should be placed in the respective `features/android/step_definitions` or `features/ios/step_definitions` directories and use the `.rb` extension.

#### Create your first page object
Page objects are platform specific and appear in the `features/android/screens` or `features/ios/screens` directories. The **HomeScreen** object in each can be renamed and used as your own page object. For iOS:

  1. Rename the file `features/ios/screens/home_screen.rb` to match with your own screen name.
  2. In the renamed file, rename the `HomeScreen` class to match your screen name.
  3. In `features/ios/screens/_screens.rb` rename the `home` method to the name you want to use for your screen when calling its methods.
  4. Change the line `@home ||= page(HomeScreen)` to reference your method name and class name.

#### Add additional page objects
You should create additional page objects with screen specific methods for each new screen/activity/dialog in your application:
  1. All page objects should be added to the `features/ios/screens/` and `features/android/screens/` directories and use the `.rb` extension.
  2. Each page object should contain a single class matching your screen name.
  3. Add a new method to the platform specific `_screens.rb` file with the name you want to use for your screen when calling its methods.
  4. Add the line `@yourscreen ||= page(YourScreen)` to the new method referencing your page object's class and the name by which you want to refer to the screen.

## Copyright

Copyright (c) 2016 Dan Buckland and Contributors. See LICENSE for details.
