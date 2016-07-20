@api_test
Feature: Final Project for API Testing class - PROJECT

  @smoke
  Scenario: Verify to get an specific Project API
    Given I have set a connection to pivotal_tracker API service
    When I send a project GET request
    Then I expect Status code 200

  @smoke
  Scenario: Verify method POST for Project API
    Given I have set a connection to pivotal_tracker API service
    When I send a project POST with the json2
    """
      {
        "name":"angy11"
      }
    """
    Then I expect Status code 200

  @smoke
  Scenario: Verify method PUT for Project API
    Given I have set a connection to pivotal_tracker API service
    When I send a project PUT request to ProjectRequest with json
    """
      {
        "name":"angy111"
      }
    """
    Then I expect Status code 200

  @smoke
  Scenario: Verify method DELETE for Project API
    Given I have set a connection to pivotal_tracker API service
    When I send a project DELETE request to ProjectRequest
    Then I expect Status code 204

  @positive
  Scenario: Verify all data is correct
    Given I have set a connection to pivotal_tracker API service
    When I send a project POST with the json
    """
      {
         "name": "Angy Executioner",
         "week_start_day": "Monday"
      }
    """
    Then I expect Status code 200
    And I expect all data correct

  @acceptance
  Scenario Outline: Verify the created Project has been created with the same parameters
    Given I have set a connection to pivotal_tracker API service
    When I send a project POST with the json
    """
      {
        "name":"<Name>"
      }
    """
    Then I expect Status code 200
    And I expect the all inserted data are the same that the data sent
    Examples:
      | Name |
      | ProjectAngy-0001 |
      | ProjectAngy-0002 |
      | ProjectAngy-0003 |

  @acceptance
  Scenario Outline: Verify format date
    Given I have set a connection to pivotal_tracker API service
    When I send a project POST with the json
    """
      {
        "name":"<Name>"
      }
    """
    Then I expect Status code 200
    And I expect the date format is correct
    Examples:
      | Name |
      | ProjectAngy-0004 |

  @acceptance
  Scenario Outline: Verify Kind Project Registered
    Given I have set a connection to pivotal_tracker API service
    When I send a project POST with the json
    """
      {
        "name":"<Name>"
      }
    """
    Then I expect Status code 200
    And I expect the kind of project is equal to project
    Examples:
      | Name |
      | ProjectAngy-0005 |

  @acceptance
  Scenario Outline: Verify that the project_id is the same that I have sent
    Given I have set a connection to pivotal_tracker API service
    When I send a project POST with the json
    """
      {
        "name":"<Name>"
      }
    """
    Then I expect Status code 200
    And I expect the project_id is the same
    Examples:
      | Name |
      | ProjectAngy-0006|

  @acceptance
  Scenario: Verify the all data type that return the get request are correct
    Given I have set a connection to pivotal_tracker API service
    When I send a project GET request
    Then I expect Status code 200
    And I expect the all data type returned from project request are correct

#  @negative
#  Scenario: Verify that a project cannot be obtained for a non-existent project
#    Given I have set a connection to pivotal_tracker API service
#    When I send a project GET request for a project 0
#    Then I expect Status code 404
#    And I expect an error message from project


  @negative @a
  Scenario: Verify that is not possible to add a Project with empty data
    Given I have set a connection to pivotal_tracker API service
    When I send a project negative POST with the json
    """
      {
        "name":""
      }
    """
    Then I expect Status code 400
    And I expect an error message from project

