import 'package:http/http.dart' as http;

void main(){
  var t=getMessage();
}

// GET请求
Future<String> getMessage() async {
  try {
    final response = await http.get('https://www.baidu.com/');
    if (response.statusCode == 200) {
      return response.body;
    }
  } catch (e) {
    print('getMessage: $e');
  }
  return null;
}
