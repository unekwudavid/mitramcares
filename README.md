# mitramcares

An assignment on fetching and displaying data from Chronicling America REST API.

## Getting Started

This project is a test assignment given by MitramCares.

### Instructions on how to run the program

1. Open up your code editor, VS Code or Android Studio.

2. Go to the file section at the top left corner and use your file explorer to locate the           mitramcares folder.

3. Once located Select to open project in editor. After analysis is complete run the command
'flutter pub get' in the terminal in order to download the necessary dependecies needed for the  project to run.

4. Based on your prefrence, you can choose either an emulator or a physical device to run the code.

5. To run the code you can tap on the play button on either of the respective code editors (vs code/ android studio) or run the command 'flutter run' in the terminal in order to run code in debug mode.

6.  If the above steps are followed and the code is successfully built and installed , the data from the provided API will be displayed.

#### Dependecies required

1.  get: ^4.6.6        (state management package)
2.  shimmer: ^3.0.0    (graphical package to show an ongoing execution that is not yet complete.)
3.  http:              (package for making network requests to a server to either send,get,modify/edit data.)

##### Approach

Firstly,I tested the endpoint on postman in order to see the structure of the the data that will be fetched and also to ensure that this endpoint works. Afterwards create a model based on the structure of the data that has been fetched. The I used to structure my code is the model,view,controller(MVC).
Based on the data, I created two screens ,the first screen contains the information that is mainly made of integers and while the second screen contains a list of items ,this was done in order to properly structure the fetched data. I used Getx for the state management,routing and dependency injection which also matched the architecture used(MVC).I also made used of the http package for making network calls to the endpoint. I created a logger.dart file which was used to handle the logging of this program in order to track execution flows, record errors and important events. 





