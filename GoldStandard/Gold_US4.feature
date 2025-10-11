Feature: Adding a new document
As a user
I want to upload documents and tag them
so that they are easy to find later.

Background:
    Given the user is logged in as "user"
    And the user is on the "Document Management - Directory overview" page

Scenario: Button "Add new document" displayed
    Then the "Add new document" button should be visible

Scenario: Modal Display
    When the user clicks the "Add new document" button
    Then the "Add new document" modal should be visible

Scenario: Display of elements in modal
    When the user clicks the "Add new document" button
    Then the "Name" input field should be visible
    And the "Document" file input should be visible
    And the "Tags" dropdown should be visible
    And the "Save" button should be visible
    And the "Cancel" button should be visible

Scenario: Dropdown contains all tags
    Given the "Add new document" button is clicked
    Then the "Tags" dropdown should contain all stored tags

Scenario: Validation - Empty "Name" input field
    Given the "Add new document" button is clicked
    When the user leaves the "Name" input field empty
    And the user clicks the "Save" button
    Then the validation message "This field is required." should be displayed for the "Name" input field

Scenario: Validation - Empty "Document" file input field
    Given the "Add new document" button is clicked
    When the user selects no document for the "Document" file input
    And the user clicks the "Save" button
    Then the validation message "No document provided." should be displayed for the "Document" file input

Scenario: Validation - Incorrect file type
    Given the "Add new document" button is clicked
    When the user selects the document "<noPDF>" for the "Document" file input
    And the user clicks the "Save" button
    Then the validation message "Only PDF files are allowed." should be displayed for the "Document" file input

Scenario: Close modal with "Cancel" button
    Given the "Add new document" button is clicked
    When the user clicks the "Cancel" button
    Then the "Add new document" modal should be hidden
    And the user should be on the "Document Management - Directory overview" page    

Scenario: Close modal with "Cancel" button with inputs
    Given the "Add new document" button is clicked
    When the user enters "<documentName>" into the "Name" input field
    And the user selects the document "<pdf>" in the "Document" file input
    And the user selects "<tag>" from the "Tags" dropdown
    And the user clicks the "Cancel" button
    Then the "Add new document" modal should be hidden
    And the user should be on the "Document Management - Directory overview" page
    And the "Documents" list should not contain an entry with "<documentName>"

Scenario: Successful Save - Single tag
    Given the "Add new document" button is clicked
    When the user enters "<documentName>" into the "Name" input field
    And the user selects the "<pdf>" document in the "Document" file input
    And the user selects "<option>" from the "Tags" dropdown
    And the user clicks the "Save" button
    Then the "Add new document" modal should be hidden
    And the user should be on the "Document Management - Directory overview" page
    And the "Documents" list should contain an entry with "<documentName>"

Scenario: Successful Save - Multiple tags
    Given the "Add new document" button is clicked
    When the user enters "<documentName>" into the "Name" input field
    And the user selects the "<pdf>" document in the "Document" file input
    And the user selects "<tag1>" from the "Tags" dropdown
    And the user selects "<tag2>" from the "Tags" dropdown
    And the user selects "<tag3>" from the "Tags" dropdown
    And the user clicks the "Save" button
    Then the "Add new document" modal should be hidden
    And the user should be on the "Document Management - Directory overview" page
    And the "Documents" list should contain an entry with "<documentName>"