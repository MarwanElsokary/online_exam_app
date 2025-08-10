import 'package:json_annotation/json_annotation.dart';

part 'submit_exam_request.g.dart';

@JsonSerializable()
class SubmitExamRequest {
  @JsonKey(name: "answers")
  final List<Answers>? answers;
  @JsonKey(name: "time")
  final int? time;

  SubmitExamRequest ({
    this.answers,
    this.time,
  });

  factory SubmitExamRequest.fromJson(Map<String, dynamic> json) {
    return _$SubmitExamRequestFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$SubmitExamRequestToJson(this);
  }
}

@JsonSerializable()
class Answers {
  @JsonKey(name: "questionId")
  final String? questionId;
  @JsonKey(name: "correct")
  final String? correct;

  Answers ({
    this.questionId,
    this.correct,
  });

  factory Answers.fromJson(Map<String, dynamic> json) {
    return _$AnswersFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AnswersToJson(this);
  }
}


