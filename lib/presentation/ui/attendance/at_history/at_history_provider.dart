import 'package:do_dream_youth/data/repository_impl/at_history_repository_impl.dart';
import 'package:do_dream_youth/data/source/at_history/at_history_data_source.dart';
import 'package:do_dream_youth/data/source/at_history/at_history_data_source_impl.dart';
import 'package:do_dream_youth/domain/repository/at_history_repository.dart';
import 'package:do_dream_youth/domain/usecase/at_history_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final atHistoryDataSourceProvider = Provider<AtHistoryDataSource>((ref) {
  return AtHistoryDataSourceImpl();
});

final atHistoryRepositoryProvider = Provider<AtHistoryRepository>((ref) {
  final data = ref.read(atHistoryDataSourceProvider);
  return AtHistoryRepositoryImpl(data);
});

final atHistoryUsecaseProvider = Provider((ref) {
  final authRepo = ref.read(atHistoryRepositoryProvider);
  return AtHistoryUsecase(authRepo);
});