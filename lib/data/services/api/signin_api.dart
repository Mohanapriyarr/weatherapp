// import 'dart:convert';
// import 'dart:io';
// import 'package:aravind_mac_task/app/common_views/show_toast.dart';
// import 'package:aravind_mac_task/app/data/services/common/header_common.dart';
// import 'package:flutter/services.dart';
// import 'package:http/http.dart' as http;
// import 'package:aravind_mac_task/app/data/utils/config_strings.dart';

// Future<bool?> signInAPI(
//     {required String firstName,
//     required String lastName,
//     required String email,
//     required String mobNumber,
//     required String password}) async {
//   Uri url = Uri.parse('${Server.devURL}/sign-up');

//   String body = jsonEncode(<String, dynamic>{
//     'f_name': firstName,
//     'l_name': lastName,
//     'phone': mobNumber,
//     'email': email,
//     'password': password,
//   });

//   print('signin api ~ url ~ $url');

//   Map<String, String> headers = await CommonHeader.commonHeader();
//   var clients = http.Client();
//   print('signin api ~ body ~ $body');

//   try {
//     var response = await clients.post(url, body: body, headers: headers);

//     print('signin api ~ status code ~ ${response.statusCode}');
//     print('signin api ~ response body ~ ${response.body}');

//     final decodedRes = jsonDecode(response.body);

//     if (response.statusCode == 200) {
//       showToast(message: 'Resistration successful');
//       return true;
//     }
//     showToast(message: decodedRes['errors'][0]['message']);
//     return null;
//   } on PlatformException catch (e) {
//     print('signin api ~ platform exception ~ $e');

//     return null;
//   } on SocketException {
//     showToast(message: 'Check Your Internet Connection');
//     return null;
//   } on http.ClientException catch (e) {
//     print('signin api ~ client exception ~ $e');
//     return null;
//   } catch (e) {
//     return null;
//   } finally {
//     clients.close();
//   }
// }
