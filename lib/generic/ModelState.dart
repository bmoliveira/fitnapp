import 'package:scoped_model/scoped_model.dart';
import 'package:equatable/equatable.dart';

class ModelState<T extends Equatable> extends Model {
  T _value;

  T get value => _value;
  set value(T newValue) {
    final isEqual = _value == newValue;

    _value = newValue;

    if (!isEqual) {
      notifyListeners();
    }
  }

  ModelState(this._value) : super();
}
