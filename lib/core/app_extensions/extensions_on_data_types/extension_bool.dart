import 'package:get/get.dart';

extension RxFunctions on Rx<bool> {
  get invert => value = !value;
  get clear => value = false;
}

extension Functions on bool {
  get invert => !this;
  get clear => false;
}

extension RxFunctionsNull on Rx<bool?> {
  get invert => value = value == true ? false : true;
  get clear => value = false;
}

extension FunctionsNull on bool? {
  get invert => this == true ? false : true;
  get clear => null;
}
