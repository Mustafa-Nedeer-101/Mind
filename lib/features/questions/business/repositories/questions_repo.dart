import 'package:dartz/dartz.dart';
import 'package:mind/features/questions/business/entities/question_entity.dart';
import 'package:mind/core/errors/failure.dart';

abstract class QuestionsRepo {
  Future<Either<Failure, List<QuestionEntity>>> getQuestions(
      {required int categoryId, required String difficulty, required numOfQ});
}
