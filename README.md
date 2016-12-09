#Installation

Before installation you need to install Ruby at least.

Then go to project's folder and run:
> bundle install

It will install all needed gems for you.

Note: In case of conflicts you may need to use strictly ruby version 2.1.2 and/or if it's related to nokogiri - just decrease the version to '1.6.7.2'.

#Execution

To run the test, go to folder by Terminal and run:

> cucumber features

It will run all features. Or use like (because currently there is only one feature accessible there):

> cucumber features/Restaurants.feature

For headless testing, you need to change the default_driver to "poltergeist" instead of "selenium" from features/support/env.rb

> #Capybara.default_driver = :selenium

> Capybara.javascript_driver = :poltergeist

Note: But pay attention that you may need to change '.click()' to '.trigger(click)' for poltergeist mode.

#Session

Working with the session is organised by creating 'capybara.rb' and using 'page.reset!' method to clear all things before opening the browser.

> config/initializers/capybara.rb

#Reporting / logging

Reporting and logging is done by creating cucumber.yml and all output is going to:

> logs/cucumber_tests.html
> logs/cucumber_tests.log

All failed scenarios will be screenshoted and put into:

> public/screenshots/screenshot_*.png

#Iterating

There are a couple options how you can run the same feature multiply times:

By using/running this command in the project folder (just change <500> to desired number of iterations):

> ruby -e '500.times { `cucumber features` }'

or by using 'rake' task as the following:

> rake --tasks

where is output:

```
rake features                      # Run Cucumber features
rake tests:iterations[name,times]  # Tests by iterations
```

And the run for <2 iterations> will look like:
> rake tests:iterations['Restaurants.feature',2]

The small example of output here is:

```
Executing feature: Restaurants.feature 2 times
/Users/shaft/.rvm/rubies/ruby-2.1.2/bin/ruby -S bundle exec cucumber features --format pretty
Using the default profile...
Feature: Restaurants
  As an anonymous user
  I want to search restaurants
  So that I can append pizza to restaurants, search them, apply filters and do other actions needed

  Background: User should open main page # features/Restaurants.feature:6
    Given user goes to the main page     # features/step_definitions/restaurants.rb:7

  Scenario: The system clears session after run # features/Restaurants.feature:10
    Given The system clears session after run   # features/step_definitions/restaurants.rb:12

1 scenario (1 passed)
2 steps (2 passed)
0m6.024s
/Users/shaft/.rvm/rubies/ruby-2.1.2/bin/ruby -S bundle exec cucumber features --format pretty
Using the default profile...
Feature: Restaurants
  As an anonymous user
  I want to search restaurants
  So that I can append pizza to restaurants, search them, apply filters and do other actions needed

  Background: User should open main page # features/Restaurants.feature:6
    Given user goes to the main page     # features/step_definitions/restaurants.rb:7

  Scenario: The system clears session after run # features/Restaurants.feature:10
    Given The system clears session after run   # features/step_definitions/restaurants.rb:12

1 scenario (1 passed)
2 steps (2 passed)
0m16.332s
```

#RESULT

It could be watched by this screencast prepared - http://take.ms/aVCK7
The result of run could be seen by opening 'cucumber_tests.html' and it should look like http://take.ms/IJMm5 . If any tests are failed - you'll see appropriate output there in red, like - http://take.ms/HckU8 .

The final run of 2 iterations tests is -  http://take.ms/fvXUj.

#Enjoy.
