import 'package:github_gap/src/core/utils/error_handler.dart';

enum HomeStatus { initial, loading, error, done }

class HomeState {
  HomeState({
    this.textToSearch,
    this.homeStatus = HomeStatus.initial,
    this.errorHandler,
  });

  final String? textToSearch;
  final HomeStatus homeStatus;
  final ErrorHandler? errorHandler;

  HomeState copyWith({
    String? Function()? textToSearch,
    HomeStatus? homeStatus,
    ErrorHandler? Function()? errorHandler,
  }) {
    return HomeState(
      textToSearch: textToSearch != null ? textToSearch() : this.textToSearch,
      homeStatus: homeStatus ?? this.homeStatus,
      errorHandler: errorHandler != null ? errorHandler() : this.errorHandler,
    );
  }

  @override
  String toString() =>
      'HomeState(textToSearch: $textToSearch, homeStatus: $homeStatus, errorHandler: $errorHandler)';
}
