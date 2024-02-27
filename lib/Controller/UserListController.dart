
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart'as http;
import 'package:get/get.dart';
import 'package:post_project/Models/UserModels.dart';

import '../APIConstant.dart';

class UserListController extends GetxController implements GetxService{

  var isLoading = true.obs;
  var getUserList = <Data>[].obs;


  @override
  void onInit() {
    super.onInit();
    userList();
  }

  Future<dynamic> userList() async {
    try {
      final response = await http.get(
        Uri.parse(APIConstant.url),
        headers: APIConstant.authHeader,
      );
      debugPrint("UserList");
      debugPrint(response.body);
      const utf8Decoder = Utf8Decoder(allowMalformed: true);
      final decodedBytes = utf8Decoder.convert(response.bodyBytes);
      Map<String, dynamic> responseBody = json.decode(decodedBytes);
      if (response.statusCode == 200) {
        isLoading.value = false;
        UserModels model = UserModels.fromJson(responseBody);
        getUserList.value = model.data!;
      }
    } on TimeoutException catch (e) {
      isLoading.value = false;
      debugPrint(e.toString());
    } on SocketException catch (e) {
      isLoading.value = false;
      debugPrint(e.toString());
    } on Error catch (e) {
      isLoading.value = false;
      debugPrint(e.toString());
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }

}