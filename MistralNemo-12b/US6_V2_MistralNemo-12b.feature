Feature: Access to Employee Profile
As a system administrator, I want to restrict profile access by role so that sensitive data is protected and only authorized users can make changes

Scenario: User accesses own profile
    Given the user is logged in as "Employee"
    When the user clicks on their own profile link
    Then the "Profile" page should load successfully with the user's information

Scenario: Access denied for unauthorized users
    Given the user is logged in as an employee without access permissions
    When the user attempts to access another employee's profile
    Then the message "You do not have permission to access this profile." should be displayed

Scenario: Project managers can access subordinates' profiles
    Given the user is logged in as "Project Manager"
    And the user has a subordinate with the employee ID "<subordinateID>"
    When the user navigates to the profile page of the subordinate with ID "<subordinateID>"
    Then the user should be able to view and edit the subordinate's profile

Scenario: Access denied for project managers outside reporting structure
    Given the user is logged in as "Project Manager"
    When the user attempts to access the profile of an employee not within their reporting structure
    Then the message "You do not have permission to access this profile." should be displayed

Scenario: HR Staff Access All Profiles
    Given the user is logged in as "HR Staff"
    And the user navigates to the "Employee Management" page
    When the user selects any employee from the list
    Then the selected employee's profile should be displayed without any permission errors
    And the user should be able to view and edit that employee's profile

Scenario: Non-permitted users denied access
    Given the user is logged in as "Project Manager"
    And the user attempts to access the profile of an employee not assigned under them
    When the user navigates to the employee's profile page
    Then the user is redirected back to the dashboard with the message "You do not have permission to access this profile."

Scenario: Restricted Profile Access - Project Manager
    Given the user is logged in as "Project Manager"
    And the user navigates to the "Employee Management" page
    When the user selects an employee who is not their subordinate from the list
    Then the message "You do not have permission to access this profile." should be displayed

Scenario: Restricted Profile Access for Project Managers
    Given the user is logged in as "Project Manager"
    And the user tries to access the profile of an employee outside their reporting structure
    Then the message "You do not have permission to access this profile." should be displayed

Scenario: HR Staff Access All Profiles
    Given the user is logged in as "HR Staff"
    And the user navigates to "Employee Management" and selects "Profile"
    When the user searches for any employee's profile
    Then the user should be able to view the selected employee's profile

Scenario: Unauthorized users denied access with message
    Given the user is not logged in
    When the user tries to access an employee profile via URL
    Then the page should display the message "You do not have permission to access this profile."

Scenario: Invalid credentials display access denial message
    Given the user is logged in as "System Administrator"
    And the user navigates to another employee's profile
    When the user enters incorrect credentials for the target employee
    Then the message "You do not have permission to access this profile." should be displayed on the page

