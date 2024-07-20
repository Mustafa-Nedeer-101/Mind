import 'package:dartz/dartz.dart';
import 'package:mind/features/questions/business/entities/question_entity.dart';
import 'package:mind/features/questions/business/repositories/questions_repo.dart';
import 'package:mind/core/errors/failure.dart';

class GetQuestionsUsecase {
  final QuestionsRepo repo;

  GetQuestionsUsecase({required this.repo});

  Future<Either<Failure, List<QuestionEntity>>> call(
      {required int categoryId,
      required String difficulty,
      required int numOfQ}) async {
    return repo.getQuestions(
        categoryId: categoryId, difficulty: difficulty, numOfQ: numOfQ);
  }
}
