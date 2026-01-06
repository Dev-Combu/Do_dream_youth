// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'guest_user_info_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GuestUserInfoDto {

 String get role; String get name; String get christianName; String get phoneNumber;
/// Create a copy of GuestUserInfoDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GuestUserInfoDtoCopyWith<GuestUserInfoDto> get copyWith => _$GuestUserInfoDtoCopyWithImpl<GuestUserInfoDto>(this as GuestUserInfoDto, _$identity);

  /// Serializes this GuestUserInfoDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GuestUserInfoDto&&(identical(other.role, role) || other.role == role)&&(identical(other.name, name) || other.name == name)&&(identical(other.christianName, christianName) || other.christianName == christianName)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,role,name,christianName,phoneNumber);

@override
String toString() {
  return 'GuestUserInfoDto(role: $role, name: $name, christianName: $christianName, phoneNumber: $phoneNumber)';
}


}

/// @nodoc
abstract mixin class $GuestUserInfoDtoCopyWith<$Res>  {
  factory $GuestUserInfoDtoCopyWith(GuestUserInfoDto value, $Res Function(GuestUserInfoDto) _then) = _$GuestUserInfoDtoCopyWithImpl;
@useResult
$Res call({
 String role, String name, String christianName, String phoneNumber
});




}
/// @nodoc
class _$GuestUserInfoDtoCopyWithImpl<$Res>
    implements $GuestUserInfoDtoCopyWith<$Res> {
  _$GuestUserInfoDtoCopyWithImpl(this._self, this._then);

  final GuestUserInfoDto _self;
  final $Res Function(GuestUserInfoDto) _then;

/// Create a copy of GuestUserInfoDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? role = null,Object? name = null,Object? christianName = null,Object? phoneNumber = null,}) {
  return _then(_self.copyWith(
role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,christianName: null == christianName ? _self.christianName : christianName // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [GuestUserInfoDto].
extension GuestUserInfoDtoPatterns on GuestUserInfoDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GuestUserInfoDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GuestUserInfoDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GuestUserInfoDto value)  $default,){
final _that = this;
switch (_that) {
case _GuestUserInfoDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GuestUserInfoDto value)?  $default,){
final _that = this;
switch (_that) {
case _GuestUserInfoDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String role,  String name,  String christianName,  String phoneNumber)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GuestUserInfoDto() when $default != null:
return $default(_that.role,_that.name,_that.christianName,_that.phoneNumber);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String role,  String name,  String christianName,  String phoneNumber)  $default,) {final _that = this;
switch (_that) {
case _GuestUserInfoDto():
return $default(_that.role,_that.name,_that.christianName,_that.phoneNumber);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String role,  String name,  String christianName,  String phoneNumber)?  $default,) {final _that = this;
switch (_that) {
case _GuestUserInfoDto() when $default != null:
return $default(_that.role,_that.name,_that.christianName,_that.phoneNumber);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GuestUserInfoDto implements GuestUserInfoDto {
   _GuestUserInfoDto({required this.role, required this.name, required this.christianName, required this.phoneNumber});
  factory _GuestUserInfoDto.fromJson(Map<String, dynamic> json) => _$GuestUserInfoDtoFromJson(json);

@override final  String role;
@override final  String name;
@override final  String christianName;
@override final  String phoneNumber;

/// Create a copy of GuestUserInfoDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GuestUserInfoDtoCopyWith<_GuestUserInfoDto> get copyWith => __$GuestUserInfoDtoCopyWithImpl<_GuestUserInfoDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GuestUserInfoDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GuestUserInfoDto&&(identical(other.role, role) || other.role == role)&&(identical(other.name, name) || other.name == name)&&(identical(other.christianName, christianName) || other.christianName == christianName)&&(identical(other.phoneNumber, phoneNumber) || other.phoneNumber == phoneNumber));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,role,name,christianName,phoneNumber);

@override
String toString() {
  return 'GuestUserInfoDto(role: $role, name: $name, christianName: $christianName, phoneNumber: $phoneNumber)';
}


}

/// @nodoc
abstract mixin class _$GuestUserInfoDtoCopyWith<$Res> implements $GuestUserInfoDtoCopyWith<$Res> {
  factory _$GuestUserInfoDtoCopyWith(_GuestUserInfoDto value, $Res Function(_GuestUserInfoDto) _then) = __$GuestUserInfoDtoCopyWithImpl;
@override @useResult
$Res call({
 String role, String name, String christianName, String phoneNumber
});




}
/// @nodoc
class __$GuestUserInfoDtoCopyWithImpl<$Res>
    implements _$GuestUserInfoDtoCopyWith<$Res> {
  __$GuestUserInfoDtoCopyWithImpl(this._self, this._then);

  final _GuestUserInfoDto _self;
  final $Res Function(_GuestUserInfoDto) _then;

/// Create a copy of GuestUserInfoDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? role = null,Object? name = null,Object? christianName = null,Object? phoneNumber = null,}) {
  return _then(_GuestUserInfoDto(
role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,christianName: null == christianName ? _self.christianName : christianName // ignore: cast_nullable_to_non_nullable
as String,phoneNumber: null == phoneNumber ? _self.phoneNumber : phoneNumber // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
