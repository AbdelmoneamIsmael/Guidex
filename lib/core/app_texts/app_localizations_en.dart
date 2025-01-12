import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get helloWorld => 'Hello World!';

  @override
  String get welcomeMessage => 'Welcome to Guidix\nWe designed this app to make life easier for the blind and visually impaired. You can scan QR codes to access information effortlessly, with the ability to edit QR code data or purchase new codes directly through the app. Start now and make the world more accessible for everyone!';

  @override
  String get next => 'Next';

  @override
  String get signIn => 'Sign In';
}
