// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_questions_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckQuestionsResponse _$CheckQuestionsResponseFromJson(
        Map<String, dynamic> json) =>
    CheckQuestionsResponse(
      message: json['message'] as String?,
      correct: (json['correct'] as num?)?.toInt(),
      wrong: (json['wrong'] as num?)?.toInt(),
      total: json['total'] as String?,
      wrongQuestions: (json['WrongQuestions'] as List<dynamic>?)
          ?.map((e) => WrongQuestions.fromJson(e as Map<String, dynamic>))
          .toList(),
      correctQuestions: (json['correctQuestions'] as List<dynamic>?)
          ?.map((e) => CorrectQuestions.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CheckQuestionsResponseToJson(
        CheckQuestionsResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'correct': instance.correct,
      'wrong': instance.wrong,
      'total': instance.total,
      'WrongQuestions': instance.wrongQuestions,
      'correctQuestions': instance.correctQuestions,
    };

WrongQuestions _$WrongQuestionsFromJson(Map<String, dynamic> json) =>
    WrongQuestions(
      QID: json['QID'] as String?,
      Question: json['Question'] as String?,
      inCorrectAnswer: json['inCorrectAnswer'] as String?,
      correctAnswer: json['correctAnswer'] as String?,
      answers: (json['answers'] as List<dynamic>?)
          ?.map((e) => Answers.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$WrongQuestionsToJson(WrongQuestions instance) =>
    <String, dynamic>{
      'QID': instance.QID,
      'Question': instance.Question,
      'inCorrectAnswer': instance.inCorrectAnswer,
      'correctAnswer': instance.correctAnswer,
      'answers': instance.answers,
    };

Answers _$AnswersFromJson(Map<String, dynamic> json) => Answers();

Map<String, dynamic> _$AnswersToJson(Answers instance) => <String, dynamic>{};

CorrectQuestions _$CorrectQuestionsFromJson(Map<String, dynamic> json) =>
    CorrectQuestions(
      QID: json['QID'] as String?,
      Question: json['Question'] as String?,
      correctAnswer: json['correctAnswer'] as String?,
      answers: (json['answers'] as List<dynamic>?)
          ?.map((e) => Answers.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CorrectQuestionsToJson(CorrectQuestions instance) =>
    <String, dynamic>{
      'QID': instance.QID,
      'Question': instance.Question,
      'correctAnswer': instance.correctAnswer,
      'answers': instance.answers,
    };

CorrectAnswers _$CorrectAnswersFromJson(Map<String, dynamic> json) =>
    CorrectAnswers();

Map<String, dynamic> _$CorrectAnswersToJson(CorrectAnswers instance) =>
    <String, dynamic>{};
