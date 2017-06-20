# TDD - Inloop TDD by and example in Swift

Almost every production app contains login in order to access some app's restricted functionality. 
Lets start with common case we all know - Login functionality. 

So - how do I test login itself? What is needed?
You will need a UI apparently, that will let the user to log in.
- 2 inputs, one button should be far enough for username, password and confirmation, right ?

To be functionality wise, you will need a software layer that will take care of the login procedure. 
Moreover the user would probably require to use the login across the devices - some kind of sync provider is in place, a server side. That's how the system looks like right now. 

### Testing the login
To test the login functionality you do not need the server side. You only need to verify the login request you are about to send to the server side will be valid request. 

1. Identify your input values 
- username, password 
2. Answer the question: What is the expected outcome?
- user is logged in if valid user
3. Are there any restrictions applied? 
- yes, restrictions apply on username and password as inputs

As for inputs and expected outputs are identified. 

4. Write a failing test - keep the coding effort minimal - #3 
5. Fill the test in - still making it fail (Do not write production code yet) #4
6. Ok, let's make it green #5 
7. Clean up the mess around ;-) #6 - #8

Ok, you have a working sample right now. Let's integrate in into the App. 

8. Integrate into app - #9

Alright - we are up and running :-) 
The tests aren't there just to be left forgotten. You should take care of your tests since it proves your code is working and stable. You should also refactor your unit tests, however do not refactor your unit tests and production code at the same time! 
