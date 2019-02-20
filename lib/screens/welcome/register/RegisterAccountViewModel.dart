import 'package:gym_track/viewmodel/UserViewModel.dart';
import 'package:scoped_model/scoped_model.dart';

class RegisterAccountViewModel extends Model {
  UserViewModel _userViewModel;

  RegisterAccountViewModel(this._userViewModel) : super();

  String name;
  String nameError;

  void nameChanged(String name) {
    this.name = name;
  }

  bool isValid() {
    return false;
  }

  void validate() {}
}
