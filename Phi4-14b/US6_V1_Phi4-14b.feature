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
    And the user is on the "Employee Management - Profile" page
    When the user selects a subordinate employee from their reporting structure
    Then the profile of the selected subordinate should be displayed

Scenario: Project manager blocked from non-subordinate profiles
    Given the user is logged in as "Project Manager"
    And the user is on the "Employee Management - Profile" page
    When the user attempts to access a profile not assigned as their subordinate
    Then the message "You do not have permission to access this profile." should be displayed

Scenario: HR staff accesses all employee profiles
    Given the user is logged in as "HR Staff"
    And the user is on the "Employee Management - Profile" page
    When the user navigates to any employee's profile
    Then the profile should be displayed without restrictions

Scenario: List of employee profiles displayed for HR staff
    Given the user is logged in as "HR Staff"
    And the user is on the "Employee Management - Profile" page
    When the user selects an employee profile from the list
    Then the details of the selected employee profile should be displayed

