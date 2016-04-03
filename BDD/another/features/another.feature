 Feature: Checking we know station names and passenger counts
 
 Scenario Outline: 
 When we ask for the full name for "<tlc>"
 Then we are told it is "<fullname>"
 Then we are also told it had <journeys> passengers
 
 Examples:
   | tlc  |  fullname      |  journeys   |
   | SWI  |  Swindon       |  3350444    |
   | DMH  |  Dilton Marsh  |  20084      |
   | PLY  |  Plymouth      |  2445464    |
   | SPP  |  Shippea Hill  |  12         |