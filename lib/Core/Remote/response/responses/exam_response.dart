import 'package:json_annotation/json_annotation.dart';

part 'exam_response.g.dart';

@JsonSerializable()
class ExamResponse {
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "exam")
  final List<Exam>? exam;

  ExamResponse({
    this.message,
    this.exam,
  });

  factory ExamResponse.fromJson(Map<String, dynamic> json) {
    return _$ExamResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ExamResponseToJson(this);
  }
}

@JsonSerializable()
class Exam {
  @JsonKey(name: "_id")
  final String? Id;
  @JsonKey(name: "title")
  final String? title;
  @JsonKey(name: "duration")
  final int? duration;
  @JsonKey(name: "subject")
  final String? subject;
  @JsonKey(name: "numberOfQuestions")
  final int? numberOfQuestions;
  @JsonKey(name: "active")
  final bool? active;
  @JsonKey(name: "createdAt")
  final String? createdAt;

  Exam({
    this.Id,
    this.title,
    this.duration,
    this.subject,
    this.numberOfQuestions,
    this.active,
    this.createdAt,
  });

  factory Exam.fromJson(Map<String, dynamic> json) {
    return _$ExamFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ExamToJson(this);
  }
}
