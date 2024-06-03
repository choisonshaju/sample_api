import 'package:http/http.dart' as http;
import 'package:sample_api/datamodel.dart';

class Api {
  Future<List<Post>?> fetchdata() async {
    final uri = Uri.parse("https://jsonplaceholder.typicode.com/posts");
    final response = await http.get(uri);
    if (response.statusCode == 200 && response.statusCode < 300) {
      // print(response.body);
      var json = response.body;
      return postFromJson(json);
    }
  }
}
