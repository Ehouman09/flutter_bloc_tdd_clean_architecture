

import 'dart:convert';

import 'package:educationapp/core/utils/typedefs.dart';
import 'package:educationapp/src/auth/data/models/user_model.dart';
import 'package:educationapp/src/auth/domain/entities/user.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {


  final tLocalUserModel = LocalUserModel.empty();
  
  test('Should be a sub class of [LocalUser] entity',
          () => expect(tLocalUserModel, isA<LocalUser>(),),
  );

  final tMap = jsonDecode(fixture('user.json')) as DataMap;
  
  group('fromMap', () {
    
    
    test('should return a valid [LocalUserModel] from the map', () async {

      //act
      final result = LocalUserModel.fromMap(tMap);


      //assert
      expect(result, isA<LocalUserModel>());
      expect(result, equals(tLocalUserModel));

    });
    
    
  });


}