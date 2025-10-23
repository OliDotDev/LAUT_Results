Feature: Changing order of tasks
As a user, I want to change the order of tasks in a directory so that I can arrange them according to priority or workflow

Background:
    Given the user is logged in as "User"

Scenario: Move task up
    Given the user is on the "Task Management" page
    When the user selects a middle task via checkbox
    And the user clicks the "Arrow-up" button
    Then the selected task moves one position up in the sequence

Scenario: Move task down
    Given the user is on the "Task Management" page
    When the user selects a middle task via checkbox
    And the user clicks the "Arrow-down" button
    Then the selected task's sequence number decreases by one

Scenario: Disable 'up' button for first task
    Given the user navigates to the "Task Management" page
    When the user selects the checkbox of the first task
    Then the "Arrow-up" button remains disabled

Scenario: Disable 'down' button for last task
    Given the user is on the "Task Management" page
    When the user selects the last task via checkbox
    Then the "Arrow-down" button should be disabled

Scenario: Hide arrows for multiple tasks
    Given the user is on the "Task Management" page
    When the user selects more than one task via checkboxes
    Then both Arrow-up and Arrow-down buttons should be hidden

Scenario: Arrow-up button revealed on single task selection
    Given the user is on the "Task Management" page
    When the user selects a single checkbox next to a task
    Then the "Arrow-up" button should be visible

Scenario: Selected task moves up one position when Arrow-up is clicked
    Given the user is on the "Task Management" page
    When the user selects a task that is not the first one
    And the user clicks the "Arrow-up" button next to the selected task
    Then the selected task moves up one position in the sequence

Scenario: Selected task's sequence number decreases on Arrow-down click (not last)
    Given the user is on the "Task Management" page
    When the user selects the second task via checkbox
    And the user clicks the "Arrow-down" button
    Then the sequence number of the selected task decreases by one

Scenario: Checkbox selection persists after Add
    Given the user is on the "Task Management" page
    When the user selects a task via checkbox
    And the user clicks the "Add" button
    Then the selected task remains checked

Scenario: Checkbox selection persists after Delete
    Given the user is on the "Task Management" page
    When the user selects a task via checkbox
    And the user clicks the "Delete" button
    Then the selected task remains checked

Scenario: Arrow-up and Arrow-down buttons visible on multiple task selection
    Given the user is on the "Task Management" page
    When the user selects two or more tasks via checkboxes
    Then both the "Arrow-up" and "Arrow-down" buttons should remain visible

Scenario: Arrow-down button appears disabled when last task is selected
    Given the user is on the "Task Management" page
    When the user selects the last task in the "Tasks" table via checkbox
    Then the "Arrow-down" button should be disabled

