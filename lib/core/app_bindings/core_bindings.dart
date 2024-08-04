import 'package:get/get.dart';

import 'admin_bindings.dart';
import 'app_bindings.dart';
import 'components_bindings.dart';
import 'repositories_bindings.dart';
import 'storage_bindings.dart';

class CoreBindings implements Bindings {
  @override
  void dependencies() {
    AppStorageBindings().dependencies(); //Storage
    AppRepositoriesBindings().dependencies(); //Repositories
    AppComponentsBindings().dependencies(); //Components
    AppBindings().dependencies(); // Pages
    AdminBindings().dependencies(); // Admin related// Admin related
  }
}