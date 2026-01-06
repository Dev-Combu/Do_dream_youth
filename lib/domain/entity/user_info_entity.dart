// User Entity
class UserInfoEntity {
  final String role;
  final String name;
  final String christianName;
  final String phoneNumber;
  final String? department;
  final Profile? profile;

  UserInfoEntity({
    required this.role,
    required this.name,
    required this.christianName,
    required this.phoneNumber,
    this.department,
    this.profile
  });
}

// 추상 프로필
abstract class Profile {}

class StudentProfileEntity implements Profile {
  final String school;
  final String grade;
  final String guardian;
  final String guardianPhoneNumber;

  StudentProfileEntity({
    required this.school,
    required this.grade,
    required this.guardian,
    required this.guardianPhoneNumber,
  });
}

class TeacherProfileEntity implements Profile {
  final String grade;
  final int careerYears;

  TeacherProfileEntity({
    required this.grade,
    required this.careerYears,
  });
}
