// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_setting_data_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AppSettingDataModel _$AppSettingDataModelFromJson(Map<String, dynamic> json) {
  return _AppSettingDataModel.fromJson(json);
}

/// @nodoc
mixin _$AppSettingDataModel {
  bool get darkMode => throw _privateConstructorUsedError;
  AppLanguages get language => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppSettingDataModelCopyWith<AppSettingDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppSettingDataModelCopyWith<$Res> {
  factory $AppSettingDataModelCopyWith(
          AppSettingDataModel value, $Res Function(AppSettingDataModel) then) =
      _$AppSettingDataModelCopyWithImpl<$Res, AppSettingDataModel>;
  @useResult
  $Res call({bool darkMode, AppLanguages language});
}

/// @nodoc
class _$AppSettingDataModelCopyWithImpl<$Res, $Val extends AppSettingDataModel>
    implements $AppSettingDataModelCopyWith<$Res> {
  _$AppSettingDataModelCopyWithImpl(this._value, this._then);

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
abstract class _$$AppSettingDataModelImplCopyWith<$Res>
    implements $AppSettingDataModelCopyWith<$Res> {
  factory _$$AppSettingDataModelImplCopyWith(_$AppSettingDataModelImpl value,
          $Res Function(_$AppSettingDataModelImpl) then) =
      __$$AppSettingDataModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool darkMode, AppLanguages language});
}

/// @nodoc
class __$$AppSettingDataModelImplCopyWithImpl<$Res>
    extends _$AppSettingDataModelCopyWithImpl<$Res, _$AppSettingDataModelImpl>
    implements _$$AppSettingDataModelImplCopyWith<$Res> {
  __$$AppSettingDataModelImplCopyWithImpl(_$AppSettingDataModelImpl _value,
      $Res Function(_$AppSettingDataModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? darkMode = null,
    Object? language = null,
  }) {
    return _then(_$AppSettingDataModelImpl(
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
class _$AppSettingDataModelImpl implements _AppSettingDataModel {
  const _$AppSettingDataModelImpl(
      {this.darkMode = false, this.language = AppLanguages.english});

  factory _$AppSettingDataModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppSettingDataModelImplFromJson(json);

  @override
  @JsonKey()
  final bool darkMode;
  @override
  @JsonKey()
  final AppLanguages language;

  @override
  String toString() {
    return 'AppSettingDataModel(darkMode: $darkMode, language: $language)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppSettingDataModelImpl &&
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
  _$$AppSettingDataModelImplCopyWith<_$AppSettingDataModelImpl> get copyWith =>
      __$$AppSettingDataModelImplCopyWithImpl<_$AppSettingDataModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppSettingDataModelImplToJson(
      this,
    );
  }
}

abstract class _AppSettingDataModel implements AppSettingDataModel {
  const factory _AppSettingDataModel(
      {final bool darkMode,
      final AppLanguages language}) = _$AppSettingDataModelImpl;

  factory _AppSettingDataModel.fromJson(Map<String, dynamic> json) =
      _$AppSettingDataModelImpl.fromJson;

  @override
  bool get darkMode;
  @override
  AppLanguages get language;
  @override
  @JsonKey(ignore: true)
  _$$AppSettingDataModelImplCopyWith<_$AppSettingDataModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AppSettingDataModelsList _$AppSettingDataModelsListFromJson(
    Map<String, dynamic> json) {
  return _AppSettingDataModelsList.fromJson(json);
}

/// @nodoc
mixin _$AppSettingDataModelsList {
  List<AppSettingDataModel> get appSettingsDataList =>
      throw _privateConstructorUsedError;
  set appSettingsDataList(List<AppSettingDataModel> value) =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppSettingDataModelsListCopyWith<AppSettingDataModelsList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppSettingDataModelsListCopyWith<$Res> {
  factory $AppSettingDataModelsListCopyWith(AppSettingDataModelsList value,
          $Res Function(AppSettingDataModelsList) then) =
      _$AppSettingDataModelsListCopyWithImpl<$Res, AppSettingDataModelsList>;
  @useResult
  $Res call({List<AppSettingDataModel> appSettingsDataList});
}

/// @nodoc
class _$AppSettingDataModelsListCopyWithImpl<$Res,
        $Val extends AppSettingDataModelsList>
    implements $AppSettingDataModelsListCopyWith<$Res> {
  _$AppSettingDataModelsListCopyWithImpl(this._value, this._then);

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
              as List<AppSettingDataModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppSettingDataModelsListImplCopyWith<$Res>
    implements $AppSettingDataModelsListCopyWith<$Res> {
  factory _$$AppSettingDataModelsListImplCopyWith(
          _$AppSettingDataModelsListImpl value,
          $Res Function(_$AppSettingDataModelsListImpl) then) =
      __$$AppSettingDataModelsListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<AppSettingDataModel> appSettingsDataList});
}

/// @nodoc
class __$$AppSettingDataModelsListImplCopyWithImpl<$Res>
    extends _$AppSettingDataModelsListCopyWithImpl<$Res,
        _$AppSettingDataModelsListImpl>
    implements _$$AppSettingDataModelsListImplCopyWith<$Res> {
  __$$AppSettingDataModelsListImplCopyWithImpl(
      _$AppSettingDataModelsListImpl _value,
      $Res Function(_$AppSettingDataModelsListImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appSettingsDataList = null,
  }) {
    return _then(_$AppSettingDataModelsListImpl(
      appSettingsDataList: null == appSettingsDataList
          ? _value.appSettingsDataList
          : appSettingsDataList // ignore: cast_nullable_to_non_nullable
              as List<AppSettingDataModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AppSettingDataModelsListImpl implements _AppSettingDataModelsList {
  _$AppSettingDataModelsListImpl(
      {this.appSettingsDataList = const <AppSettingDataModel>[]});

  factory _$AppSettingDataModelsListImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppSettingDataModelsListImplFromJson(json);

  @override
  @JsonKey()
  List<AppSettingDataModel> appSettingsDataList;

  @override
  String toString() {
    return 'AppSettingDataModelsList(appSettingsDataList: $appSettingsDataList)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppSettingDataModelsListImplCopyWith<_$AppSettingDataModelsListImpl>
      get copyWith => __$$AppSettingDataModelsListImplCopyWithImpl<
          _$AppSettingDataModelsListImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppSettingDataModelsListImplToJson(
      this,
    );
  }
}

abstract class _AppSettingDataModelsList implements AppSettingDataModelsList {
  factory _AppSettingDataModelsList(
          {List<AppSettingDataModel> appSettingsDataList}) =
      _$AppSettingDataModelsListImpl;

  factory _AppSettingDataModelsList.fromJson(Map<String, dynamic> json) =
      _$AppSettingDataModelsListImpl.fromJson;

  @override
  List<AppSettingDataModel> get appSettingsDataList;
  set appSettingsDataList(List<AppSettingDataModel> value);
  @override
  @JsonKey(ignore: true)
  _$$AppSettingDataModelsListImplCopyWith<_$AppSettingDataModelsListImpl>
      get copyWith => throw _privateConstructorUsedError;
}
