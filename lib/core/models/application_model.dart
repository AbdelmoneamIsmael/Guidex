class ApplicationModel {
  String applicationName;
  ApplicationTheme theme;
  ApplicationLanguage language;
  String  fontFamily;
  ApplicationModel(
      {required this.applicationName,
      required this.theme,
      required this.language, required this.fontFamily});
}

enum ApplicationTheme {
  light,
  dark,
  inverter,
}

enum ApplicationLanguage {
  ar,
  en,
}
