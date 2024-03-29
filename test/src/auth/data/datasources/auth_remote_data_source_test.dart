import 'package:educationapp/src/auth/data/datasources/auth_remote_data_source.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:firebase_storage_mocks/firebase_storage_mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_sign_in_mocks/google_sign_in_mocks.dart';

void main() {

  late FakeFirebaseFirestore cloudStoreClient;
  late MockFirebaseAuth authClient;
  late MockFirebaseStorage dbClient;
  late AuthRemoteDataSource dataSource;


  setUp(() async {

    cloudStoreClient = FakeFirebaseFirestore();
    authClient = MockFirebaseAuth();
    dbClient = MockFirebaseStorage();
    dataSource = AuthRemoteDataSourceImpl(
        authClient: authClient,
        cloudStoreClient: cloudStoreClient,
        dbClient: dbClient,
    );

    // Mock sign in with Google.
    final googleSignIn = MockGoogleSignIn();
    final signinAccount = await googleSignIn.signIn();
    final googleAuth = await signinAccount!.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    // Sign in.
    final mockUser = MockUser(
      uid: 'someuid',
      email: 'bob@somedomain.com',
      displayName: 'Bob',
    );
    authClient = MockFirebaseAuth(mockUser: mockUser);
    final result = await authClient.signInWithCredential(credential);
    final user = result.user;

    dbClient = MockFirebaseStorage();

    dataSource = AuthRemoteDataSourceImpl(
        authClient: authClient,
        cloudStoreClient: cloudStoreClient,
        dbClient: dbClient,
    );


  });

  const tPassword = 'Test Password';
  const tFullName = 'Test Full Name';
  const tEmail = 'test@email.com';





  test(
      'signUp',
          () async {

            //Act
            await dataSource.signUp(
              email: tEmail,
              fullName: tFullName,
              password: tPassword,
            );
            
            
            expect(authClient.currentUser, isNotNull);
            expect(authClient.currentUser!.displayName, tFullName);




          }
  );

}
