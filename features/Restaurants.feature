Feature: Restaurants
  As an anonymous user
  I want to search restaurants
  So that I can append pizza to restaurants, search them, apply filters and do other actions needed

  Background: User should open main page
    Given The system clears session before run
    And user goes to the main page
    When user fills the Find box with "Restaurants" keyword
    And user fills the Near box with "San Francisco, CA" keyword
    And user waits 1 second
    And user clicks on the "Search button" button

  @javascript
  Scenario: User does a search by Restaurants keyword and checks result shown
    Then user should see "Best Restaurants in San Francisco, CA"
    And user should see report of TOTAL no. of Search results shown
    And user should see report of TOTAL no. of results on the current page shown

  @javascript
  Scenario: User does a search by Restaurants Pizza keyword and checks result shown
    When user fills the Find box with "Restaurants Pizza" keyword
    And user fills the Near box with "San Francisco, CA" keyword
    And user waits 1 second
    And user clicks on the "Search button" button
    Then user should see "Best Restaurants Pizza in San Francisco, CA"

  @javascript
  Scenario: User does a search by Restaurants keyword and applies the filters by: Neighborhoods, Price, Features and Category
    And user applies the filters by: Neighborhoods, Price, Features and Category
    And user waits 3 second
    Then user should see TOTAL report no. of Search results with no. of results in the current page
    And user should see "4.0 star rating"
    And user should see "3.5 star rating"
    And I uncheck Order Pickup or Delivery checkbox

  @javascript
  Scenario: User does a search by Restaurants keyword, applies the filters, open first element and log all critical information
    And user applies the filters by: Neighborhoods, Price, Features and Category
    And user waits 3 second
    And user expands the first element from the search result page
    And user waits 2 second
    Then user should see "Amber India"
    And user should be able to save all critical information for the reporting purposes
