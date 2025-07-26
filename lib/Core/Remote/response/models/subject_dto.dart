import 'package:json_annotation/json_annotation.dart';
import '../../../../Features/Home/domain/model/subject.dart';

part 'subject_dto.g.dart';

@JsonSerializable()
class SubjectDto {
  @JsonKey(name: "_id")
  final String? Id;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "icon")
  final String? icon;
  @JsonKey(name: "createdAt")
  final String? createdAt;

  SubjectDto({
    this.Id,
    this.name,
    this.icon,
    this.createdAt,
  });

  factory SubjectDto.fromJson(Map<String, dynamic> json) {
    return _$SubjectDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$SubjectDtoToJson(this);
  }

  Subject toSubject() {
    return Subject(
      id: Id,
      name: name,
      icon: icon,
      createdAt: createdAt,
    );
  }
}
