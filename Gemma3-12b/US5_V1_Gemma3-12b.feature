Feature: Changing order of tasks
As a user, I want to change the order of tasks in a directory so that I can arrange them according to priority or workflow

Background:
    Given the user is logged in as "User"
    And the user is on the "Task Management" page

Scenario: Task list displayed with sequence numbers
    Then the "Tasks" table should display a "Sequence Number" column
    And each task in the "Tasks" table should have a numerical value in the "Sequence Number" column

Scenario: Arrow buttons displayed for single task selection
    When the user selects the first checkbox for a single task
    Then the "Arrow-up" button should be displayed
    And the "Arrow-down" button should be displayed

Scenario: Arrow buttons displayed for multiple task selection
    When the user selects multiple checkboxes
    Then the "Arrow-up" button should be hidden
    And the "Arrow-down" button should be hidden

Scenario: Task moved up with "Arrow-up" button
    When the user selects the checkbox for the first task
    Then the "Arrow-up" button should be disabled
    When the user selects the checkbox for a task other than the first task
    And the user clicks the "Arrow-up" button
    Then the selected task should move one position up in the table

Scenario: Task moved down with "Arrow-down" button
    When the user selects a task via checkbox
    And the user clicks the "Arrow-down" button
    Then the selected task should be moved one position down in the "Tasks" table
    And the checkbox selection should remain

Scenario: Checkbox selection maintained after button click
    When the user selects the checkbox for the first task
    Then the "Arrow-up" button should be displayed
    And the "Arrow-down" button should be displayed
    When the user clicks the "Arrow-up" button
    Then the checkbox selection for the first task should remain

Scenario: Arrow buttons hidden when multiple tasks are selected
    When the user selects multiple tasks via checkbox
    Then the "Arrow-up" button should be hidden
    And the "Arrow-down" button should be hidden

Scenario: Arrow-up button disabled for first task
    When the user selects the first task checkbox
    Then the "Arrow-up" button should be disabled

Scenario: Arrow-down button disabled for last task
    When the user selects the last task via checkbox
    Then the "Arrow-down" button should be disabled

