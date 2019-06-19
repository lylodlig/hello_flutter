import 'dart:async';
import 'package:hello_flutter/http/wan_api.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

/*数据接口类型errorCode>0是接口请求成功
{
"data": ...,
"errorCode": 0,
"errorMsg": ""
}
*/

//class Api {
//  static const String BaseUrl = "http://www.wanandroid.com/";
//}

//这里只封装了常见的get和post请求类型
class HttpUtil {
  static const String GET = "get";
  static const String POST = "post";

  static Future<dynamic> get(String url,
      {Function callback,
      Map<String, String> params,
      Map<String, String> headers,
      Function errorCallback}) async {
    if (params != null && params.isNotEmpty) {
      StringBuffer sb = new StringBuffer("?");
      params.forEach((key, value) {
        sb.write("$key" + "=" + "$value" + "&");
      });
      String paramStr = sb.toString();
      paramStr = paramStr.substring(0, paramStr.length - 1);
      url += paramStr;
    }
    return await _request(url,
        callback: callback,
        method: GET,
        headers: headers,
        errorCallback: errorCallback);
  }

  static void post(String url, Function callback,
      {Map<String, String> params,
      Map<String, String> headers,
      Function errorCallback}) async {
    await _request(url,
        callback: callback,
        method: POST,
        headers: headers,
        params: params,
        errorCallback: errorCallback);
  }

  static Future<dynamic> _request(String url,
      {Function callback,
      String method,
      Map<String, String> headers,
      Map<String, String> params,
      Function errorCallback}) async {
    String errorMsg;
    int errorCode;
    var data;

    if (!url.startsWith("http")) {
      url = Api.BaseUrl + url;
    }

    try {
      Map<String, String> headerMap = headers == null ? new Map() : headers;
      Map<String, String> paramMap = params == null ? new Map() : params;

      //统一添加cookie
      SharedPreferences sp = await SharedPreferences.getInstance();
      String cookie = sp.get("cookie");
      if (cookie == null || cookie.length == 0) {
      } else {
        headerMap['Cookie'] = cookie;
      }

      http.Response res;
      if (POST == method) {
        print("POST:URL=" + url);
        print("POST:BODY=" + paramMap.toString());
        res = await http.post(url, headers: headerMap, body: paramMap);
      } else {
        print("GET:URL=" + url);
        res = await http.get(url, headers: headerMap);
      }
      print('------------${res.body}');
      if (res.statusCode != 200) {
        errorMsg = "网络请求错误,状态码:" + res.statusCode.toString();
        _handError(errorCallback, errorMsg);
//        return data;
      }

      //以下部分可以根据自己业务需求封装,这里是errorCode>=0则为请求成功,data里的是数据部分
      Map<String, dynamic> map = json.decode(res.body);

      errorCode = map['errorCode'];
      errorMsg = map['errorMsg'];
      data = map['data'];

      //报存登录接口的cookie
      if (url.contains(Api.LOGIN)) {
        SharedPreferences sp = await SharedPreferences.getInstance();
        sp.setString("cookie", res.headers['set-cookie']);
      }

      // callback返回data,数据类型为dynamic
      //errorCallback中为了方便我直接返回了String类型的errorMsg
      if (callback != null) {
        if (errorCode >= 0) {
          callback(data);
        } else {
          _handError(errorCallback, errorMsg);
        }
      }
      return {"data": data, "status": res.statusCode};
    } catch (exception) {
      _handError(errorCallback, exception.toString());
    }
  }

  static void _handError(Function errorCallback, String errorMsg) {
    if (errorCallback != null) {
      errorCallback(errorMsg);
    }
    print("errorMsg :" + errorMsg);
  }
}
