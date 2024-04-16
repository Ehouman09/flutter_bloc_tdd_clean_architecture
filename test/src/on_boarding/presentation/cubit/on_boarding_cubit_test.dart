import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:educationapp/core/errors/failures.dart';
import 'package:educationapp/src/on_boarding/domain/usecases/cache_first_timer.dart';
import 'package:educationapp/src/on_boarding/domain/usecases/check_if_user_is_first_timer.dart';
import 'package:educationapp/src/on_boarding/presentation/cubit/on_boarding_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MocCacheFirstTimer extends Mock implements CacheFirstTimer {}

class MockCheckIfUserIsFirstTimer extends Mock
    implements CheckIfUserIsFirstTimer {}

void main() {

  late CacheFirstTimer cacheFirstTimer;
  late CheckIfUserIsFirstTimer checkIfUserIsFirstTimer;
  late OnBoardingCubit cubit;

  final tFailure = CacheFailure(
    message: 'Insufficient Permission',
    statusCode: 4032,
  );


  setUp(() {

    cacheFirstTimer = MocCacheFirstTimer();
    checkIfUserIsFirstTimer = MockCheckIfUserIsFirstTimer();

    cubit = OnBoardingCubit(
        cacheFirstTimer: cacheFirstTimer,
        checkIfUserIsFirstTimer: checkIfUserIsFirstTimer,
    );


  });
  
  
  test('Initial state should be [OnBoardingInitial] ', () async {
    
    expect(cubit.state, const OnBoardingInitial());

    
  });
  
  group('CacheFirstTimer', () {
    
    blocTest<OnBoardingCubit, OnBoardingState>(
      'Should emit [CachingFirstTimer, UserCached] when successful',
      build: () {

        when(() => cacheFirstTimer()).
          thenAnswer(
              (_) async => const Right(null),
        );

        return cubit;

      },
      act: (cubit) => cubit.cacheFirstTimer(),
      expect: () => const[

         CachingFirstTimer(),
         UserCached(),

      ],
      verify: (_){

        verify(() => cacheFirstTimer()).called(1);
        verifyNoMoreInteractions(cacheFirstTimer);

      },);

    blocTest<OnBoardingCubit, OnBoardingState>(
        'Should emit [CachingFirstTimer, OnBoardingError] when unsuccessful',
        build: (){

          when(() => cacheFirstTimer()).
            thenAnswer(
                  (_) async => Left(tFailure,),
          );

          return cubit;
        },
      act: (cubit) => cubit.cacheFirstTimer(),
      expect: () =>  [
        const CachingFirstTimer(),
        OnBoardingError(tFailure.errorMessage),

      ],
      verify: (_){

        verify(() => cacheFirstTimer()).called(1);
        verifyNoMoreInteractions(cacheFirstTimer);

      },
    );

    
  });
  
  group('checkIfUserIsFirstTimer', () {

  blocTest<OnBoardingCubit, OnBoardingState>(
      'Should emit [CheckingIfFirstTimer, OnBoardingStatus] when successful',
      build: (){

        when(() => checkIfUserIsFirstTimer()).
          thenAnswer((_) async => const Right(false));


      return cubit;

      },
    act: (cubit) => cubit.checkIfUserIsFirstTimer(),
    expect: () => const[
      CheckingIfFirstTimer(),
      OnBoardingStatus(isFirstTimer: false),
    ],
    verify:(_) {
      verify(() => checkIfUserIsFirstTimer()).called(1);
      verifyNoMoreInteractions(checkIfUserIsFirstTimer);
    },
  );


  blocTest<OnBoardingCubit, OnBoardingState>(
      'Should emit [CheckingIfFirstTimer, OnBoardingStatus(true)] when unsuccessful',
      build: (){

        when(() => checkIfUserIsFirstTimer()).
        thenAnswer((_) async => Left(tFailure));


        return cubit;

      },
      act: (cubit) => cubit.checkIfUserIsFirstTimer(),
      expect: () => const[
         CheckingIfFirstTimer(),
        OnBoardingStatus(isFirstTimer: true),
      ],
      verify:(_) {
        verify(() => checkIfUserIsFirstTimer()).called(1);
        verifyNoMoreInteractions(checkIfUserIsFirstTimer);
      },
  );


  });


}
