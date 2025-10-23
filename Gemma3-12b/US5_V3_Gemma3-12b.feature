Feature: Changing order of tasks
As a user, I want to change the order of tasks in a directory so that I can arrange them according to priority or workflow

Background:
    Given the user is logged in as "User"
    And the user is on the "Task Management" page

Scenario: Task list displayed with sequence numbers
    Then the "Tasks" table should contain a "Sequence Number" column
    And each task in the "Tasks" table should have a numerical value in the "Sequence Number" column

Scenario: Arrow buttons displayed for single task selection
    When the user selects the first checkbox for a single task
    Then the "Arrow-up" button should be displayed
    And the "Arrow-down" button should be displayed
    When the user selects multiple checkboxes
    Then the "Arrow-up" button should be hidden
    And the "Arrow-down" button should be hidden
    When the user selects the first task checkbox
    Then the "Arrow-up" button should be disabled
    When the user selects the last task checkbox
    Then the "Arrow-down" button should be disabled

Scenario: Task moved up with 'Arrow-up' button
    When the user selects a task via checkbox
    And the user clicks the "Arrow-up" button
    Then the selected task should be moved one position higher in the "Tasks" table
    And the checkbox selection should remain

Scenario: Task moved down with 'Arrow-down' button
    When the user selects the checkbox for the last task in the "Tasks" table
    Then the "Arrow-down" button should be disabled
    When the user selects the checkbox for a task that is not the last in the "Tasks" table
    And the user clicks the "Arrow-down" button
    Then the task should move one position down in the "Tasks" table
    And the checkbox selection should remain after clicking the "Arrow-down" button

Scenario: Checkbox selection maintained after button click
    When the user selects the checkbox for the task with "<taskName>"
    And the user clicks the "Arrow-up" button
    Then the checkbox for the task with "<taskName>" should remain selected
    When the user clicks the "Arrow-down" button
    Then the checkbox for the task with "<taskName>" should remain selected

Scenario: Arrow buttons hidden with multiple selections
    When the user selects multiple tasks in the "Tasks" table
    Then the "Arrow-up" button should be hidden
    And the "Arrow-down" button should be hidden

Scenario: Arrow-up button disabled for first task
    When the user selects the first task via checkbox
    Then the "Arrow-up" button should be disabled

Scenario: Arrow-down button disabled for last task
    When the user selects the last task via checkbox
    Then the "Arrow-down" button should be disabled

