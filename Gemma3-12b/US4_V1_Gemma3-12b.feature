Feature: Adding a new document
As a user, I want to upload documents and tag them so that they are easy to find later

Background:
    Given the user is logged in as "User"
    And the user is on the "Document Management - Directory overview" page

Scenario: Initial display
    Then the "Add new document" button should be displayed

Scenario: Add new document modal displayed
    When the user clicks the "Add new document" button
    Then the "Add new document" modal should be displayed
    And the "Name" input field should be visible
    And the "Document" file input should be displayed
    And the "Tags" dropdown should be visible

Scenario: Name field required validation
    When the user clicks the "Add new document" button
    And the user leaves the "Name" input field empty
    And the user clicks the "Save" button
    Then the validation message "This field is required." should be displayed for the "Name" input field

Scenario: Document field required validation
    When the user clicks the "Add new document" button
    And the user leaves the "Document" file input empty
    And the user clicks the "Save" button
    Then the validation message "No document provided." should be displayed for the "Document" file input

Scenario: Invalid file type validation
    When the user clicks the "Add new document" button
    And the user enters "<documentName>" into the "Name" input field
    And the user selects a non-PDF file for the "Document" file input
    And the user clicks the "Save" button
    Then the validation message "Only PDF files are allowed." should be displayed for the "Document" file input

Scenario: Document uploaded successfully
    When the user clicks the "Add new document" button
    And the user enters "<documentName>" into the "Name" input field
    And the user selects a PDF file
    And the user selects "<tag1>" and "<tag2>" from the "Tags" dropdown
    And the user clicks the "Save" button
    Then the "Add new document" modal should be closed
    And the document with name "<documentName>" should be displayed in the document list

Scenario: Cancel button closes modal
    When the user clicks the "Add new document" button
    And the user clicks the "Cancel" button
    Then the "Add new document" modal should be closed

Scenario: Tags dropdown populated
    When the user clicks the "Add new document" button
    Then the "Tags" dropdown should contain all tags stored in the system

