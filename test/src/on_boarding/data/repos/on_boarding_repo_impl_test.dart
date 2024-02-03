


import 'package:dartz/dartz.dart';
import 'package:educationapp/core/errors/exceptions.dart';
import 'package:educationapp/core/errors/failures.dart';
import 'package:educationapp/src/on_boarding/data/datasources/on_boarding_local_data_source.dart';
import 'package:educationapp/src/on_boarding/data/repos/on_boarding_repo_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockOnBoardingLocalDataSource extends Mock implements OnBoardingLocalDataSource{}


void main() {

  late OnBoardingLocalDataSource localDataSource;
  late OnBoardingRepoImpl repoImpl;
  
  
  setUp(() {
    localDataSource = MockOnBoardingLocalDataSource();
    repoImpl = OnBoardingRepoImpl(localDataSource);

  });
  
  group('cacheFirstTimer', () {

    test('Should be complete successfully', () async {


      when(() => localDataSource.cacheFirstTimer())
          .thenAnswer(
            (_) async => Future.value(),
      );

      final result = await repoImpl.cacheFirstTimer();

      expect(result, equals(const Right<dynamic, void>(null)));

      verify(() => localDataSource.cacheFirstTimer());
      verifyNoMoreInteractions(localDataSource);


    });
    
    
    test(
        'Should be return [CacheFailure] when call to local source '
        'unsuccessful',
            () async {

          when(() => localDataSource.cacheFirstTimer()).thenThrow(
            const CacheException(message: 'Insufficient storage'),
          );


          final result = await repoImpl.cacheFirstTimer();
          
          expect(result, Left<CacheFailure, dynamic>(
            CacheFailure(message: 'Insufficient storage', statusCode: 500),
          ),);

          verify(() => localDataSource.cacheFirstTimer());
          verifyNoMoreInteractions(localDataSource);


    });

  });
  
  group('checkIfUserIsFirstTimer', () {


  });

}