// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'at_history_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AtHistoryDto {

 String get userId; String get name; DateTime get timestamp; String get grade;
/// Create a copy of AtHistoryDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AtHistoryDtoCopyWith<AtHistoryDto> get copyWith => _$AtHistoryDtoCopyWithImpl<AtHistoryDto>(this as AtHistoryDto, _$identity);

  /// Serializes this AtHistoryDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AtHistoryDto&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.name, name) || other.name == name)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.grade, grade) || other.grade == grade));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,name,timestamp,grade);

@override
String toString() {
  return 'AtHistoryDto(userId: $userId, name: $name, timestamp: $timestamp, grade: $grade)';
}


}

/// @nodoc
abstract mixin class $AtHistoryDtoCopyWith<$Res>  {
  factory $AtHistoryDtoCopyWith(AtHistoryDto value, $Res Function(AtHistoryDto) _then) = _$AtHistoryDtoCopyWithImpl;
@useResult
$Res call({
 String userId, String name, DateTime timestamp, String grade
});




}
/// @nodoc
class _$AtHistoryDtoCopyWithImpl<$Res>
    implements $AtHistoryDtoCopyWith<$Res> {
  _$AtHistoryDtoCopyWithImpl(this._self, this._then);

  final AtHistoryDto _self;
  final $Res Function(AtHistoryDto) _then;

/// Create a copy of AtHistoryDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,Object? name = null,Object? timestamp = null,Object? grade = null,}) {
  return _then(_self.copyWith(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,grade: null == grade ? _self.grade : grade // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AtHistoryDto].
extension AtHistoryDtoPatterns on AtHistoryDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AtHistoryDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AtHistoryDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AtHistoryDto value)  $default,){
final _that = this;
switch (_that) {
case _AtHistoryDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AtHistoryDto value)?  $default,){
final _that = this;
switch (_that) {
case _AtHistoryDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String userId,  String name,  DateTime timestamp,  String grade)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AtHistoryDto() when $default != null:
return $default(_that.userId,_that.name,_that.timestamp,_that.grade);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String userId,  String name,  DateTime timestamp,  String grade)  $default,) {final _that = this;
switch (_that) {
case _AtHistoryDto():
return $default(_that.userId,_that.name,_that.timestamp,_that.grade);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String userId,  String name,  DateTime timestamp,  String grade)?  $default,) {final _that = this;
switch (_that) {
case _AtHistoryDto() when $default != null:
return $default(_that.userId,_that.name,_that.timestamp,_that.grade);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AtHistoryDto implements AtHistoryDto {
   _AtHistoryDto({required this.userId, required this.name, required this.timestamp, required this.grade});
  factory _AtHistoryDto.fromJson(Map<String, dynamic> json) => _$AtHistoryDtoFromJson(json);

@override final  String userId;
@override final  String name;
@override final  DateTime timestamp;
@override final  String grade;

/// Create a copy of AtHistoryDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AtHistoryDtoCopyWith<_AtHistoryDto> get copyWith => __$AtHistoryDtoCopyWithImpl<_AtHistoryDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AtHistoryDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AtHistoryDto&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.name, name) || other.name == name)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.grade, grade) || other.grade == grade));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,name,timestamp,grade);

@override
String toString() {
  return 'AtHistoryDto(userId: $userId, name: $name, timestamp: $timestamp, grade: $grade)';
}


}

/// @nodoc
abstract mixin class _$AtHistoryDtoCopyWith<$Res> implements $AtHistoryDtoCopyWith<$Res> {
  factory _$AtHistoryDtoCopyWith(_AtHistoryDto value, $Res Function(_AtHistoryDto) _then) = __$AtHistoryDtoCopyWithImpl;
@override @useResult
$Res call({
 String userId, String name, DateTime timestamp, String grade
});




}
/// @nodoc
class __$AtHistoryDtoCopyWithImpl<$Res>
    implements _$AtHistoryDtoCopyWith<$Res> {
  __$AtHistoryDtoCopyWithImpl(this._self, this._then);

  final _AtHistoryDto _self;
  final $Res Function(_AtHistoryDto) _then;

/// Create a copy of AtHistoryDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? name = null,Object? timestamp = null,Object? grade = null,}) {
  return _then(_AtHistoryDto(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,grade: null == grade ? _self.grade : grade // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
