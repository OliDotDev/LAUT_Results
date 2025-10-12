Feature: Adding a new document
As a user, I want to upload documents and tag them so that they are easy to find later

Background:
    Given the user is logged in as "User"
    And the user is on the "Document Management - Directory overview" page

Scenario: Add new document button displayed
    Then the "Add new document" button should be displayed

Scenario: Required name validation shown
    When the user clicks the "Add new document" button
    And the user leaves the "Name" input field empty
    And the user clicks the "Save" button
    Then the validation message "This field is required." should be displayed for the "Name" input field

Scenario: Required document validation shown
    When the user clicks the "Add new document" button
    And the user leaves the "Name" input field empty
    And the user leaves the "Document" file input empty
    And the user clicks the "Save" button
    Then the validation message "This field is required." should be displayed for the "Name" input field
    And the validation message "No document provided." should be displayed below the "Document" file input

Scenario: Invalid PDF format error shown
    When the user clicks the "Add new document" button
    And the user leaves the "Name" input field empty
    And the user selects a file that is not a PDF into the "Document" file input
    And the user clicks the "Save" button
    Then the validation message "Only PDF files are allowed." should be displayed below the "Document" file input

Scenario: Document uploaded successfully
    When the user clicks the "Add new document" button
    And the user enters "<documentName>" into the "Name" input field
    And the user selects a valid PDF file for the "Document" file input
    And the user selects one or more tags from the "Tags" dropdown
    And the user clicks the "Save" button
    Then the modal should be closed
    And the document with name "<documentName>" and selected tags should be listed in the table

Scenario: Add new document button displayed
    Then the "Add new document" button should be displayed

Scenario: Add new document modal opened
    When the user clicks the "Add new document" button
    Then the "Add new document" modal should be displayed

Scenario: Cancel closes modal without saving
    When the user clicks the "Add new document" button
    And the user enters "<documentName>" into the "Name" input field
    And the user selects a PDF file using the "Document" file input
    And the user multi-selects tags from the "Tags" dropdown
    And the user clicks the "Cancel" button
    Then the "Add new document" modal should be closed
    And no changes should have been saved

Scenario: Document uploaded on successful validation
    When the user clicks the "Add new document" button
    And the user enters "<documentName>" into the "Name" input field
    And the user selects a valid PDF file for the "Document" file input
    And the user selects multiple tags from the "Tags" dropdown
    And the user clicks the "Add"/"Upload" button
    Then the document should be successfully added to the directory
    And the modal should be closed
    And the document should be shown in the list

