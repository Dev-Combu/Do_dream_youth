import 'package:do_dream_youth/data/repository_impl/user_info_repository_impl.dart';
import 'package:do_dream_youth/data/source/user_info_data_source.dart';
import 'package:do_dream_youth/data/source/user_info_data_source_impl.dart';
import 'package:do_dream_youth/domain/repository/user_info_repository.dart';
import 'package:do_dream_youth/domain/usecase/user_info_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userInfoDatatSourceProvider = Provider<UserInfoDataSource>((ref) {
  return UserInfoDataSourceImpl();
});

final userInfoRepositoryProvider = Provider<UserInfoRepository>((ref) {
  final data = ref.read(userInfoDatatSourceProvider);
  return UserInfoRepositoryImpl(data);
});

final userInfoUsecaseProvider = Provider<UserInfoUsecase>((ref) {
  final repository = ref.read(userInfoRepositoryProvider);
  return UserInfoUsecase(repository);
});