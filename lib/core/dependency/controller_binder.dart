import 'package:get/get.dart';
import 'package:mvc/controller/credential/credential_controller.dart';

class ControllerBinder extends Bindings{
  @override
  void dependencies() {
    Get.put(CredentialController());
    // Get.put(GetUserController());
  }
}