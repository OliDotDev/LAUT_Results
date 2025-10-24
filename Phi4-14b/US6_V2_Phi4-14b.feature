Feature: Access to Employee Profile
As a system administrator, I want to restrict profile access by role so that sensitive data is protected and only authorized users can make changes

Scenario: User accesses own profile
    Given the user is logged in as "Employee"
    When the user navigates to their own employee profile page
    Then the employee profile should be displayed

Scenario: Unauthorized access blocked for other profiles
    Given the user is logged in as "Employee"
    And the user is on the "Employee Management - Profile" page
    When the user attempts to access another employee's profile without permission
    Then the message "You do not have permission to access this profile." should be displayed

Scenario: Project manager accesses subordinate profiles
    Given the user is logged in as "Project Manager"
    And the user has subordinates with IDs ["emp1", "emp2"]
    And the user is on the "Employee Management - Profile" page
    When the user selects a direct subordinate's profile from the list
    Then the selected employee's profile should be displayed
    When the user clicks the profile link for an unauthorized employee ID "emp3"
    Then the page should show the text: "You do not have permission to access this profile."

Scenario: Project manager blocked from non-subordinate profiles
    Given the user is logged in as "Project Manager"
    And the user is on the "Employee Management - Profile" page
    When the user attempts to access a profile not assigned as their subordinate
    Then the message "You do not have permission to access this profile." should be displayed

Scenario: HR staff accesses all employee profiles
    Given the user is logged in as "HR Staff"
    And the user is on the "Employee Management - Profile" page
    When the user navigates to any employee's profile within the organization
    Then the profile should be displayed without restrictions

