

import 'package:educationapp/core/errors/exceptions.dart';
import 'package:educationapp/src/on_boarding/data/datasources/on_boarding_local_data_source.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {

  late SharedPreferences prefs;
  late OnBoardingLocalDataSource localDataSource;


  setUp(() {

    prefs = MockSharedPreferences();
    localDataSource = OnBoardingLocalDataSourceImpl(prefs);
    
  });
  
  group('cacheFirstTimer', () {
    
    
    test('Should call [SharedPreferences] to cache datas', () async {

      when(() => prefs.setBool(any(), any())).thenAnswer((_) async => true);

     await localDataSource.cacheFirstTimer();

     verify(() => prefs.setBool(kFirstTimerKey, false)).called(1);
     verifyNoMoreInteractions(prefs);

     //check if it's actualy saved
      //final result = prefs.getBool(kFirstTimerKey);
      //expect(result, false);

    });

    test(
        'Should throw a [CacheException] when there is an error caching data',
            () async {

            when(() => prefs.setBool(any(), any())).
                thenThrow(Exception());


            final methodCall = localDataSource.cacheFirstTimer;
            
            expect(methodCall, throwsA(isA<CacheException>()));

            verify(() => prefs.setBool(kFirstTimerKey, false)).called(1);
            verifyNoMoreInteractions(prefs);

            } );
    
  });
  
  group('checkIfUserIsFirstTimer', () {
    
    test(
        'Should call [SharedPreferences] to check if user is first timer and '
        'return the right response if data exist in the storage',
            () async {

          when(() => prefs.getBool(any())).thenReturn(false);

          final result = await localDataSource.checkIfUserIsFirstTimer();

          expect(result, false);

          verify(()=> prefs.getBool(kFirstTimerKey)).called(1);
          verifyNoMoreInteractions(prefs);
          
    });
    
    test(
        'Should return true if there is no data in storage',
            () async {

          when(() => prefs.getBool(any())).thenReturn(null);

          final result = await localDataSource.checkIfUserIsFirstTimer();

          expect(result, true);

          verify(()=> prefs.getBool(kFirstTimerKey)).called(1);
          verifyNoMoreInteractions(prefs);


            });
    
    test(
        'Should return [CacheException] when there is an error',
            () async {

            when(() => prefs.getBool(any())).thenThrow(Exception());

            final call = localDataSource.checkIfUserIsFirstTimer;
            
            expect(call, throwsA(isA<CacheException>()));

            verify(()=> prefs.getBool(kFirstTimerKey)).called(1);
            verifyNoMoreInteractions(prefs);

            });


  });

}