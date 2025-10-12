Feature: Adding a new document
As a user, I want to upload documents and tag them so that they are easy to find later

Background:
    Given the user is logged in as "User"
    And the user is on the "Document Management - Directory overview" page

Scenario: Add new document button displayed
    Then the "Add new document" button should be displayed

Scenario: Modal opened on clicking 'Add new document'
    When the user clicks the "Add new document" button
    Then the "Add new document" modal should be displayed
    And the "Name" input field should be visible
    And the "Document" file input should be displayed
    And the "Tags" dropdown should be visible
    And the "Cancel" button should be displayed
    And the "Save" button should be displayed

Scenario: Modal closed on clicking 'Cancel'
    When the user clicks the "Add new document" button
    Then the "Add new document" modal should be displayed
    When the user clicks the "Cancel" button
    Then the "Add new document" modal should be closed

Scenario: Validation error for missing name
    When the user clicks the "Add new document" button
    And the user leaves the "Name" input field empty
    And the user selects a PDF file in the "Document" file input
    And the user clicks the "Save" button
    Then the validation message "This field is required." should be displayed for the "Name" input field

Scenario: Validation error for no document selected
    When the user clicks the "Add new document" button
    And the user enters "<documentName>" into the "Name" input field
    And the user leaves the "Document" file input empty
    And the user clicks the "Save" button
    Then the validation message "No document provided." should be displayed for the "Document" file input

Scenario: Validation error for non-PDF file
    When the user clicks the "Add new document" button
    And the user enters "<documentName>" into the "Name" input field
    And the user selects a non-PDF file in the "Document" file input
    And the user clicks the "Save" button
    Then the validation message "Only PDF files are allowed." should be displayed for the "Document" file input

Scenario: Document uploaded successfully
    When the user clicks the "Add new document" button
    And the user enters "<documentName>" into the "Name" input field
    And the user selects a PDF file in the "Document" file input
    And the user selects "<tag1>, <tag2>" from the "Tags" dropdown
    And the user clicks the "Save" button
    Then the modal should be closed
    And the document with name "<documentName>" and tags "<tag1>, <tag2>" should appear in the list

Scenario: Tags dropdown allows multiple selections
    When the user clicks the "Add new document" button
    Then the "Add new document" modal should be displayed
    When the user selects "<tag1>" and "<tag2>" from the "Tags" dropdown
    And the user enters "<documentName>" into the "Name" input field
    And the user uploads a PDF file to the "Document" file input
    And the user clicks the "Save" button
    Then the modal should close
    And the document list should contain an entry with name "<documentName>" and tags "<tag1>, <tag2>"

Scenario: Tags dropdown contains all system tags
    When the user clicks the "Add new document" button
    Then the "Tags" dropdown should contain all system tags

Scenario: Document uploaded successfully
    When the user clicks the "Add new document" button
    And the user enters "<documentName>" into the "Name" input field
    And the user selects a PDF file for the "Document" file input
    And the user selects "<tag1>, <tag2>" from the "Tags" dropdown
    And the user clicks the "Save" button
    Then the document should be uploaded successfully
    And the "Add new document" modal should close
    And the list should contain an item with the name "<documentName>"

