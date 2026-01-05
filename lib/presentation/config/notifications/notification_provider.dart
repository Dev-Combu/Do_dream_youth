
import 'package:do_dream_youth/data/repository_impl/notification_repository_impl.dart';
import 'package:do_dream_youth/data/source/notification_data_source.dart';
import 'package:do_dream_youth/data/source/notification_data_source_impl.dart';
import 'package:do_dream_youth/domain/repository/notification_repository.dart';
import 'package:do_dream_youth/domain/usecase/notification_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final notificationDatatSourceProvider = Provider<NotificationDataSource>((ref) {
  return NotificationDataSourceImpl();
});

final notificationRepositoryProvider = Provider<NotificationRepository>((ref) {
  final data = ref.read(notificationDatatSourceProvider);
  return NotificationRepositoryImpl(data);
});

final notificationUsecaseProvider = Provider<NotificationUsecase>((ref) {
  final repository = ref.read(notificationRepositoryProvider);
  return NotificationUsecase(repository);
});