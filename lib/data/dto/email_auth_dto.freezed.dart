// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'email_auth_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EmailAuthDto {

 String get email; String get uid;
/// Create a copy of EmailAuthDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EmailAuthDtoCopyWith<EmailAuthDto> get copyWith => _$EmailAuthDtoCopyWithImpl<EmailAuthDto>(this as EmailAuthDto, _$identity);

  /// Serializes this EmailAuthDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EmailAuthDto&&(identical(other.email, email) || other.email == email)&&(identical(other.uid, uid) || other.uid == uid));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,email,uid);

@override
String toString() {
  return 'EmailAuthDto(email: $email, uid: $uid)';
}


}

/// @nodoc
abstract mixin class $EmailAuthDtoCopyWith<$Res>  {
  factory $EmailAuthDtoCopyWith(EmailAuthDto value, $Res Function(EmailAuthDto) _then) = _$EmailAuthDtoCopyWithImpl;
@useResult
$Res call({
 String email, String uid
});




}
/// @nodoc
class _$EmailAuthDtoCopyWithImpl<$Res>
    implements $EmailAuthDtoCopyWith<$Res> {
  _$EmailAuthDtoCopyWithImpl(this._self, this._then);

  final EmailAuthDto _self;
  final $Res Function(EmailAuthDto) _then;

/// Create a copy of EmailAuthDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? email = null,Object? uid = null,}) {
  return _then(_self.copyWith(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [EmailAuthDto].
extension EmailAuthDtoPatterns on EmailAuthDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EmailAuthDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EmailAuthDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EmailAuthDto value)  $default,){
final _that = this;
switch (_that) {
case _EmailAuthDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EmailAuthDto value)?  $default,){
final _that = this;
switch (_that) {
case _EmailAuthDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String email,  String uid)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EmailAuthDto() when $default != null:
return $default(_that.email,_that.uid);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String email,  String uid)  $default,) {final _that = this;
switch (_that) {
case _EmailAuthDto():
return $default(_that.email,_that.uid);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String email,  String uid)?  $default,) {final _that = this;
switch (_that) {
case _EmailAuthDto() when $default != null:
return $default(_that.email,_that.uid);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EmailAuthDto implements EmailAuthDto {
   _EmailAuthDto({required this.email, required this.uid});
  factory _EmailAuthDto.fromJson(Map<String, dynamic> json) => _$EmailAuthDtoFromJson(json);

@override final  String email;
@override final  String uid;

/// Create a copy of EmailAuthDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EmailAuthDtoCopyWith<_EmailAuthDto> get copyWith => __$EmailAuthDtoCopyWithImpl<_EmailAuthDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EmailAuthDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EmailAuthDto&&(identical(other.email, email) || other.email == email)&&(identical(other.uid, uid) || other.uid == uid));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,email,uid);

@override
String toString() {
  return 'EmailAuthDto(email: $email, uid: $uid)';
}


}

/// @nodoc
abstract mixin class _$EmailAuthDtoCopyWith<$Res> implements $EmailAuthDtoCopyWith<$Res> {
  factory _$EmailAuthDtoCopyWith(_EmailAuthDto value, $Res Function(_EmailAuthDto) _then) = __$EmailAuthDtoCopyWithImpl;
@override @useResult
$Res call({
 String email, String uid
});




}
/// @nodoc
class __$EmailAuthDtoCopyWithImpl<$Res>
    implements _$EmailAuthDtoCopyWith<$Res> {
  __$EmailAuthDtoCopyWithImpl(this._self, this._then);

  final _EmailAuthDto _self;
  final $Res Function(_EmailAuthDto) _then;

/// Create a copy of EmailAuthDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? email = null,Object? uid = null,}) {
  return _then(_EmailAuthDto(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
