Feature: Access to Employee Profile
As a system administrator, I want to restrict profile access by role so that sensitive data is protected and only authorized users can make changes

Scenario: Own Profile Access
    Given the user is logged in as "System Administrator"
    And the user navigates to the "Employee Management" page
    When the user selects their own profile from the list
    Then the "Profile" page should be displayed with all fields editable

Scenario: Unauthorized Profile Access Blocked
    Given the user is logged in as "System Administrator"
    And the user navigates to the profile of another employee
    When the user attempts to access the profile without permission
    Then the message "You do not have permission to access this profile." should be displayed

Scenario: Project Manager Access to Subordinates
    Given the user is logged in as "Project Manager"
    And the user has employees assigned as subordinates
    When the user navigates to the profile of an employee who is a subordinate
    Then the user should be able to view and edit the employee's profile
    When the user navigates to an employee's profile who is not their subordinate
    Then the message "You do not have permission to access this profile." should be displayed
    Given the user navigates to the profile of one of their subordinates
    Then the profile page should load successfully

Scenario: Access Denied for Non-Subordinates
    Given the user is logged in as "Project Manager"
    When the user attempts to access the profile of an employee not within their reporting structure
    Then the message "You do not have permission to access this profile." should be displayed

Scenario: HR Staff Access All Profiles
    Given the user is logged in as "HR Staff"
    When the user navigates to the "Employee Management" page
    Then all employee profiles should be accessible from the list
    When the user selects an employee from the list
    Then the selected employee's profile should be displayed

Scenario: User accesses own profile
    Given the user is logged in as "Employee"
    And the user is on any page
    When the user clicks the "Profile" button
    Then the user should be redirected to their personal profile

Scenario: Access denied for other employees' profiles
    Given the user is logged in as "Project Manager"
    And the user tries to access another employee's profile
    Then the message "You do not have permission to access this profile." should be displayed

Scenario: Project manager cannot edit unauthorized employee's profile
    Given the user is logged in as "Project Manager"
    And the user attempts to access the profile of an employee not assigned as their subordinate
    When the user tries to edit the employee's profile
    Then the message "You do not have permission to access this profile." should be displayed

Scenario: HR Staff Access All Profiles
    Given the user is logged in as "HR Staff"
    And the user is on the "Employee Management" page
    When the user selects any employee from the list
    Then the selected employee's profile should be displayed

