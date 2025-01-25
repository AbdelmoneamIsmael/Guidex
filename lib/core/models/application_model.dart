class ApplicationModel {
  String applicationName;
  ApplicationTheme theme;
  ApplicationLanguage language;
  String fontFamily;
  ApplicationModel(
      {required this.applicationName,
      required this.theme,
      required this.language,
      required this.fontFamily});

  ApplicationModel copyWith({
    String? applicationName,
    ApplicationTheme? theme,
    ApplicationLanguage? language,
    String? fontFamily,
  }) {
    return ApplicationModel(
      applicationName: applicationName ?? this.applicationName,
      theme: theme ?? this.theme,
      language: language ?? this.language,
      fontFamily: fontFamily ?? this.fontFamily,
    );
  }

  ApplicationModel fromJson(Map<String, dynamic> json) {
    return ApplicationModel(
      applicationName: json['applicationName'],
      theme: getThemeFromString(json['theme']),
      language: getLanguageFromString(json['language']),
      fontFamily: json['fontFamily'],
    );
  }

  Map<String, dynamic> toJson() => {
        'applicationName': applicationName,
        'theme': getTheme(theme),
        'language': getLanguage(language),
        'fontFamily': fontFamily,
      };

  String getTheme(ApplicationTheme theme) {
    switch (theme) {
      case ApplicationTheme.light:
        return ApplicationTheme.light.name;
      case ApplicationTheme.dark:
        return ApplicationTheme.dark.name;
      case ApplicationTheme.inverter:
        return ApplicationTheme.inverter.name;
    }
  }

  String getLanguage(ApplicationLanguage language) {
    switch (language) {
      case ApplicationLanguage.ar:
        return ApplicationLanguage.ar.name;
      case ApplicationLanguage.en:
        return ApplicationLanguage.en.name;
    }
  }

  ApplicationTheme getThemeFromString(String theme) {
    switch (theme) {
      case "light":
        return ApplicationTheme.light;
      case "dark":
        return ApplicationTheme.dark;
      case "inverter":
        return ApplicationTheme.inverter;
      default:
        return ApplicationTheme.light;
    }
  }

  ApplicationLanguage getLanguageFromString(String language) {
    switch (language) {
      case "ar":
        return ApplicationLanguage.ar;
      case "en":
        return ApplicationLanguage.en;
      default:
        return ApplicationLanguage.en;
    }
  }
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
