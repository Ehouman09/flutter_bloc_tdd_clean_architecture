
import 'package:educationapp/core/usecases/usecases.dart';
import 'package:educationapp/core/utils/typedefs.dart';
import 'package:educationapp/src/on_boarding/domain/repos/on_boarding_repo.dart';

class CheckIfUserIsFirstTimer extends UsecaseWithoutParams<bool>{


  const CheckIfUserIsFirstTimer(this._repo);

  final OnBoardingRepo _repo;

  @override
  ResultFuture<bool> call() => _repo.checkIfUserIsFirstTimer();


}