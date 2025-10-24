Feature: Access to Employee Profile
As a system administrator, I want to restrict profile access by role so that sensitive data is protected and only authorized users can make changes

Scenario: Unauthorized profile access blocked
    Given the user is logged in as "Project Manager"
    And the user is on the "Employee Management - Profile" page
    When the user attempts to access another employee's profile
    Then the text "You do not have permission to access this profile." should be displayed

Scenario: Project manager accesses subordinate profiles
    Given the user is logged in as "Project Manager"
    And the user is on the "Employee Management - Profile" page
    When the user navigates to an employee's profile who is assigned as their subordinate
    Then the employee's profile should be displayed
    When the user navigates to an employee's profile outside their reporting structure
    Then the page should display the text: "You do not have permission to access this profile."

Scenario: HR staff accesses all employee profiles
    Given the user is logged in as "HR Staff"
    When the user navigates to the "Employee Management - Profile" page
    Then all employee profiles should be displayed
    And no permission error message should be shown

