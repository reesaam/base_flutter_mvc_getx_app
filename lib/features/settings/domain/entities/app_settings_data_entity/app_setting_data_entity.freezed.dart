// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_setting_data_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AppSettingDataEntity _$AppSettingDataEntityFromJson(Map<String, dynamic> json) {
  return _AppSettingDataEntity.fromJson(json);
}

/// @nodoc
mixin _$AppSettingDataEntity {
  bool get darkMode => throw _privateConstructorUsedError;
  AppLanguages get language => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppSettingDataEntityCopyWith<AppSettingDataEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppSettingDataEntityCopyWith<$Res> {
  factory $AppSettingDataEntityCopyWith(AppSettingDataEntity value,
          $Res Function(AppSettingDataEntity) then) =
      _$AppSettingDataEntityCopyWithImpl<$Res, AppSettingDataEntity>;
  @useResult
  $Res call({bool darkMode, AppLanguages language});
}

/// @nodoc
class _$AppSettingDataEntityCopyWithImpl<$Res,
        $Val extends AppSettingDataEntity>
    implements $AppSettingDataEntityCopyWith<$Res> {
  _$AppSettingDataEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? darkMode = null,
    Object? language = null,
  }) {
    return _then(_value.copyWith(
      darkMode: null == darkMode
          ? _value.darkMode
          : darkMode // ignore: cast_nullable_to_non_nullable
              as bool,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as AppLanguages,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppSettingDataEntityImplCopyWith<$Res>
    implements $AppSettingDataEntityCopyWith<$Res> {
  factory _$$AppSettingDataEntityImplCopyWith(_$AppSettingDataEntityImpl value,
          $Res Function(_$AppSettingDataEntityImpl) then) =
      __$$AppSettingDataEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool darkMode, AppLanguages language});
}

/// @nodoc
class __$$AppSettingDataEntityImplCopyWithImpl<$Res>
    extends _$AppSettingDataEntityCopyWithImpl<$Res, _$AppSettingDataEntityImpl>
    implements _$$AppSettingDataEntityImplCopyWith<$Res> {
  __$$AppSettingDataEntityImplCopyWithImpl(_$AppSettingDataEntityImpl _value,
      $Res Function(_$AppSettingDataEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? darkMode = null,
    Object? language = null,
  }) {
    return _then(_$AppSettingDataEntityImpl(
      darkMode: null == darkMode
          ? _value.darkMode
          : darkMode // ignore: cast_nullable_to_non_nullable
              as bool,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as AppLanguages,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AppSettingDataEntityImpl implements _AppSettingDataEntity {
  const _$AppSettingDataEntityImpl(
      {this.darkMode = false, this.language = AppLanguages.english});

  factory _$AppSettingDataEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppSettingDataEntityImplFromJson(json);

  @override
  @JsonKey()
  final bool darkMode;
  @override
  @JsonKey()
  final AppLanguages language;

  @override
  String toString() {
    return 'AppSettingDataEntity(darkMode: $darkMode, language: $language)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppSettingDataEntityImpl &&
            (identical(other.darkMode, darkMode) ||
                other.darkMode == darkMode) &&
            (identical(other.language, language) ||
                other.language == language));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, darkMode, language);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppSettingDataEntityImplCopyWith<_$AppSettingDataEntityImpl>
      get copyWith =>
          __$$AppSettingDataEntityImplCopyWithImpl<_$AppSettingDataEntityImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppSettingDataEntityImplToJson(
      this,
    );
  }
}

abstract class _AppSettingDataEntity implements AppSettingDataEntity {
  const factory _AppSettingDataEntity(
      {final bool darkMode,
      final AppLanguages language}) = _$AppSettingDataEntityImpl;

  factory _AppSettingDataEntity.fromJson(Map<String, dynamic> json) =
      _$AppSettingDataEntityImpl.fromJson;

  @override
  bool get darkMode;
  @override
  AppLanguages get language;
  @override
  @JsonKey(ignore: true)
  _$$AppSettingDataEntityImplCopyWith<_$AppSettingDataEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}

AppSettingDataEntitiesList _$AppSettingDataEntitiesListFromJson(
    Map<String, dynamic> json) {
  return _AppSettingDataEntitiesList.fromJson(json);
}

/// @nodoc
mixin _$AppSettingDataEntitiesList {
  List<AppSettingDataEntity> get appSettingsDataList =>
      throw _privateConstructorUsedError;
  set appSettingsDataList(List<AppSettingDataEntity> value) =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppSettingDataEntitiesListCopyWith<AppSettingDataEntitiesList>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppSettingDataEntitiesListCopyWith<$Res> {
  factory $AppSettingDataEntitiesListCopyWith(AppSettingDataEntitiesList value,
          $Res Function(AppSettingDataEntitiesList) then) =
      _$AppSettingDataEntitiesListCopyWithImpl<$Res,
          AppSettingDataEntitiesList>;
  @useResult
  $Res call({List<AppSettingDataEntity> appSettingsDataList});
}

/// @nodoc
class _$AppSettingDataEntitiesListCopyWithImpl<$Res,
        $Val extends AppSettingDataEntitiesList>
    implements $AppSettingDataEntitiesListCopyWith<$Res> {
  _$AppSettingDataEntitiesListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appSettingsDataList = null,
  }) {
    return _then(_value.copyWith(
      appSettingsDataList: null == appSettingsDataList
          ? _value.appSettingsDataList
          : appSettingsDataList // ignore: cast_nullable_to_non_nullable
              as List<AppSettingDataEntity>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppSettingDataEntitiesListImplCopyWith<$Res>
    implements $AppSettingDataEntitiesListCopyWith<$Res> {
  factory _$$AppSettingDataEntitiesListImplCopyWith(
          _$AppSettingDataEntitiesListImpl value,
          $Res Function(_$AppSettingDataEntitiesListImpl) then) =
      __$$AppSettingDataEntitiesListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<AppSettingDataEntity> appSettingsDataList});
}

/// @nodoc
class __$$AppSettingDataEntitiesListImplCopyWithImpl<$Res>
    extends _$AppSettingDataEntitiesListCopyWithImpl<$Res,
        _$AppSettingDataEntitiesListImpl>
    implements _$$AppSettingDataEntitiesListImplCopyWith<$Res> {
  __$$AppSettingDataEntitiesListImplCopyWithImpl(
      _$AppSettingDataEntitiesListImpl _value,
      $Res Function(_$AppSettingDataEntitiesListImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appSettingsDataList = null,
  }) {
    return _then(_$AppSettingDataEntitiesListImpl(
      appSettingsDataList: null == appSettingsDataList
          ? _value.appSettingsDataList
          : appSettingsDataList // ignore: cast_nullable_to_non_nullable
              as List<AppSettingDataEntity>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AppSettingDataEntitiesListImpl implements _AppSettingDataEntitiesList {
  _$AppSettingDataEntitiesListImpl(
      {this.appSettingsDataList = const <AppSettingDataEntity>[]});

  factory _$AppSettingDataEntitiesListImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$AppSettingDataEntitiesListImplFromJson(json);

  @override
  @JsonKey()
  List<AppSettingDataEntity> appSettingsDataList;

  @override
  String toString() {
    return 'AppSettingDataEntitiesList(appSettingsDataList: $appSettingsDataList)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppSettingDataEntitiesListImplCopyWith<_$AppSettingDataEntitiesListImpl>
      get copyWith => __$$AppSettingDataEntitiesListImplCopyWithImpl<
          _$AppSettingDataEntitiesListImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppSettingDataEntitiesListImplToJson(
      this,
    );
  }
}

abstract class _AppSettingDataEntitiesList
    implements AppSettingDataEntitiesList {
  factory _AppSettingDataEntitiesList(
          {List<AppSettingDataEntity> appSettingsDataList}) =
      _$AppSettingDataEntitiesListImpl;

  factory _AppSettingDataEntitiesList.fromJson(Map<String, dynamic> json) =
      _$AppSettingDataEntitiesListImpl.fromJson;

  @override
  List<AppSettingDataEntity> get appSettingsDataList;
  set appSettingsDataList(List<AppSettingDataEntity> value);
  @override
  @JsonKey(ignore: true)
  _$$AppSettingDataEntitiesListImplCopyWith<_$AppSettingDataEntitiesListImpl>
      get copyWith => throw _privateConstructorUsedError;
}
