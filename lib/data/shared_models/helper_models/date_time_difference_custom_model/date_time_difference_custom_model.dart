import 'package:freezed_annotation/freezed_annotation.dart';

part 'date_time_difference_custom_model.freezed.dart';
part 'date_time_difference_custom_model.g.dart';

@freezed
class DateTimeDifferenceCustomModel with _$DateTimeDifferenceCustomModel {
  const factory DateTimeDifferenceCustomModel({
    final int? year,
    final int? month,
    final int? week,
    final int? day,
    final int? hour,
    final int? minute,
    final int? second,
  }) = _DateTimeDifferenceCustomModel;

  factory DateTimeDifferenceCustomModel.fromJson(Map<String, dynamic> json) => _$DateTimeDifferenceCustomModelFromJson(json);
}

@unfreezed
class DateTimeDifferenceCustomModelsList with _$DateTimeDifferenceCustomModelsList {
  factory DateTimeDifferenceCustomModelsList({@Default(<DateTimeDifferenceCustomModel>[]) List<DateTimeDifferenceCustomModel> dataList}) = _DateTimeDifferenceCustomModelsList;

  factory DateTimeDifferenceCustomModelsList.fromJson(Map<String, dynamic> json) => _$DateTimeDifferenceCustomModelsListFromJson(json);
}
