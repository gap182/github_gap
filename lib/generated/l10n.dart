// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Find your favorites repositories here, right now!`
  String get findYourFavoritesRepo {
    return Intl.message(
      'Find your favorites repositories here, right now!',
      name: 'findYourFavoritesRepo',
      desc: '',
      args: [],
    );
  }

  /// `Try it with with this app's repository`
  String get tryItWithThisApp {
    return Intl.message(
      'Try it with with this app\'s repository',
      name: 'tryItWithThisApp',
      desc: '',
      args: [],
    );
  }

  /// `Search a Github username`
  String get searchAGithubUser {
    return Intl.message(
      'Search a Github username',
      name: 'searchAGithubUser',
      desc: '',
      args: [],
    );
  }

  /// `Ups, we found an error`
  String get errorTitle {
    return Intl.message(
      'Ups, we found an error',
      name: 'errorTitle',
      desc: '',
      args: [],
    );
  }

  /// `It looks like we can't guarantee your internet connection, please check it out and try again`
  String get noInternetError {
    return Intl.message(
      'It looks like we can\'t guarantee your internet connection, please check it out and try again',
      name: 'noInternetError',
      desc: '',
      args: [],
    );
  }

  /// `It looks like the user that you are looking for, doesn't exist, please try again`
  String get userNotFoundError {
    return Intl.message(
      'It looks like the user that you are looking for, doesn\'t exist, please try again',
      name: 'userNotFoundError',
      desc: '',
      args: [],
    );
  }

  /// `It looks like you reached the query limits, please generate a new Github token`
  String get limitReachedError {
    return Intl.message(
      'It looks like you reached the query limits, please generate a new Github token',
      name: 'limitReachedError',
      desc: '',
      args: [],
    );
  }

  /// `It looks like the server is not workig well right now, please try again later`
  String get serverError {
    return Intl.message(
      'It looks like the server is not workig well right now, please try again later',
      name: 'serverError',
      desc: '',
      args: [],
    );
  }

  /// `It looks like something went wrong with the app, please contact support`
  String get internalError {
    return Intl.message(
      'It looks like something went wrong with the app, please contact support',
      name: 'internalError',
      desc: '',
      args: [],
    );
  }

  /// `Repositories`
  String get repositories {
    return Intl.message(
      'Repositories',
      name: 'repositories',
      desc: '',
      args: [],
    );
  }

  /// `Commits`
  String get commits {
    return Intl.message(
      'Commits',
      name: 'commits',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
