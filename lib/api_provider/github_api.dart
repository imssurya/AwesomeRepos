import 'dart:convert';
import 'package:AwesomeRepos/model/gihub_data_model.dart';
import 'package:http/http.dart' as http;

class ApiGithub {
  final int successCode = 200;
  Future<DataModel> fetchGitHubData(String date) async {
    final response = await http.Client().get(
        "https://api.github.com/search/repositories?q=created:>$date&sort=stars&order=desc");
    if (response.statusCode != 200) {
      print("Error Occured");
    }
    print(response.body);
    return parsedResult(response.body);
  }

  DataModel parsedResult(final response) {
    final jsonData = json.decode(response);
    return DataModel.fromJson(jsonData);
  }
}
