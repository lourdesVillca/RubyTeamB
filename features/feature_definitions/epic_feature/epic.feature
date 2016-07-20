@api_test
Feature: Final Project for API Testing class - EPIC

  @smoke @create_project
  Scenario: Verify to get an specific Epic API
    Given I have set a connection to pivotal_tracker API service
    When I send a epic GET request for a project
    Then I expect Status code 200

  @smoke
  Scenario: Verify method POST for Epic API
    Given I have set a connection to pivotal_tracker API service
    When I send an epic POST with the json2
    """
      {
        "name":"Epic-test2"
      }
    """
    Then I expect Status code 200

  @smoke
  Scenario: Verify method PUT for Epic API
    Given I have set a connection to pivotal_tracker API service
    When I send an epic PUT request to EpicRequest with json
    """
      {
        "name":"Epic-test1 Updated"
      }
    """
    Then I expect Status code 200

  @smoke
  Scenario: Verify method DELETE for Epic API
    Given I have set a connection to pivotal_tracker API service
    When I send an epic DELETE request to EpicRequest
    Then I expect Status code 204

  @acceptance
  Scenario Outline: Verify the created Epic has been created with the same parameters
    Given I have set a connection to pivotal_tracker API service
    When I send an epic POST with the json
    """
      {
        "name":"<Name>"
      }
    """
    Then I expect Status code 200
      And I expect the all inserted data are the same that the data sent
	Examples:
    | Name |
    | Epic-01 |
    | Epic-02 |
    | Epic-03 |

  @acceptance
  Scenario Outline: Verify format date
    Given I have set a connection to pivotal_tracker API service
    When I send an epic POST with the json
    """
      {
        "name":"<Name>"
      }
    """
    Then I expect Status code 200
      And I expect the all date format are correct
    Examples:
      | Name |
      | Epic-04 |

  @acceptance
  Scenario Outline: Verify Kind Epic Registered
    Given I have set a connection to pivotal_tracker API service
    When I send an epic POST with the json
    """
      {
        "name":"<Name>"
      }
    """
    Then I expect Status code 200
    And I expect the kind of epic is equal to epic
    Examples:
      | Name |
      | Epic-05 |

  @acceptance
  Scenario Outline: Verify that the project_id is the same that I have sent
    Given I have set a connection to pivotal_tracker API service
    When I send an epic POST with the json
    """
      {
        "name":"<Name>"
      }
    """
    Then I expect Status code 200
    And I expect the project_id is the same that I have sent
    Examples:
      | Name |
      | Epic-06|

  @acceptance_get
  Scenario: Verify the all data type that return the get request are correct
    Given I have set a connection to pivotal_tracker API service
    When I send a epic GET request for a project
    Then I expect Status code 200
      And I expect the all data type returned from epic request are correct


  @negative
  Scenario: Verify that an epic cannot be obtained for a non-existent project
    Given I have set a connection to pivotal_tracker API service
    When I send a epic GET request for a project 0
    Then I expect Status code 404
      And I expect an error message to epic

  @negative
  Scenario Outline: Verify that is not possible to add an EPIC with empty data
    Given I have set a connection to pivotal_tracker API service
    When I send a epic POST request with the json
    """
      {
        "name":" "
      }
    """
    Then I expect Status code 404
      And I expect an error message to epic
    Examples:
    | Name |
    | Epic-06|