// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "commits": MessageLookupByLibrary.simpleMessage("Commits"),
        "errorTitle":
            MessageLookupByLibrary.simpleMessage("Ups, we found an error"),
        "findYourFavoritesRepo": MessageLookupByLibrary.simpleMessage(
            "Find your favorites repositories here, right now!"),
        "internalError": MessageLookupByLibrary.simpleMessage(
            "It looks like something went wrong with the app, please contact support"),
        "limitReachedError": MessageLookupByLibrary.simpleMessage(
            "It looks like you reached the query limits, please generate a new Github token"),
        "noInternetError": MessageLookupByLibrary.simpleMessage(
            "It looks like we can\'t guarantee your internet connection, please check it out and try again"),
        "repositories": MessageLookupByLibrary.simpleMessage("Repositories"),
        "searchAGithubUser":
            MessageLookupByLibrary.simpleMessage("Search a Github username"),
        "serverError": MessageLookupByLibrary.simpleMessage(
            "It looks like the server is not workig well right now, please try again later"),
        "tryItWithThisApp": MessageLookupByLibrary.simpleMessage(
            "Try it with with this app\'s repository"),
        "userNotFoundError": MessageLookupByLibrary.simpleMessage(
            "It looks like the user that you are looking for, doesn\'t exist, please try again")
      };
}
