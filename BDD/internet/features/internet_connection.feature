Feature: Have a way to pinpoint what could be wrong when trying to connect
         to internet...
		 
  Scenario: Confirm that we have a network interface

    Given We have a computer
    When we ask for a active network interface
    Then the computer can confirm we have one
  
  Scenario: Confirm that we have a MAC adresss
  
  Scenario: Confirm that we have a either LAN or WLAN possibilites
  
  Scenario: Confirm that we can ping our local ip address
    Given we have a network interface
    When pinging our adress: localhost
    Then we get a valid reply  

  Scenario: Confirm that we have been assigned a valid ip address
    Given that we have a local address
    When check if we have a assigned address
    Then we got one
   
  Scenario: Confirm that we can reach router close to us
    Given that we have a assigned address
    When we check if we have a first router
    Then we can ping it

  Scenario: Confirm that our DNS lookup works
    Given that we have a first router
    When check if DNS lookup
    Then it is affirmative

  Scenario: Confirm that we can ping Googles name server
    Given that we have a DNS lookup
    When pinging our adress: 8.8.8.8
    Then we get a valid reply  

  Scenario: Confirm that we can ping ftp.sunet.se
    Given that we have a DNS lookup
    When pinging our adress: ftp.sunet.se
    Then we get a valid reply  
  
  Scenario: Confirm that we fetch information from http://example.com
    Given internet connection
    When trying to get:  example.com
    Then we get a okay reply

  Scenario: We can mail echo berling and get a reply, echo@tu-berlin.de
    Given we have a mail client
    When sending a echo mail to: echo@tu-berlin.de
    Then we get a mail in reply
  
  Scenario: Measure capacity
    Given we have the tools to measure capacity
    When measuring with some tool
    Then we get a proper result

  Scenario: Verify that the vendorID for the MAC is equal to Hewlett Packard (D0:BF:9C)
    Given we have a interface
    When asking for a vendorId for this computer
    Then we get a valid reply on this