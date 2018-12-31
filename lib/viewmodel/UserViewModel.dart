import 'package:gym_track/model/User.dart';
import 'package:scoped_model/scoped_model.dart';

class UserViewModel extends Model {
  User _user;

  void updateUser(User user) {
    this._user = user;
    notifyListeners();
  }

  bool get loaded => _user != null;

  String get name => _user.name;
}
