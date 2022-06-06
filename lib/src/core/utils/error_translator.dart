import 'package:flutter/material.dart';
import 'package:github_gap/generated/l10n.dart';

String getErrorMessage(BuildContext context, String? key) {
  final mapError = <String, String>{
    "no_internet": S.of(context).noInternetError,
    "user_not_found": S.of(context).userNotFoundError,
    "limit_reached": S.of(context).limitReachedError,
    "server_error": S.of(context).serverError,
    "internal_error": S.of(context).internalError,
  };
  return mapError[key] ?? '';
}
