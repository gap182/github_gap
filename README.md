
# GithubGAP 

A Github app made with Flutter using the next packages:

* flutter_intl: used to manage different languages of the app (only english by now).
* cached_network_image: Flutter package to make easier the cached image data in the device.
* dio: Flutter package to handle different kind of request on an API.
* flutter_neumorphic: Flutter package for the use of different neumorphism ui elements.
* flutter_riverpod: High capable Flutter state management.
* flutter_screenutil: Flutter package to handle the resize of the components to fit different sizes of screens.
* go_router: Friendly Flutter package to use Navigator 2.0, it allows to implement declarative navigation and an easy way to implement deep linking navigation.
* webview_flutter: to implement a web visualization of a webpage.

Some of the skills worked on this project:

* Clean architecture: All the project was made to be reusable and scalable, separated in data, domain and ui layers.
* Internationalization: App ready to include different languages.
* API Consumption: Use of a public API (https://api.github.com/) to make different requests, and handle errors.
* UI/UX: Friendly app, with nice shapes and colors.



## Instructions to install the App

To use a pre compiled demo of the app, you could use this apk release file on an Android device: https://drive.google.com/file/d/10P8d32ZTTaAhZbQOqnRbcEzSUKaQNY8f/view?usp=sharing

To run the app, you have to take into account the next requisites and steps:

* You must have installed the latest Flutter version (3.0.1).
* Clone this repository.
* Create/use an Android/iOS emulator, or a physical device connected to the computer.
* If it is a physical device, you have to follow some extra steps:
	Android: https://www.geeksforgeeks.org/how-to-install-flutter-app-on-android/#:~:text=Using%20a%20USB%20cable%2C%20plug,recognizes%20your%20connected%20Android%20device.
	iOS: https://medium.com/front-end-weekly/how-to-test-your-flutter-ios-app-on-your-ios-device-75924bfd75a8
* Inside the folder of the repository, run "flutter clean", then "flutter pub get".
* You will need a Github Token to be able to use the api without restrictions (info about to create a token: https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token)
* Inside the folder of the repository, run "flutter run --dart-define=token=[YOUR GITHUB TOKEN]".

## Use of the App

* Home Screen: You can choose either search for a Github username and watch all the public repositories and commits, or try the app watching the commits for this app.
![alt text](https://drive.google.com/uc?export=view&id=1krqph6ok00B4o7HwZqy_VGWHEBWSQT6u)

* Repositories Screen: You can watch all the public repositories for the username selected, pressing the photo, you will be redirected to his github profile page.

![alt text](https://drive.google.com/uc?export=view&id=1el7IDEAiEpNUvbYyq0L8t0ZFAFPt-1eN) 

![alt text](https://drive.google.com/uc?export=view&id=1aRsHddkoQM0pe0ckOPH5TWmbx0zN9-h0)

* Commits Screen: You can watch all the commits for a repository selected.

![alt text](https://drive.google.com/uc?export=view&id=1SAjdByqiDx1ixVUB3mmkiGtyPkH6-DDN)