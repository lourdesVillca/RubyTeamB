@api_test
Feature: Final Project for API Testing class

  @test
  Scenario: Comments GET
    Given I have set a connection to pivotal_tracker API service
    When I send a comment GET request to /projects/1652301/stories/126074587/comments
    Then I expect Status code 200

  @test
  Scenario Outline: Comments POST
    Given I have set a connection to pivotal_tracker API service
    When I send a POST request to /projects/1652301/stories/126074587/comments
	"""
		{
		 "created_at": "<create_at>",
         "id": <id>,
         "kind": "<kind>",
         "person_id": <person_id>,
         "story_id": <story_id>,
         "text": "<text>",
         "updated_at": "<updated_ at>"
		}
	"""
    Then I expect Status code 200

    Examples:
      | create_at | id | kind | person_id | story_id | text | updated_ at |
      | 2016-07-05T12:00:00Z | 300 | comment | 2064121 | 126074587 | This is my comment | 2016-07-05T12:00:00Z |


  @test
  Scenario Outline: Comments PUT
    Given I have set a connection to pivotal_tracker API service
    When I send a PUT request to /projects/1652301/stories/126074587/comments/143587923

 	"""
		{
		 "id": <id>,
		 "story_id": <story_id>,
         "text": "<text>"
        }
	"""
    Then I expect Status code 200

    Examples:
      | id | story_id | text |
      | 143587923 | 126074587 | This is my comment put again |


  @test
  Scenario: Comments DELETE
    Given I have set a connection to pivotal_tracker API service
    When I send a comment DELETE request to /projects/1652301/stories/126074587/comments/143587923
    Then I expect Status code 200
