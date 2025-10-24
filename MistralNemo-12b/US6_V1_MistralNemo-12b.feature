Feature: Access to Employee Profile
As a system administrator, I want to restrict profile access by role so that sensitive data is protected and only authorized users can make changes

Scenario: User accesses own profile
    Given the user is logged in as "Employee"
    And the user is on the "Employee Management" page
    When the user clicks on their own profile link
    Then the "Profile" page should load successfully with the user's information

Scenario: Unauthorized access blocked with message
    Given the user is logged in as "Employee"
    When the user attempts to access another employee's profile
    Then the user sees the text: "You do not have permission to access this profile."

Scenario: Project manager accesses subordinates' profiles
    Given the user is logged in as "Project Manager"
    And the user is on the "Employee Management" page
    When the user selects an employee assigned as a subordinate from the list of employees
    Then the selected employee's profile should be displayed

Scenario: Access denied for profiles outside reporting structure
    Given the user is logged in as "Project Manager"
    When the user attempts to access an employee's profile outside their reporting structure
    Then the message "You do not have permission to access this profile." should be displayed

Scenario: HR staff accesses all employee profiles
    Given the user is logged in as "HR Staff"
    And the user is on the "Employee Management" page
    When the user selects any employee from the list
    Then the selected employee's profile should be displayed

Scenario: Access denied message shown
    Given the user is logged in as "Project Manager"
    And the user attempts to access the profile of an employee outside their reporting structure
    Then the message "You do not have permission to access this profile." should be displayed

Scenario: Project Manager accesses subordinate profiles
    Given the user is logged in as "Project Manager"
    And the user is on the "Employee Management" page
    When the user clicks on the profile of an employee assigned as a subordinate
    Then the employee's profile should be displayed

Scenario: HR staff blocked from unauthorized profiles
    Given the user is logged in as "HR Staff"
    And the user is on the "Employee Management" page
    When the user attempts to access an employee's profile
    Then the message "You do not have permission to access this profile." should be displayed

