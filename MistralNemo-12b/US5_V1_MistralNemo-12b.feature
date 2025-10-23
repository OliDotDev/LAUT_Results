Feature: Changing order of tasks
As a user, I want to change the order of tasks in a directory so that I can arrange them according to priority or workflow

Background:
    Given the user is logged in as "User"
    And the user is on the "Task Management" page

Scenario: Move task up
    When the user selects a middle task via checkbox
    And the user clicks the "Arrow-up" button
    Then the selected task moves one position up in the sequence

Scenario: Move task down
    When the user selects a middle task via checkbox
    And the user clicks the "Arrow-down" button
    Then the selected task's sequence number decreases by one

Scenario: Disable 'up' button for first task
    When the user selects the first task via checkbox
    Then the "Arrow-up" button should be disabled

Scenario: Disable 'down' button for last task
    When the user selects the last task via checkbox
    Then the "Arrow-down" button should be disabled

Scenario: Verify initial order of tasks
    When the user checks the first task checkbox
    Then the sequence number of the first task should be 1
    And each subsequent task's sequence number should increment by 1

Scenario: Move task to top
    When the user selects a task via checkbox
    And the user clicks the "Arrow-up" button
    Then the selected task moves to the first position in the "Tasks" table
    And all other tasks maintain their original sequence numbers

Scenario: Move task to bottom
    When the user selects a task via checkbox
    And the user clicks the "Arrow-down" button
    Then the selected task moves to the last position in the "Tasks" table
    And all other tasks remain unaffected and retain their original positions

Scenario: Verify "Arrow-up" icon visibility
    When the user selects a single task via checkbox
    Then the button with an "Arrow-up" icon should be visible

Scenario: Verify "Arrow-down" icon visibility
    When the user selects exactly one task via checkbox
    Then the "Arrow-down" icon should be visible on the button

Scenario: Button state change after moving up
    When the user selects a task that is not the first one in the list
    And the user clicks the "Arrow-up" button next to the selected task
    Then the selected task moves up in the list
    And the "Arrow-up" button should be enabled

Scenario: Verify sequence number decrease when moving down
    When the user selects a task via checkbox that is not the last one
    And the user clicks the "Arrow-down" button
    Then the sequence number of the selected task decreases by one

Scenario: Verify checkbox remains checked after moving
    When the user selects a task via its checkbox
    And the user clicks the "Arrow-up" button
    Then the selected task moves one position up in the table
    And the checkbox selection remains checked for the moved task

Scenario: Hide arrow buttons for multiple selected tasks
    When the user selects more than one task via checkboxes
    Then the "Arrow-up" and "Arrow-down" buttons should be hidden

Scenario: Disable "Arrow-up" button for first task
    When the user selects the first task via checkbox
    Then the "Arrow-up" button should be disabled

Scenario: Enable "Arrow-down" button except for last task
    When the user selects any task except the last one via checkbox
    Then the "Arrow-down" button should be enabled

