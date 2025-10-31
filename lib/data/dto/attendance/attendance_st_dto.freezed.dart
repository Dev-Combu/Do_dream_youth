// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'attendance_st_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AttendanceStDto {

 String get userId; String get name; DateTime get timestamp;
/// Create a copy of AttendanceStDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AttendanceStDtoCopyWith<AttendanceStDto> get copyWith => _$AttendanceStDtoCopyWithImpl<AttendanceStDto>(this as AttendanceStDto, _$identity);

  /// Serializes this AttendanceStDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AttendanceStDto&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.name, name) || other.name == name)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,name,timestamp);

@override
String toString() {
  return 'AttendanceStDto(userId: $userId, name: $name, timestamp: $timestamp)';
}


}

/// @nodoc
abstract mixin class $AttendanceStDtoCopyWith<$Res>  {
  factory $AttendanceStDtoCopyWith(AttendanceStDto value, $Res Function(AttendanceStDto) _then) = _$AttendanceStDtoCopyWithImpl;
@useResult
$Res call({
 String userId, String name, DateTime timestamp
});




}
/// @nodoc
class _$AttendanceStDtoCopyWithImpl<$Res>
    implements $AttendanceStDtoCopyWith<$Res> {
  _$AttendanceStDtoCopyWithImpl(this._self, this._then);

  final AttendanceStDto _self;
  final $Res Function(AttendanceStDto) _then;

/// Create a copy of AttendanceStDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,Object? name = null,Object? timestamp = null,}) {
  return _then(_self.copyWith(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [AttendanceStDto].
extension AttendanceStDtoPatterns on AttendanceStDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AttendanceStDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AttendanceStDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AttendanceStDto value)  $default,){
final _that = this;
switch (_that) {
case _AttendanceStDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AttendanceStDto value)?  $default,){
final _that = this;
switch (_that) {
case _AttendanceStDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String userId,  String name,  DateTime timestamp)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AttendanceStDto() when $default != null:
return $default(_that.userId,_that.name,_that.timestamp);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String userId,  String name,  DateTime timestamp)  $default,) {final _that = this;
switch (_that) {
case _AttendanceStDto():
return $default(_that.userId,_that.name,_that.timestamp);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String userId,  String name,  DateTime timestamp)?  $default,) {final _that = this;
switch (_that) {
case _AttendanceStDto() when $default != null:
return $default(_that.userId,_that.name,_that.timestamp);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AttendanceStDto implements AttendanceStDto {
   _AttendanceStDto({required this.userId, required this.name, required this.timestamp});
  factory _AttendanceStDto.fromJson(Map<String, dynamic> json) => _$AttendanceStDtoFromJson(json);

@override final  String userId;
@override final  String name;
@override final  DateTime timestamp;

/// Create a copy of AttendanceStDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AttendanceStDtoCopyWith<_AttendanceStDto> get copyWith => __$AttendanceStDtoCopyWithImpl<_AttendanceStDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AttendanceStDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AttendanceStDto&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.name, name) || other.name == name)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,name,timestamp);

@override
String toString() {
  return 'AttendanceStDto(userId: $userId, name: $name, timestamp: $timestamp)';
}


}

/// @nodoc
abstract mixin class _$AttendanceStDtoCopyWith<$Res> implements $AttendanceStDtoCopyWith<$Res> {
  factory _$AttendanceStDtoCopyWith(_AttendanceStDto value, $Res Function(_AttendanceStDto) _then) = __$AttendanceStDtoCopyWithImpl;
@override @useResult
$Res call({
 String userId, String name, DateTime timestamp
});




}
/// @nodoc
class __$AttendanceStDtoCopyWithImpl<$Res>
    implements _$AttendanceStDtoCopyWith<$Res> {
  __$AttendanceStDtoCopyWithImpl(this._self, this._then);

  final _AttendanceStDto _self;
  final $Res Function(_AttendanceStDto) _then;

/// Create a copy of AttendanceStDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? name = null,Object? timestamp = null,}) {
  return _then(_AttendanceStDto(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
