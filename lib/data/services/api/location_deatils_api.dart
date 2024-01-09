import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/data/services/common/header_common.dart';
import 'package:weather_app/module/model/location_details_model.dart';

Future<LocationDetailsModel?> locationDetailsApi({required String city}) async {
  Uri url = Uri.parse(
      'http://api.openweathermap.org/data/2.5/weather?q=$city,in&APPID=611e1363482924899f27617473a69754');
  var clients = http.Client();

  Map<String, String> headers = await CommonHeader.commonHeader();

  print('stock profile api ~ url $url');
  try {
    var response = await clients.get(url, headers: headers);

    print('stock profile api ~ status code ${response.statusCode}');
    print('stock profile api ~ response body ${response.body}');

    if (response.statusCode == 200) {
      final decodedRes = locationDetailsModelFromJson(response.body);

      return decodedRes;
    } else {
      print('Invalid details');
      return null;
    }
  } on PlatformException catch (e) {
    print('stock profile api ~ platform exception ~ $e');
    return null;
  } on http.ClientException catch (e) {
    print('stock profile api ~ platform exception ~ $e');
    return null;
  } catch (e) {
    print('stock profile api ~ platform exception ~ $e');
    return null;
  } finally {
    clients.close();
  }
}
