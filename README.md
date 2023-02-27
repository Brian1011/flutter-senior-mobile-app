# Flutter demo application
A mobile application build on flutter to illustrate registration of drivers, 
adding new orders to sql lite database and viewing the existing orders.

## Demo App
![Recorded demo](https://github.com/Brian1011/flutter-senior-mobile-app/blob/main/assets/app_demo.gif)


[Install demo apk here](https://drive.google.com/file/d/18dEF-NzD6K8sEmi46pxHMzly4kmNzhGM/view?usp=share_link)

## Project Achievements
- Registration of drivers
- Adding new orders
- Viewing existing orders
- Validating user input
- Using sql local database
- Successful Widget and database service testing
- Memory management and optimization
- User interface design
- Authentication and authorization
- State management

## Packages used
- **Cupertino icons** for designing [pub.dev](https://pub.dev/packages/cupertino_icons)
- **Jaguar orm** to generate ORM [pub.dev](https://pub.dev/packages/jaguar_orm)
- **Jaguar query** to build SQL/NoSQL queries [pub.dev](https://pub.dev/packages/jaguar_query)
- **Jaguar query sqflite** adapter for jagauar_query nad jaguar_orm [pub.dev](https://pub.dev/packages/jaguar_query_sqflite)
- **Provider** for state management [pub.dev](https://pub.dev/packages/provider)
- **Flutter toast** [pub.dev](https://pub.dev/packages/fluttertoast)
- **Mockito** for mocking services [pub.dev](https://pub.dev/packages/mockito)
- **Prefs** for storing simple data in local storage [pub.dev](https://pub.dev/packages/pref)
- **Pin code fields** for OTP [pub.dev](https://pub.dev/packages/pin_code_fields)

## Tools used
- **Android studio** for developing the application
- **Git** for version control
- **Fvm** for flutter version management
- **Ubuntu 22.04** for development

## Flutter Version
- **Flutter:** 1.22.6 - used this version because of [jorm dependency](https://pub.dev/packages/jaguar_orm)

## To deploy the app
1. Clone this project
2. Ensure you have flutter 1.22.6 installed or [FVM](https://fvm.app/) installed to switch to 1.22.6
3. Connect your device or start an emulator
4. Run the project on VS Code or Android Studio with the above versions of flutter.

## To run the project
```
flutter pub get / fvm flutter pub get
flutter run / fvm flutter run
```

## To run all project tests
```
flutter test / fvm flutter test
```

## To run sql lite database migrations
```
flutter pub run build_runner build --delete-conflicting-outputs / fvm flutter pub run build_runner build --delete-conflicting-outputs
```

## To test the app on a device
1. Run the project on your device or emulator
2. Alternatively use the link below to test the apk file on your android device.
Install it on any android device and test it.

## The apk link 
[Click here to install apk](https://drive.google.com/file/d/18dEF-NzD6K8sEmi46pxHMzly4kmNzhGM/view?usp=share_link)

