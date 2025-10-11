Feature: Access to Employee Profile
As a system administrator
I want to restrict profile access by role
so that sensitive data is protected and only authorized users can make changes.

Scenario: User can access own profile
    Given the user is logged in as "user"
    When the user navigates their own profile
    Then the user should be able to access their own profile

Scenario: User cannot access other profile
    Given the user is logged in as "user"
    When the user navigates to the profile of "<anotherUser>"
    Then the user should not be able to access the profile of "<anotherUser>"
    And the current page should show a "You do not have permission to access this profile." text

Scenario: Projekt manager can access subordinate profiles
    Given the user is logged in as "project manager"
    When the user navigates to the profile of "<subordinateUser>"
    Then the user should be able to access the profile of "<subordinateUser>"

Scenario: Projekt manager cannot access non-subordinate profiles
    Given the user is logged in as "project manager"
    When the user navigates to the profile of "<nonSubordinateUser>"
    Then the user should not be able to access the profile of "<nonSubordinateUser>"
    And the current page should show a "You do not have permission to access this profile." text

Scenario: HR staff can access all profiles
    Given the user is logged in as "HR staff"
    When the user navigates to the profile of "<anyUser>"
    Then the user should be able to access the profile of "<anyUser>"