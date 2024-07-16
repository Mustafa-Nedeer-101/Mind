import 'package:dartz/dartz.dart';
import 'package:mind/features/questions/data/datasources/questions_local_datasource.dart';
import 'package:mind/features/questions/data/models/question_model.dart';
import 'package:mind/utils/errors/exceptions.dart';
import 'package:mind/utils/errors/failure.dart';
import '../../business/repositories/questions_repo.dart';

class QuestionsRepoImp implements QuestionsRepo {
  final QuestionsLocalDataSourceImp dataSource;

  QuestionsRepoImp({required this.dataSource});
  @override
  Future<Either<Failure, List<QuestionModel>>> getQuestions(
      {required int categoryId,
      required String difficulty,
      required numOfQ}) async {
    try {
      List<QuestionModel> questions = await dataSource.getQuestions(
          categoryId: categoryId, difficulty: difficulty, numOfQ: numOfQ);

      return Right(questions);
    } on CacheException {
      return Left(CacheFailure(errorMessage: 'Cache Exception Happened'));
    } catch (e) {
      return Left(CacheFailure(errorMessage: 'Exception Happened'));
    }
  }
}
