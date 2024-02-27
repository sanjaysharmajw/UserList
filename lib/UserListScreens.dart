import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:post_project/Controller/UserListController.dart';
import 'package:post_project/UserItems.dart';

class UserListScreen extends StatefulWidget {
  const UserListScreen({super.key});

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  final userListController = Get.put(UserListController(),permanent: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.green,
          statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
          statusBarBrightness: Brightness.light, // For iOS (dark icons)
        ),
        titleSpacing: 5,
        centerTitle: false,
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.green,
        title: const Text("User List",
            style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.w600)),
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              return userListController.getUserList.isEmpty
                  ? const Center(
                      child: Text("data"),
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      itemCount: userListController.getUserList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return UserItems(
                            data: userListController.getUserList[index]);
                      });
            }),
          )
        ],
      ),
    );
  }
}
