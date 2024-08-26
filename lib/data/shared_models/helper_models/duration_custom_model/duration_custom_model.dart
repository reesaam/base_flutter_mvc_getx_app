import 'package:freezed_annotation/freezed_annotation.dart';

part 'duration_custom_model.freezed.dart';
part 'duration_custom_model.g.dart';

@freezed
class DurationCustomModel with _$DurationCustomModel {
  const factory DurationCustomModel({
    final int? year,
    final int? month,
    final int? week,
    final int? day,
    final int? hour,
    final int? minute,
    final int? second,
    final int? milliSecond,
  }) = _DurationCustomModel;

  factory DurationCustomModel.fromJson(Map<String, dynamic> json) => _$DurationCustomModelFromJson(json);
}

@unfreezed
class DurationCustomModelsList with _$DurationCustomModelsList {
  factory DurationCustomModelsList({@Default(<DurationCustomModel>[]) List<DurationCustomModel> dataList}) = _DurationCustomModelsList;

  factory DurationCustomModelsList.fromJson(Map<String, dynamic> json) => _$DurationCustomModelsListFromJson(json);
}
