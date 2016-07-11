@api_test
Feature: Final Project for API Testing class - EPIC

  @smoke
  Scenario: Verify to get an specific Epic API
    Given I have set a connection to pivotal_tracker API service
    When I send a epic GET request to /projects/1640321/epics/2710221
    Then I expect Status code 200

  @smoke
  Scenario: Verify method POST for Epic API
    Given I have set a connection to pivotal_tracker API service
    When I send an epic POST request to /projects/1652291/epics with json
    """
      {
        "name":"Epic-test7"
      }
    """
    Then I expect Status code 200

  @smoke
  Scenario: Verify method PUT for Epic API
    Given I have set a connection to pivotal_tracker API service
    When I send an epic PUT request to /projects/1652291/epics/2719855 with json
    """
      {
        "name":"Epic-test4 Updated2"
      }
    """
    Then I expect Status code 200

  @smoke
  Scenario: Verify method DELETE for Epic API
    Given I have set a connection to pivotal_tracker API service
    When I send an epic DELETE request to /projects/1652291/epics/2719825
    Then I expect Status code 204
