
import 'dart:io';

class APIConstant{

  static const url = 'https://reqres.in/api/users?page=2';

  static Map<String, String> authHeader  = {
    HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8'
  };

}