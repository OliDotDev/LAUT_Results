Feature: Access to Employee Profile
As a system administrator, I want to restrict profile access by role so that sensitive data is protected and only authorized users can make changes

Scenario: Self-profile accessible
    Given the user is logged in as "System Administrator"
    And the user is on the "Employee Management - Profile" page
    When the user clicks their own profile link
    Then their own employee profile should be displayed
    When the user attempts to access another employee's profile
    Then the page should show the text: "You do not have permission to access this profile."

Scenario: Unauthorized attempts blocked with permission message
    Given the user is logged in as "Project Manager"
    And the user is on the "Employee Management - Profile" page
    When the user attempts to access a profile of an employee not assigned as their subordinate
    Then the text "You do not have permission to access this profile." should be displayed

Scenario: HR staff access all profiles
    Given the user is logged in as "HR Staff"
    And the user is on the "Employee Management - Profile" page
    When the user attempts to access an employee's profile
    Then the text "You do not have permission to access this profile." should be displayed
    Given the user is logged in as "HR Staff"
    When the user navigates to their own employee profile
    Then the page should display the employee's profile information

Scenario: Project managers access subordinate profiles
    Given the user is logged in as "Project Manager"
    And the user is on the "Employee Management - Profile" page
    When the user clicks on an employee profile who is assigned to them as a subordinate
    Then the employee's profile should be displayed
    Given the user is logged in as "Project Manager"
    When the user tries to access a profile of an employee not assigned as their subordinate
    Then the text "You do not have permission to access this profile." should be displayed