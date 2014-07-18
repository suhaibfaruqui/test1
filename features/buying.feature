Feature: Flipkart
Scenario: Buying on flipkart
Given I navigate to Flipkart
And I click on login
When Enter ID and Password
And Enter book to be searched
Then Place order
Then Payment method "Net Banking"
Then Payment method "Debit Card"
Then Payment method "Credit Card"
When User enter wrong credit card no
Then Error message is displayed