Feature: Changing order of tasks
As a user, I want to change the order of tasks in a directory so that I can arrange them according to priority or workflow

Background:
    Given the user is logged in as "User"
    And the user is on the "Task Management" page

Scenario: Move task up
    When the user selects a task via checkbox, but not the first one
    And the user clicks the "Arrow-up" button
    Then the selected task's position moves one step up in the sequence

Scenario: Move task down
    When the user selects a task via checkbox that is not the last one
    And the user clicks the "Arrow-down" button next to the selected task
    Then the selected task moves down by one position in the sequence

Scenario: Disable 'Arrow-up' for first task
    When the user selects the first task via checkbox
    Then the "Arrow-up" button should be disabled

Scenario: Disable 'Arrow-down' for last task
    When the user selects the checkbox next to the last task
    Then the "Arrow-down" button should be disabled

Scenario: Tasks ordered by Sequence Number
    When the user selects a single task via checkbox
    Then an "Arrow-up" button and an "Arrow-down" button are displayed
    And clicking the "Arrow-up" button moves the selected task one position up in the table
    And clicking the "Arrow-down" button moves the selected task one position down in the table

Scenario: First task 'Arrow-up' button disabled
    When the user selects the first task via checkbox
    Then the "Arrow-up" button should be disabled

Scenario: Last task 'Arrow-down' button disabled
    When the user selects the last task in the table
    Then the "Arrow-down" button should be disabled

Scenario: Arrow buttons appear when single task selected
    When the user selects a single task via checkbox
    Then the button with an "Arrow-up" icon should be visible
    And the button with an "Arrow-down" icon should be visible

Scenario: Task moves up confirmation shown
    When the user selects a task via checkbox that is not the first one
    And the user clicks the "Arrow-up" button
    Then a confirmation message should be displayed indicating that the task has moved up one position

Scenario: Task moves down on 'Arrow-down' click
    When the user selects a task that is not the last one
    And the user clicks the "Arrow-down" button next to the selected task
    Then the selected task moves down by one position in the list

Scenario: Checkbox selection persists after moving a task up
    When the user selects the checkbox next to task number 5
    And the user clicks the "Arrow-up" button
    Then task number 5 moves up to position 4
    And the checkbox selection remains checked for task number 4

Scenario: Arrow buttons hidden for multiple selected tasks
    When the user selects more than one task via checkbox
    Then the "Arrow-up" and "Arrow-down" buttons are not visible

Scenario: First task 'Arrow-up' button visually disabled
    When the user selects the first task via checkbox
    Then the "Arrow-up" button should be disabled

Scenario: Last task 'Arrow-down' button visually disabled
    Given all tasks are listed in the "Tasks" table
    When the user selects the last task via checkbox
    Then the "Arrow-down" button should be disabled

