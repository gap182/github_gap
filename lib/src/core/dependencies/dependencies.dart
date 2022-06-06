import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:github_gap/src/config/config_notifier.dart';
import 'package:github_gap/src/config/config_state.dart';
import 'package:github_gap/src/core/data/repositories/data_repository_impl.dart';
import 'package:github_gap/src/core/data/services/data_service.dart';
import 'package:github_gap/src/core/domain/repositories/data_repository.dart';
import 'package:github_gap/src/features/home/presentation/controller/home_notifier.dart';
import 'package:github_gap/src/features/home/presentation/state/home_state.dart';

part 'dependencies_ui.dart';
part 'dependencies_domain.dart';
part 'dependencies_data.dart';
part 'dependencies_config.dart';
