Feature: Booking an Event
As a user, I want to book an event with a type and start/end dates so that the booking period is valid and categorized

Background:
    Given the user is logged in as "User"
    And the user is on the "Event Management - Booking form" page

Scenario: Initial display of form
    Then the "Event Type" dropdown should be visible
    And the "Start Date" input field should be visible
    And the "End Date" input field should be visible
    And the "Submit" button should be displayed
    And the "Cancel" button should be displayed

Scenario: Event Type required validation
    When the user leaves the "Event Type" dropdown without selecting a value
    And the user clicks the "Submit" button
    Then the validation message "This field is required." should be displayed for the "Event Type" dropdown

Scenario: Start Date required validation
    When the user selects "<eventType>" from the "Event Type" dropdown
    And the user leaves the "Start Date" input field empty
    And the user clicks the "Submit" button
    Then the validation message "This field is required." should be displayed for the "Start Date" input field

Scenario: End Date required validation
    When the user selects "<eventType>" from the "Event Type" dropdown
    And the user enters "<startDate>" into the "Start Date" input field
    And the user leaves the "End Date" input field empty
    And the user clicks the "Submit" button
    Then the validation message "This field is required." should be displayed for the "End Date" input field

Scenario: Invalid date format validation
    When the user selects "<eventType>" from the "Event Type" dropdown
    And the user enters "<invalidDate>" into the "Start Date" input field
    And the user clicks the "Submit" button
    Then the validation message "Value is not a valid date." should be displayed for the "Start Date" input field

Scenario: End Date before Start Date validation
    When the user selects "<eventType>" from the "Event Type" dropdown
    And the user enters "<startDate>" into the "Start Date" input field
    And the user enters "<endDate>" into the "End Date" input field
    And the user clicks the "Submit" button
    Then the validation message "End Date must be the same as or later than Start Date." should be displayed for the "End Date" input field

Scenario: Successful booking and redirect
    When the user selects "<eventType>" from the "Event Type" dropdown
    And the user enters "<startDate>" into the "Start Date" input field
    And the user enters "<endDate>" into the "End Date" input field
    And the user clicks the "Submit" button
    Then the user should be redirected to the "Event overview" page

Scenario: Form cancellation and redirect
    When the user clicks the "Cancel" button
    Then the form should be closed
    And the user should be redirected to the "Event overview" page

Scenario: Invalid end date validation message displayed
    When the user selects "<eventType>" from the "Event Type" dropdown
    And the user enters an invalid date into the "End Date" input field
    And the user clicks the "Submit" button
    Then the validation message "Value is not a valid date." should be displayed for the "End Date" input field

