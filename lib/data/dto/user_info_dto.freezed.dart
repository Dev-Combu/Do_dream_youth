// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_info_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserInfoDto {

 String get role; String get name; String get christianName; String get phoneNumber; String? get department; Map<String, dynamic>? get profile;
/// Create a copy of UserInfoDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserInfoDtoCopyWith<UserInfoDto> get copyWith => _$UserInfoDtoCopyWithImpl<UserInfoDto>(this as UserInfoDto, _$identity);

  /// Serializes this UserInfoDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserInfoDto&&(identical(other.role, role) || other.role == role)&&(identical(other.name, name) || other.name == name)&&(identical(other.christianName, christianName) || other.christianName == christianName)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.department, department) || other.department == department)&&const DeepCollectionEquality().equals(other.profile, profile));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,role,name,christianName,phoneNumber,department,const DeepCollectionEquality().hash(profile));

@override
String toString() {
  return 'UserInfoDto(role: $role, name: $name, christianName: $christianName, phoneNumber: $phoneNumber, department: $department, profile: $profile)';
}


}

/// @nodoc
abstract mixin class $UserInfoDtoCopyWith<$Res>  {
  factory $UserInfoDtoCopyWith(UserInfoDto value, $Res Function(UserInfoDto) _then) = _$UserInfoDtoCopyWithImpl;
@useResult
$Res call({
 String role, String name, String christianName, String phoneNumber, String? department, Map<String, dynamic>? profile
});




}
/// @nodoc
class _$UserInfoDtoCopyWithImpl<$Res>
    implements $UserInfoDtoCopyWith<$Res> {
  _$UserInfoDtoCopyWithImpl(this._self, this._then);

  final UserInfoDto _self;
  final $Res Function(UserInfoDto) _then;

/// Create a copy of UserInfoDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? role = null,Object? name = null,Object? christianName = null,Object? phoneNumber = null,Object? department = freezed,Object? profile = freezed,}) {
  return _then(_self.copyWith(
role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,christianName: null == christianName ? _self.christianName : christianName // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,department: freezed == department ? _self.department : department // ignore: cast_nullable_to_non_nullable
as String?,profile: freezed == profile ? _self.profile : profile // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}

}


/// Adds pattern-matching-related methods to [UserInfoDto].
extension UserInfoDtoPatterns on UserInfoDto {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserInfoDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserInfoDto() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserInfoDto value)  $default,){
final _that = this;
switch (_that) {
case _UserInfoDto():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserInfoDto value)?  $default,){
final _that = this;
switch (_that) {
case _UserInfoDto() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String role,  String name,  String christianName,  String phoneNumber,  String? department,  Map<String, dynamic>? profile)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserInfoDto() when $default != null:
return $default(_that.role,_that.name,_that.christianName,_that.phoneNumber,_that.department,_that.profile);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String role,  String name,  String christianName,  String phoneNumber,  String? department,  Map<String, dynamic>? profile)  $default,) {final _that = this;
switch (_that) {
case _UserInfoDto():
return $default(_that.role,_that.name,_that.christianName,_that.phoneNumber,_that.department,_that.profile);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String role,  String name,  String christianName,  String phoneNumber,  String? department,  Map<String, dynamic>? profile)?  $default,) {final _that = this;
switch (_that) {
case _UserInfoDto() when $default != null:
return $default(_that.role,_that.name,_that.christianName,_that.phoneNumber,_that.department,_that.profile);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserInfoDto implements UserInfoDto {
  const _UserInfoDto({required this.role, required this.name, required this.christianName, required this.phoneNumber, this.department, final  Map<String, dynamic>? profile}): _profile = profile;
  factory _UserInfoDto.fromJson(Map<String, dynamic> json) => _$UserInfoDtoFromJson(json);

@override final  String role;
@override final  String name;
@override final  String christianName;
@override final  String phoneNumber;
@override final  String? department;
 final  Map<String, dynamic>? _profile;
@override Map<String, dynamic>? get profile {
  final value = _profile;
  if (value == null) return null;
  if (_profile is EqualUnmodifiableMapView) return _profile;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of UserInfoDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserInfoDtoCopyWith<_UserInfoDto> get copyWith => __$UserInfoDtoCopyWithImpl<_UserInfoDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserInfoDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserInfoDto&&(identical(other.role, role) || other.role == role)&&(identical(other.name, name) || other.name == name)&&(identical(other.christianName, christianName) || other.christianName == christianName)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber)&&(identical(other.department, department) || other.department == department)&&const DeepCollectionEquality().equals(other._profile, _profile));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,role,name,christianName,phoneNumber,department,const DeepCollectionEquality().hash(_profile));

@override
String toString() {
  return 'UserInfoDto(role: $role, name: $name, christianName: $christianName, phoneNumber: $phoneNumber, department: $department, profile: $profile)';
}


}

/// @nodoc
abstract mixin class _$UserInfoDtoCopyWith<$Res> implements $UserInfoDtoCopyWith<$Res> {
  factory _$UserInfoDtoCopyWith(_UserInfoDto value, $Res Function(_UserInfoDto) _then) = __$UserInfoDtoCopyWithImpl;
@override @useResult
$Res call({
 String role, String name, String christianName, String phoneNumber, String? department, Map<String, dynamic>? profile
});




}
/// @nodoc
class __$UserInfoDtoCopyWithImpl<$Res>
    implements _$UserInfoDtoCopyWith<$Res> {
  __$UserInfoDtoCopyWithImpl(this._self, this._then);

  final _UserInfoDto _self;
  final $Res Function(_UserInfoDto) _then;

/// Create a copy of UserInfoDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? role = null,Object? name = null,Object? christianName = null,Object? phoneNumber = null,Object? department = freezed,Object? profile = freezed,}) {
  return _then(_UserInfoDto(
role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,christianName: null == christianName ? _self.christianName : christianName // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,department: freezed == department ? _self.department : department // ignore: cast_nullable_to_non_nullable
as String?,profile: freezed == profile ? _self._profile : profile // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}


}

ProfileDto _$ProfileDtoFromJson(
  Map<String, dynamic> json
) {
        switch (json['type']) {
                  case 'student':
          return StudentProfileDto.fromJson(
            json
          );
                case 'teacher':
          return TeacherProfileDto.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'type',
  'ProfileDto',
  'Invalid union type "${json['type']}"!'
);
        }
      
}

/// @nodoc
mixin _$ProfileDto {

 String get grade;
/// Create a copy of ProfileDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileDtoCopyWith<ProfileDto> get copyWith => _$ProfileDtoCopyWithImpl<ProfileDto>(this as ProfileDto, _$identity);

  /// Serializes this ProfileDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileDto&&(identical(other.grade, grade) || other.grade == grade));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,grade);

@override
String toString() {
  return 'ProfileDto(grade: $grade)';
}


}

/// @nodoc
abstract mixin class $ProfileDtoCopyWith<$Res>  {
  factory $ProfileDtoCopyWith(ProfileDto value, $Res Function(ProfileDto) _then) = _$ProfileDtoCopyWithImpl;
@useResult
$Res call({
 String grade
});




}
/// @nodoc
class _$ProfileDtoCopyWithImpl<$Res>
    implements $ProfileDtoCopyWith<$Res> {
  _$ProfileDtoCopyWithImpl(this._self, this._then);

  final ProfileDto _self;
  final $Res Function(ProfileDto) _then;

/// Create a copy of ProfileDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? grade = null,}) {
  return _then(_self.copyWith(
grade: null == grade ? _self.grade : grade // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ProfileDto].
extension ProfileDtoPatterns on ProfileDto {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( StudentProfileDto value)?  student,TResult Function( TeacherProfileDto value)?  teacher,required TResult orElse(),}){
final _that = this;
switch (_that) {
case StudentProfileDto() when student != null:
return student(_that);case TeacherProfileDto() when teacher != null:
return teacher(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( StudentProfileDto value)  student,required TResult Function( TeacherProfileDto value)  teacher,}){
final _that = this;
switch (_that) {
case StudentProfileDto():
return student(_that);case TeacherProfileDto():
return teacher(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( StudentProfileDto value)?  student,TResult? Function( TeacherProfileDto value)?  teacher,}){
final _that = this;
switch (_that) {
case StudentProfileDto() when student != null:
return student(_that);case TeacherProfileDto() when teacher != null:
return teacher(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String school,  String grade,  String guardian,  String guardianPhoneNumber)?  student,TResult Function( String grade,  int careerYears)?  teacher,required TResult orElse(),}) {final _that = this;
switch (_that) {
case StudentProfileDto() when student != null:
return student(_that.school,_that.grade,_that.guardian,_that.guardianPhoneNumber);case TeacherProfileDto() when teacher != null:
return teacher(_that.grade,_that.careerYears);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String school,  String grade,  String guardian,  String guardianPhoneNumber)  student,required TResult Function( String grade,  int careerYears)  teacher,}) {final _that = this;
switch (_that) {
case StudentProfileDto():
return student(_that.school,_that.grade,_that.guardian,_that.guardianPhoneNumber);case TeacherProfileDto():
return teacher(_that.grade,_that.careerYears);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String school,  String grade,  String guardian,  String guardianPhoneNumber)?  student,TResult? Function( String grade,  int careerYears)?  teacher,}) {final _that = this;
switch (_that) {
case StudentProfileDto() when student != null:
return student(_that.school,_that.grade,_that.guardian,_that.guardianPhoneNumber);case TeacherProfileDto() when teacher != null:
return teacher(_that.grade,_that.careerYears);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class StudentProfileDto implements ProfileDto {
  const StudentProfileDto({required this.school, required this.grade, required this.guardian, required this.guardianPhoneNumber, final  String? $type}): $type = $type ?? 'student';
  factory StudentProfileDto.fromJson(Map<String, dynamic> json) => _$StudentProfileDtoFromJson(json);

 final  String school;
@override final  String grade;
 final  String guardian;
 final  String guardianPhoneNumber;

@JsonKey(name: 'type')
final String $type;


/// Create a copy of ProfileDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StudentProfileDtoCopyWith<StudentProfileDto> get copyWith => _$StudentProfileDtoCopyWithImpl<StudentProfileDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StudentProfileDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StudentProfileDto&&(identical(other.school, school) || other.school == school)&&(identical(other.grade, grade) || other.grade == grade)&&(identical(other.guardian, guardian) || other.guardian == guardian)&&(identical(other.guardianPhoneNumber, guardianPhoneNumber) || other.guardianPhoneNumber == guardianPhoneNumber));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,school,grade,guardian,guardianPhoneNumber);

@override
String toString() {
  return 'ProfileDto.student(school: $school, grade: $grade, guardian: $guardian, guardianPhoneNumber: $guardianPhoneNumber)';
}


}

/// @nodoc
abstract mixin class $StudentProfileDtoCopyWith<$Res> implements $ProfileDtoCopyWith<$Res> {
  factory $StudentProfileDtoCopyWith(StudentProfileDto value, $Res Function(StudentProfileDto) _then) = _$StudentProfileDtoCopyWithImpl;
@override @useResult
$Res call({
 String school, String grade, String guardian, String guardianPhoneNumber
});




}
/// @nodoc
class _$StudentProfileDtoCopyWithImpl<$Res>
    implements $StudentProfileDtoCopyWith<$Res> {
  _$StudentProfileDtoCopyWithImpl(this._self, this._then);

  final StudentProfileDto _self;
  final $Res Function(StudentProfileDto) _then;

/// Create a copy of ProfileDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? school = null,Object? grade = null,Object? guardian = null,Object? guardianPhoneNumber = null,}) {
  return _then(StudentProfileDto(
school: null == school ? _self.school : school // ignore: cast_nullable_to_non_nullable
as String,grade: null == grade ? _self.grade : grade // ignore: cast_nullable_to_non_nullable
as String,guardian: null == guardian ? _self.guardian : guardian // ignore: cast_nullable_to_non_nullable
as String,guardianPhoneNumber: null == guardianPhoneNumber ? _self.guardianPhoneNumber : guardianPhoneNumber // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
@JsonSerializable()

class TeacherProfileDto implements ProfileDto {
  const TeacherProfileDto({required this.grade, required this.careerYears, final  String? $type}): $type = $type ?? 'teacher';
  factory TeacherProfileDto.fromJson(Map<String, dynamic> json) => _$TeacherProfileDtoFromJson(json);

@override final  String grade;
 final  int careerYears;

@JsonKey(name: 'type')
final String $type;


/// Create a copy of ProfileDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TeacherProfileDtoCopyWith<TeacherProfileDto> get copyWith => _$TeacherProfileDtoCopyWithImpl<TeacherProfileDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TeacherProfileDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TeacherProfileDto&&(identical(other.grade, grade) || other.grade == grade)&&(identical(other.careerYears, careerYears) || other.careerYears == careerYears));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,grade,careerYears);

@override
String toString() {
  return 'ProfileDto.teacher(grade: $grade, careerYears: $careerYears)';
}


}

/// @nodoc
abstract mixin class $TeacherProfileDtoCopyWith<$Res> implements $ProfileDtoCopyWith<$Res> {
  factory $TeacherProfileDtoCopyWith(TeacherProfileDto value, $Res Function(TeacherProfileDto) _then) = _$TeacherProfileDtoCopyWithImpl;
@override @useResult
$Res call({
 String grade, int careerYears
});




}
/// @nodoc
class _$TeacherProfileDtoCopyWithImpl<$Res>
    implements $TeacherProfileDtoCopyWith<$Res> {
  _$TeacherProfileDtoCopyWithImpl(this._self, this._then);

  final TeacherProfileDto _self;
  final $Res Function(TeacherProfileDto) _then;

/// Create a copy of ProfileDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? grade = null,Object? careerYears = null,}) {
  return _then(TeacherProfileDto(
grade: null == grade ? _self.grade : grade // ignore: cast_nullable_to_non_nullable
as String,careerYears: null == careerYears ? _self.careerYears : careerYears // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
