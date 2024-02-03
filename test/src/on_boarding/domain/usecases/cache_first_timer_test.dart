import 'package:dartz/dartz.dart';
import 'package:educationapp/core/errors/failures.dart';
import 'package:educationapp/src/on_boarding/domain/repos/on_boarding_repo.dart';
import 'package:educationapp/src/on_boarding/domain/usecases/cache_first_timer.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockOnBoardingRepo extends Mock implements OnBoardingRepo{}

void main() {

  late OnBoardingRepo repo;
  late CacheFirstTimer usecase;

  setUp((){

    repo = MockOnBoardingRepo();
    usecase = CacheFirstTimer(repo);

  });
  
  
  test('Should call the [OnBoardingRepo.CacheFirstTimer]', () async {


    when(() => repo.cacheFirstTimer()).
    thenAnswer((_) async => Left(
        ServerFailure(message: 'Unknown Error Occured', statusCode: 500),),
    );

    final result = await usecase();
    
    
    expect(
      result,
      equals(
      Left<Failure, dynamic>(
        ServerFailure(
            message: 'Unknown Error Occured',
            statusCode: 500,
        ),
      ),
      ),
    );


    verify(() => repo.cacheFirstTimer()).called(1);
    verifyNoMoreInteractions(repo);



  });

}