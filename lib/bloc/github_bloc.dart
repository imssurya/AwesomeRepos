import 'dart:async';

import 'package:AwesomeRepos/model/gihub_data_model.dart';
import 'package:AwesomeRepos/repository/repository_github.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

part 'github_event.dart';
part 'github_state.dart';

class GithubBloc extends Bloc<GithubEvent, GithubState> {
  final RepoGithub _repoGithub;
  GithubBloc(this._repoGithub) : super(Initial());

  @override
  Stream<GithubState> mapEventToState(
    GithubEvent event,
  ) async* {
    final currentState = state;
    if (event is FetchDataEvent) {
      try {
        if (currentState is Initial) {
          final data = await _repoGithub.GetDataFromApi(
            DateFormat('yyyy-MM-dd').format(
              DateTime.now().subtract(
                Duration(days: 30),
              ),
            ),
          );
          //print("count is " + data.items.length.toString());
          yield DataLoaded(githubDataModel: data);
        }
      } catch (e) {
        yield DataNotLoaded();
      }
    }
  }
}
