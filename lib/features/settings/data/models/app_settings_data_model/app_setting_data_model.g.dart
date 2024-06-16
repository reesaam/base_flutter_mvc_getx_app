// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_setting_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppSettingDataModelImpl _$$AppSettingDataModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AppSettingDataModelImpl(
      darkMode: json['darkMode'] as bool? ?? false,
      language: $enumDecodeNullable(_$AppLanguagesEnumMap, json['language']) ??
          AppLanguages.english,
    );

Map<String, dynamic> _$$AppSettingDataModelImplToJson(
        _$AppSettingDataModelImpl instance) =>
    <String, dynamic>{
      'darkMode': instance.darkMode,
      'language': _$AppLanguagesEnumMap[instance.language]!,
    };

const _$AppLanguagesEnumMap = {
  AppLanguages.english: 'english',
  AppLanguages.deutsch: 'deutsch',
  AppLanguages.persian: 'persian',
};

_$AppSettingDataModelsListImpl _$$AppSettingDataModelsListImplFromJson(
        Map<String, dynamic> json) =>
    _$AppSettingDataModelsListImpl(
      appSettingsDataList: (json['appSettingsDataList'] as List<dynamic>?)
              ?.map((e) =>
                  AppSettingDataModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <AppSettingDataModel>[],
    );

Map<String, dynamic> _$$AppSettingDataModelsListImplToJson(
        _$AppSettingDataModelsListImpl instance) =>
    <String, dynamic>{
      'appSettingsDataList': instance.appSettingsDataList,
    };
