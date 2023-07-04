import 'package:med_alert/features/authentication/domain/entities/user_profile.dart';

class UserModel extends UserProfile {
  const UserModel({
    super.id,
    super.email,
    super.password,
    super.username,
  });
}
