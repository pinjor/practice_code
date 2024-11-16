import 'dart:convert';

import 'package:http/http.dart';
import 'package:task_manager/ui/utils/styles.dart';
import 'package:task_manager/ui/utils/utility.dart';

var baseUrl = "http://35.73.30.144:2005/api/v1";

var request_header = {"Content-Type": "application/json"};

Future<bool> LoginRequest(formvalues) async {
  var Url = Uri.parse("${baseUrl}/Login");

  var postbody = jsonEncode(formvalues);

  var response = await post(Url, headers: request_header, body: postbody);

  var resultcode = response.statusCode;

  print(resultcode);

  var responsebody = jsonDecode(response.body);

  if (resultcode == 200 && responsebody['status'] == 'success') {
    SuccessToast('Request Success');
    await write_user_data(responsebody);
    return true;
  } else {
    ErrorToast('Error occured');
    return false;
  }
}

Future<bool> Registrationrequest(formvalues) async {
  var Url = Uri.parse('${baseUrl}/Registration');

  var postbody = jsonEncode(formvalues);

  var response = await post(Url, headers: request_header, body: postbody);

  var resultcode = response.statusCode;

  var responsebody = jsonDecode(response.body);

  if (resultcode == 200 && responsebody['status'] == 'success') {
    SuccessToast('Request Success');
    return true;
  } else {
    print(resultcode);
    print(responsebody['status']);
    ErrorToast('Error occured');
    return false;
  }
}

Future<bool> RecoverVerifyEmail(email) async {
  var Url = Uri.parse('${baseUrl}//RecoverVerifyEmail/${email}');

  var response = await get(Url, headers: request_header);

  var resultcode = response.statusCode;

  var responsebody = jsonDecode(response.body);

  if (resultcode == 200 && responsebody['status'] == 'success') {
    await WriteEmailVerification(email);
    print('3333');
    SuccessToast('Request Success');
    return true;
  } else {
    print(resultcode);
    print(responsebody);
    ErrorToast('Error occured');
    return false;
  }
}

Future<bool> RecoverVerifyotp(email, otp) async {
  var Url = Uri.parse('${baseUrl}/RecoverVerifyOtp/${email}/${otp}');

  var response = await get(Url, headers: request_header);

  var resultcode = response.statusCode;

  var responsebody = jsonDecode(response.body);

  if (resultcode == 200 && responsebody['status'] == 'success') {
    await WriteEmailVerification(otp);
    SuccessToast('Request Success');
    return true;
  } else {
    print(responsebody);
    print(resultcode);
    ErrorToast('Error occured');
    return false;
  }
}

Future<bool> RecoverResetPassword(formvalues) async {
  var Url = Uri.parse('${baseUrl}/RecoverResetPassword');

  var requestbody = jsonEncode(formvalues);

  var response = await post(Url, headers: request_header, body: requestbody);

  var resultcode = response.statusCode;

  var responsebody = jsonDecode(response.body);

  if (resultcode == 200 && responsebody['status'] == 'success') {
    SuccessToast('Request Success');
    return true;
  } else {
    print(responsebody);
    print(resultcode);
    ErrorToast('Error occurred');
    return false;
  }
}

Future<List> TaskListRequest(Status) async {
  var URL = Uri.parse("${baseUrl}/listTaskByStatus/${Status}");
  String? token = await read_user_data("token");
  var RequestHeaderWithToken = {
    "Content-Type": "application/json",
    "token": '$token'
  };
  var response = await get(URL, headers: RequestHeaderWithToken);
  var ResultCode = response.statusCode;
  var ResultBody = json.decode(response.body);
  if (ResultCode == 200 && ResultBody['status'] == "success") {
    SuccessToast("Request Success");
    return ResultBody['data'];
  } else {
    ErrorToast("Request fail ! try again");
    return [];
  }
}

Future<bool> TaskCreateRequest(FormValues) async {
  var URL = Uri.parse("${baseUrl}/createTask");
  String? token = await read_user_data("token");
  var RequestHeaderWithToken = {
    "Content-Type": "application/json",
    "token": '$token'
  };

  var PostBody = json.encode(FormValues);

  var response =
      await post(URL, headers: RequestHeaderWithToken, body: PostBody);
  var ResultCode = response.statusCode;
  var ResultBody = json.decode(response.body);
  if (ResultCode == 200 && ResultBody['status'] == "success") {
    SuccessToast("Request Success");
    return true;
  } else {
    ErrorToast("Request fail ! try again");
    return false;
  }
}

Future<bool> TaskDeleteRequest(id) async {
  var URL = Uri.parse("${baseUrl}/deleteTask/${id}");
  String? token = await read_user_data("token");
  var RequestHeaderWithToken = {
    "Content-Type": "application/json",
    "token": '$token'
  };
  var response = await get(URL, headers: RequestHeaderWithToken);
  var ResultCode = response.statusCode;
  var ResultBody = json.decode(response.body);
  if (ResultCode == 200 && ResultBody['status'] == "success") {
    SuccessToast("Request Success");
    return true;
  } else {
    ErrorToast("Request fail ! try again");
    return false;
  }
}

Future<bool> TaskUpdateRequest(id, status) async {
  var URL = Uri.parse("${baseUrl}/updateTaskStatus/${id}/${status}");
  String? token = await read_user_data("token");
  var RequestHeaderWithToken = {
    "Content-Type": "application/json",
    "token": '$token'
  };
  var response = await get(URL, headers: RequestHeaderWithToken);
  var ResultCode = response.statusCode;
  var ResultBody = json.decode(response.body);
  if (ResultCode == 200 && ResultBody['status'] == "success") {
    SuccessToast("Request Success");
    return true;
  } else {
    ErrorToast("Request fail ! try again");
    return false;
  }
}
