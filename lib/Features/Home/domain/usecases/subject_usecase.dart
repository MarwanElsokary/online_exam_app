import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/Core/Remote/response/responses/subject_response.dart';
import 'package:online_exam/Features/Home/domain/repositories/subjects_repo.dart';

@injectable
class SubjectUseCase {
  SubjectsRepository repository;

  SubjectUseCase(this.repository);

  Future<List<Subjects>> invoke({
    String?id,
    String? title,
    Icon?icon

  }) {
    return repository.getAllSubjects(
      id: id,
      title: title,
      icon: icon,
    );
  }
}
