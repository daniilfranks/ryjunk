
Feature: Test

Scenario: Create new user
 
Given I create new user named "user_1" with the following data:
|first_name |last_name |mobile      |email               |user_name  |pass     |
|${6}       |${8}      |${!0046,N8} |${!test,4,@,8,!.com}|${!test,8} |qazwsx12 |