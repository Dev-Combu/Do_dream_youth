import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:do_dream_youth/data/dto/user_info_dto.dart';
import 'package:do_dream_youth/data/source/user_info_data_source.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:logger/logger.dart';

class UserInfoDataSourceImpl implements UserInfoDataSource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  Logger log = Logger();

  @override
  Future<void> createUserInfo(UserInfoDto userInfoDto) async {
    log.i('createUserInfo called');
    try {
      final doc = await _firestore
          .collection('user_info')
          .doc(_auth.currentUser?.uid)
          .get();
          log.e(userInfoDto.toJson());
      if (!doc.exists) {
        await _firestore
            .collection('user_info')
            .doc(_auth.currentUser?.uid)
            .set(userInfoDto.toJson());
        return;
      }
    } catch (e, stackTrace) {
      log.i('e: $e, stack: $stackTrace');
    }
  }
}
