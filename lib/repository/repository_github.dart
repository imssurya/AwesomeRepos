import 'package:AwesomeRepos/api_provider/github_api.dart';
import 'package:AwesomeRepos/model/gihub_data_model.dart';

class RepoGithub {
  ApiGithub _apiGithub = ApiGithub();
  Future<DataModel> GetDataFromApi(String date) async {
    return _apiGithub.fetchGitHubData(date);
  }
}
