Feature: User Folder
  In order to keep track of items
  As a user
  I want to be able to store items in my folder

  Scenario: Ensure "Add to Folder" form is present in search results
	  When I go to the catalog page
    When I fill in "q" with "Pluvial nectar of blessings"
    And I press "search"
	  And I should see "Pluvial nectar of blessings"
 	  And I should see an add to folder form for ckey "2008308175"
 	  
 	Scenario: Ensure "Add to Folder" for is present on individual record
                When I go to the catalog page
		Given that I have cleared my folder
 	  Given I am on the document page for id 2008308175
 	  Then I should see an add to folder form for ckey "2008308175"
 	  
 	Scenario: Adding an item to the folder should produce a status message
 	  When I go to the catalog page
 	  When I fill in "q" with "Pluvial nectar of blessings"
 	  And I press "search"
 	  And I add ckey "2008308175" to my folder
 	  Then I should see "Item successfully added to Marked List"
 	  
   
	  
	Scenario: Do not show "Add to Favorites" when not logged in
	  Given I have ckey "2008308175" in my folder
	  And I have ckey "2007020969" in my folder
	  When I follow "Marked List"
	  Then I should not see "Add to Favorites"
	  

    
  Scenario: Remove an item from the folder
    Given I have ckey "2007020969" in my folder
    When I follow "remove"
    Then I should see "Item successfully removed from Marked List"
    And I should not get "Strong Medicine speaks" in the marked list
    
  Scenario: Clearing folder should mean you don't see items in the folder
    Given I have ckey "2007020969" in my folder
	  And I have ckey "2008308175" in my folder
	  And I follow "Clear Marked List"
	  Then I should see "Cleared Marked List"
	  And I should not get "Pluvial nectar of blessings" in the marked list
	  And I should not get "Strong Medicine speaks" in the marked list
	  
	Scenario: Do multiple citations when the folder has multiple items
	  Given I have ckey "2008308175" in my folder
	  And I have ckey "79930185" in my folder
	  And I follow "Cite"
 	  Then I should see "Ṅag-dbaṅ-blo-bzaṅ-rgya-mtsho, and Dennis Cordell. Pluvial Nectar of Blessings : a Supplication to the Noble Lama Mahaguru Padmasambhava. Dharamsala: Library of Tibetan Works and Archives, 2002."
 	  And I should see "Iṣlāḥī, A. Aḥsan. (1978). Pākistānī ʻaurat dorāhe par. Lāhaur: Maktabah-yi Markazī Anjuman-i K̲h̲uddāmulqurʼān."
