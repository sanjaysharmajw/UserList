
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:post_project/Controller/UserListController.dart';

class NetworkController extends GetxController {
  final Connectivity _connectivity = Connectivity();
  var currentPage = 0.obs;

  RxBool checkConnectivityResult=false.obs;
  final listUpdate=Get.put(UserListController());

  @override
  void onInit() {
    super.onInit();
    _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  void _updateConnectionStatus(ConnectivityResult connectivityResult) {
    if (connectivityResult == ConnectivityResult.none) {
      checkConnectivityResult.value=true;
      listUpdate.userList();
    } else {
      checkConnectivityResult.value=false;
    }
  }
}