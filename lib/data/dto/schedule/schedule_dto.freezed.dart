// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'schedule_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ScheduleDto {

@JsonKey(includeToJson: false) String? get id; String get name;@JsonKey(fromJson: _toDateTimeNonNull, toJson: _fromDateTimeNullable) DateTime get startDate;@JsonKey(fromJson: _toDateTimeNonNull, toJson: _fromDateTimeNullable) DateTime get endDate; String get target; String get description;
/// Create a copy of ScheduleDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScheduleDtoCopyWith<ScheduleDto> get copyWith => _$ScheduleDtoCopyWithImpl<ScheduleDto>(this as ScheduleDto, _$identity);

  /// Serializes this ScheduleDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ScheduleDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.target, target) || other.target == target)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,startDate,endDate,target,description);

@override
String toString() {
  return 'ScheduleDto(id: $id, name: $name, startDate: $startDate, endDate: $endDate, target: $target, description: $description)';
}


}

/// @nodoc
abstract mixin class $ScheduleDtoCopyWith<$Res>  {
  factory $ScheduleDtoCopyWith(ScheduleDto value, $Res Function(ScheduleDto) _then) = _$ScheduleDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(includeToJson: false) String? id, String name,@JsonKey(fromJson: _toDateTimeNonNull, toJson: _fromDateTimeNullable) DateTime startDate,@JsonKey(fromJson: _toDateTimeNonNull, toJson: _fromDateTimeNullable) DateTime endDate, String target, String description
});




}
/// @nodoc
class _$ScheduleDtoCopyWithImpl<$Res>
    implements $ScheduleDtoCopyWith<$Res> {
  _$ScheduleDtoCopyWithImpl(this._self, this._then);

  final ScheduleDto _self;
  final $Res Function(ScheduleDto) _then;

/// Create a copy of ScheduleDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = null,Object? startDate = null,Object? endDate = null,Object? target = null,Object? description = null,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime,target: null == target ? _self.target : target // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ScheduleDto].
extension ScheduleDtoPatterns on ScheduleDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ScheduleDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ScheduleDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ScheduleDto value)  $default,){
final _that = this;
switch (_that) {
case _ScheduleDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ScheduleDto value)?  $default,){
final _that = this;
switch (_that) {
case _ScheduleDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(includeToJson: false)  String? id,  String name, @JsonKey(fromJson: _toDateTimeNonNull, toJson: _fromDateTimeNullable)  DateTime startDate, @JsonKey(fromJson: _toDateTimeNonNull, toJson: _fromDateTimeNullable)  DateTime endDate,  String target,  String description)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ScheduleDto() when $default != null:
return $default(_that.id,_that.name,_that.startDate,_that.endDate,_that.target,_that.description);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(includeToJson: false)  String? id,  String name, @JsonKey(fromJson: _toDateTimeNonNull, toJson: _fromDateTimeNullable)  DateTime startDate, @JsonKey(fromJson: _toDateTimeNonNull, toJson: _fromDateTimeNullable)  DateTime endDate,  String target,  String description)  $default,) {final _that = this;
switch (_that) {
case _ScheduleDto():
return $default(_that.id,_that.name,_that.startDate,_that.endDate,_that.target,_that.description);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(includeToJson: false)  String? id,  String name, @JsonKey(fromJson: _toDateTimeNonNull, toJson: _fromDateTimeNullable)  DateTime startDate, @JsonKey(fromJson: _toDateTimeNonNull, toJson: _fromDateTimeNullable)  DateTime endDate,  String target,  String description)?  $default,) {final _that = this;
switch (_that) {
case _ScheduleDto() when $default != null:
return $default(_that.id,_that.name,_that.startDate,_that.endDate,_that.target,_that.description);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ScheduleDto implements ScheduleDto {
   _ScheduleDto({@JsonKey(includeToJson: false) this.id, required this.name, @JsonKey(fromJson: _toDateTimeNonNull, toJson: _fromDateTimeNullable) required this.startDate, @JsonKey(fromJson: _toDateTimeNonNull, toJson: _fromDateTimeNullable) required this.endDate, required this.target, required this.description});
  factory _ScheduleDto.fromJson(Map<String, dynamic> json) => _$ScheduleDtoFromJson(json);

@override@JsonKey(includeToJson: false) final  String? id;
@override final  String name;
@override@JsonKey(fromJson: _toDateTimeNonNull, toJson: _fromDateTimeNullable) final  DateTime startDate;
@override@JsonKey(fromJson: _toDateTimeNonNull, toJson: _fromDateTimeNullable) final  DateTime endDate;
@override final  String target;
@override final  String description;

/// Create a copy of ScheduleDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ScheduleDtoCopyWith<_ScheduleDto> get copyWith => __$ScheduleDtoCopyWithImpl<_ScheduleDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ScheduleDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ScheduleDto&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.target, target) || other.target == target)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,startDate,endDate,target,description);

@override
String toString() {
  return 'ScheduleDto(id: $id, name: $name, startDate: $startDate, endDate: $endDate, target: $target, description: $description)';
}


}

/// @nodoc
abstract mixin class _$ScheduleDtoCopyWith<$Res> implements $ScheduleDtoCopyWith<$Res> {
  factory _$ScheduleDtoCopyWith(_ScheduleDto value, $Res Function(_ScheduleDto) _then) = __$ScheduleDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(includeToJson: false) String? id, String name,@JsonKey(fromJson: _toDateTimeNonNull, toJson: _fromDateTimeNullable) DateTime startDate,@JsonKey(fromJson: _toDateTimeNonNull, toJson: _fromDateTimeNullable) DateTime endDate, String target, String description
});




}
/// @nodoc
class __$ScheduleDtoCopyWithImpl<$Res>
    implements _$ScheduleDtoCopyWith<$Res> {
  __$ScheduleDtoCopyWithImpl(this._self, this._then);

  final _ScheduleDto _self;
  final $Res Function(_ScheduleDto) _then;

/// Create a copy of ScheduleDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = null,Object? startDate = null,Object? endDate = null,Object? target = null,Object? description = null,}) {
  return _then(_ScheduleDto(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime,target: null == target ? _self.target : target // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
