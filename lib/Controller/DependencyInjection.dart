
import 'package:get/get.dart';
import 'package:post_project/Controller/NetworkController.dart';

class DependencyInjection {
  static void init() {
    Get.put<NetworkController>(NetworkController(),permanent:true);
  }
}