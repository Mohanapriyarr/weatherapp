import 'package:fluttertoast/fluttertoast.dart';
import 'package:weather_app/data/utils/color_utils.dart';

Future<void> showToast({required String messsage}) async {
  Fluttertoast.showToast(
      msg: "This is Center Short Toast",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: BLACK,
      textColor: WHITE,
      fontSize: 16.0);
}
