import 'package:do_dream_youth/data/repository_impl/email_auth_repository_impl.dart';
import 'package:do_dream_youth/data/source/email_auth_data_source.dart';
import 'package:do_dream_youth/data/source/email_auth_data_source_impl.dart';
import 'package:do_dream_youth/domain/repository/email_auth_repository.dart';
import 'package:do_dream_youth/domain/usecase/email_auth_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final logInDataSourceProvider = Provider<EmailAuthDataSource>((ref) {
  return EmailAuthDataSourceImpl();
});

final logInRepositoryProvider = Provider<EmailAuthRepository>((ref) {
  final data = ref.read(logInDataSourceProvider);
  return EmailAuthRepositoryImpl(data);
});

final fetchAuthUsecaseProvider = Provider((ref) {
  final authRepo = ref.read(logInRepositoryProvider);
  return EmailAuthUsecase(authRepo);
});