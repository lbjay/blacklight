Feature: User Folder
  In order to keep track of items
  As a user
  I want to be able to store items in my folder

  Scenario: Ensure "Add to Folder" form is present in search results
	  Given I am on the homepage
    When I fill in "q" with "calamity jane the woman and the legend"
    And I press "search"
	  And I should get ckey u4322506 in the results
 	  And I should see an add to folder form for ckey "u4322506"
 	  
 	Scenario: Ensure "Add to Folder" for is present on individual record
 	  Given I am on the document page for id u4322506
 	  Then I should see an add to folder form for ckey "u4322506"
 	  
 	Scenario: Adding an item to the folder should produce a status message
 	  Given I am on the homepage
 	  When I fill in "q" with "calamity jane the woman and the legend"
 	  And I press "search"
 	  And I add ckey "u4322506" to my folder
 	  Then I should see "Item successfully added to Marked List"
 	  
 	Scenario: Add items to folder, then view folder items
    Given I am on the homepage
    When I fill in "q" with "calamity jane the woman and the legend"
    And I press "search"
    And I add ckey "u4322506" to my folder
    And I follow "Marked List"
	  Then I should get ckey u4322506 in the results
	  Given I am on the homepage
	  When I fill in "q" with "Appius Claudius Pulcher"
	  And I press "search"
	  And I add ckey "n14_1989_9" to my folder
	  And I follow "Marked List"
	  Then I should get ckey u4322506 in the results
	  And I should get ckey n14_1989_9 in the results
	  
	Scenario: Do not show "Add to Favorites" when not logged in
	  Given I have ckey "u4322506" in my folder
	  And I have ckey "u5075136" in my folder
	  When I follow "Marked List"
	  Then I should not see "Add to Favorites"
	  
	Scenario: Show "Add to Favorites" when logged in and viewing folder
	  Given I am logged in
    When I follow "Marked List"
    Then I should see "Add to Favorites"
    
  Scenario: Remove an item from the folder
    Given I have ckey "u5076740" in my folder
    When I follow "remove"
    Then I should see "Item successfully removed from Marked List"
    And I should not get ckey u5076740 in the results
    
  Scenario: Clearing folder should mean you don't see items in the folder
    Given I have ckey "u4322506" in my folder
	  And I have ckey "u5075136" in my folder
	  And I follow "Clear Marked List"
	  Then I should see "Cleared Marked List"
	  And I should not get ckey u4322506 in the results
	  And I should not get ckey u5075136 in the results
	  
	Scenario: Do multiple citations when the folder has multiple items
	  Given I have ckey "u5076740" in my folder
	  And I have ckey "u5077466" in my folder
	  And I follow "Cite"
 	  Then I should see "Goldman, Jane. The Feminist Aesthetics of Virginia Woolf : Modernism, Post-impressionism and the Politics of the Visual. 1st pbk. ed. Cambridge, U.K.: Cambridge University Press, 2001."
 	  And I should see "Rhyner, Paula M. Emergent Literacy and Language Development : Promoting Learning In Early Childhood. New York: Guilford Press, 2009."
