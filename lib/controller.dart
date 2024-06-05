import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sample_api/datamodel.dart';

// class Api {
//   Future<List<Post>?> fetchdata() async {
//     final uri = Uri.parse("https://jsonplaceholder.typicode.com/posts");
//     final response = await http.get(uri);
//     if (response.statusCode == 200 && response.statusCode < 300) {
//       // print(response.body);
//       var json = response.body;
//       return postFromJson(json);
//     }
//   }
// }

// class Api {
//   bool isLoading = false;
//   List<dynamic> data = [];
//   fetchdata() async {
//     isLoading = true;
//     final uri = Uri.parse("https://jsonplaceholder.typicode.com/posts");
//     final response = await http.get(uri);
//     if (response.statusCode == 200 && response.statusCode < 300) {
//       var decoddata = jsonDecode(response.body);

//       data = decoddata;
//       isLoading = false;
//       return data;
//     }
//   }
// }

class Api {
  bool isLoading = false;
  List<Article>? apiarticles;
  fetchdata() async {
    isLoading = true;
    final uri = Uri.parse(
        "https://newsapi.org/v2/everything?q=tesla&from=2024-05-04&sortBy=publishedAt&apiKey=495c2b81698449fbb279dd821685a0e4");
    final response = await http.get(uri);
    if (response.statusCode == 200 && response.statusCode < 300) {
      var decoddata = jsonDecode(response.body);
      var apiresponse = Apiarticles.fromJson(decoddata);
      apiarticles = apiresponse.articles;

      isLoading = false;
      return apiarticles;
    }
  }
}
