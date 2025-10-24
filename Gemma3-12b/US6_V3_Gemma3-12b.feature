Feature: Access to Employee Profile
As a system administrator, I want to restrict profile access by role so that sensitive data is protected and only authorized users can make changes

Scenario: Access own profile
    Given the user is logged in as "Employee"
    And the user is on the "Employee Management - Profile" page
    Then the user's own employee profile should be displayed

Scenario: Unauthorized access blocked
    Given the user is logged in as "Unauthorized User"
    And the user is on the "Employee Management - Profile" page
    Then the text "You do not have permission to access this profile." should be displayed

Scenario: Project manager accesses subordinate profiles
    Given the user is logged in as "Project Manager"
    And the user is on the "Employee Management - Profile" page
    When the user attempts to access the profile of a subordinate employee
    Then the subordinate employee's profile should be displayed
    When the user attempts to access the profile of an employee outside their reporting structure
    Then the text "You do not have permission to access this profile." should be displayed

Scenario: Project manager restricted from accessing outside reporting structure
    Given the user is logged in as "Project Manager"
    And the user is on the "Employee Management - Profile" page
    When the user attempts to access the profile of an employee outside their reporting structure
    Then the text "You do not have permission to access this profile." should be displayed

Scenario: HR staff access to all profiles
    Given the user is logged in as "HR Staff"
    And the user is on the "Employee Management - Profile" page
    When the user navigates to the profile of an employee outside their direct reporting structure
    Then the text "You do not have permission to access this profile." should be displayed
    When the user navigates to the profile of any employee within the organization
    Then the employee's profile information should be displayed

