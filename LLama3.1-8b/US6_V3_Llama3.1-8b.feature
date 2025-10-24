Feature: Access to Employee Profile
As a system administrator, I want to restrict profile access by role so that sensitive data is protected and only authorized users can make changes

Scenario: Self-profile accessible
    Given the user is logged in as "System Administrator"
    And the user is on the "Employee Management - Profile" page
    When the user clicks their own profile link
    Then the user's own profile should be displayed without any restrictions
    When the user attempts to view another employee's profile without permission
    Then the page should display the text "You do not have permission to access this profile."

Scenario: Access denied for other profiles
    Given the user is logged in as "System Administrator"
    And the user is on the "Employee Management - Profile" page
    When the user tries to access another employee's profile
    Then the text "You do not have permission to access this profile." should be displayed

Scenario: Project manager accesses subordinate profiles
    Given the user is logged in as "Project Manager"
    And an employee is assigned as a subordinate to the project manager
    And the user is on the "Employee Management - Profile" page
    When the user attempts to access their own profile
    Then the user's own profile should be accessible
    When the user navigates to an employee's profile who is assigned as their subordinate
    Then the employee's profile should be displayed
    When the user attempts to access an employee profile that is not assigned to them
    Then the text "You do not have permission to access this profile." should be displayed

Scenario: HR staff accesses all employee profiles
    Given the user is logged in as "HR Staff"
    And the user is on the "Employee Management - Profile" page
    When the user clicks on their own profile
    Then the employee profile should be displayed
    When the user clicks on an employee's profile link
    Then the employee's profile should be displayed
    When the user clicks on another employee's profile link who is not in their reporting structure
    Then the page should display the text: "You do not have permission to access this profile."

