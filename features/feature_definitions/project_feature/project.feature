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
      | ProjectAngy-00001 |
      | ProjectAngy-00002 |
      | ProjectAngy-00003 |


  @acceptance
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
      | ProjectAngy-00004 |

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
      | ProjectAngy-00005 |

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
      | ProjectAngy-00006|

