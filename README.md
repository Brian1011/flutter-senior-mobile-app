# Flutter application
A mobile application build on flutter.

## Packages used
- **Cupertino icons** for designing [pub.dev](https://pub.dev/packages/cupertino_icons)
- **Jaguar orm** to generate ORM [pub.dev](https://pub.dev/packages/jaguar_orm)
- **Jaguar query** to build SQL/NoSQL queries [pub.dev](https://pub.dev/packages/jaguar_query)
- **Jaguar query sqflite** adapter for jagauar_query nad jaguar_orm [pub.dev](https://pub.dev/packages/jaguar_query_sqflite)
- **Provider** adapter for state management [pub.dev](https://pub.dev/packages/provider)
- **Flutter toast** adapter for state management [pub.dev](https://pub.dev/packages/fluttertoast)
- **Mockito** for mocking [pub.dev](https://pub.dev/packages/mockito)
- **Pref** for storing data in local storage [pub.dev](https://pub.dev/packages/pref)
- **Pin code fields** for OTP [pub.dev](https://pub.dev/packages/pin_code_fields)

## To run the project:
```
flutter pub get
flutter run
```

## To run migrations the database:
```
flutter pub run build_runner build --delete-conflicting-outputs
```

