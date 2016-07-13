@api_test
Feature: Final Projects for API Testing class

  @smoke
  Scenario: Project GET
    Given I have set a connection to pivotal_tracker API service
    When I send a GET request to /projects/1652291
    Then I expect Status code 200
  
  @smoke
  Scenario Outline: Projects PUT
    Given I have set a connection to pivotal_tracker API service
    When I send a PUT request to /projects/1652291
     """
		{"name":"<Name>"}
     """
    Then I expect Status code 200

	Examples:
	| Name  |
	| Hello baby | 
	| How are|
	| You|

 @smoke
  Scenario Outline: Projects POST
    Given I have set a connection to pivotal_tracker API service
    When I send a POST request to /projects
     """
		{"name":"<Name>"}
     """
    Then I expect Status code 200

	Examples:
	| Name  |
	| One| 
	| Two|
	| Three|

 @smoke
  Scenario: Project DELETE
    Given I have set a connection to pivotal_tracker API service
    When I send a DELETE request to /projects/1652301
    Then I expect Status code 204