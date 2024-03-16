# skyislimit

A Project to consume the github API for public repos

Requirements:
You must have Personal Access token for the App to work and should be added to the Strings file in the code.. 

Features and Implementations

The Application has 2 Main Screens.. 
1)Screen with a search bar which fetch the matched github repo.. 
Only matching 1 Repo is shown in the result since the users API gives only a matched Repo
2)Screen which is navigated from the Home screen to the result screen where there are 2 tabs. 
1st Tab shows the basic details about the account and the second tab shows the public repos owned by the user.. 
On click of the user repo it opens the browser and navigates to the selected repo on github.. 

Implementations.. 

1)Used Dio for network requests 
2)Used the interceptors for handling the request with retrying enabled for timeout requests 
3)Graceful handling of errors and exceptions with Generic classes and methods. 
4)Getx state management for easy management of states
5)Unnecessary network request are reduced with the use of debouncing and matching with the locally cached result. 
6)Modelling the network response with DTO for scalability and maintainability 
7)Use of dart best practices to reducing overall code to less number of lines.. 




