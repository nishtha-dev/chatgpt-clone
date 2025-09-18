

import '../../../../core/constants/auth_status.dart';
import '../../model/user_data_model.dart';

abstract class AuthRepository {
  Future<AuthStatus> loginUser({required LoginUserData userData});
  Future<AuthStatus> signUpUser({required SignUpUserData userData});
  Future<AuthStatus> forgotPassword({required String userEmail});
  Future<void> signOut();
  Future<void> createUserAccount({required String userName});
}
