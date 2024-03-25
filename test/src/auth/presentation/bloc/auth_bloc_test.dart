
import 'package:educationapp/src/auth/presentation/bloc/auth_bloc.dart';
import 'package:mocktail/mocktail.dart';

class MockSingIn extends Mock implements SignedIn {}

class MockSingUp extends Mock implements SignedUp {}

class MockForgotPassWord extends Mock implements ForgotPasswordEvent {}

class MockUpdateUser extends Mock implements UpdateUserEvent {}


void main() {


}