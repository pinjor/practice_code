import 'package:shared_preferences/shared_preferences.dart';

Future<void> write_user_data(user_data) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('token', user_data['token']);
  await prefs.setString('_id', user_data['data']['_id']);
  await prefs.setString('email', user_data['data']['email']);
  await prefs.setString('firstName', user_data['data']['firstName']);
  await prefs.setString('lastName', user_data['data']['lastName']);
  await prefs.setString('mobile', user_data['data']['mobile']);
  await prefs.setString('createdDate', user_data['data']['createdDate']);
}

Future<void> WriteEmailVerification(email) async {
  final prefs = await SharedPreferences.getInstance();
  print(prefs);
  await prefs.setString('EmailVerification', email);
  print('${email}');
}

Future<void> WriteOTPVerification(otp) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('OTPVerification', otp);
  print('${otp}');
}

Future<String?> read_user_data(key) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  String? my_data = await prefs.getString(key);
  return my_data;
}

Future<bool> RemoveToken() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.clear();
  return true;
}

// ShowBase64Image(Base64String) {
//   UriData? data = Uri.parse(Base64String).data;
//   Uint8List MyImage = data!.contentAsBytes();
//   return MyImage;
// }
