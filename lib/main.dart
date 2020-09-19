import 'package:AwesomeRepos/bloc/github_bloc.dart';
import 'package:AwesomeRepos/repository/repository_github.dart';
import 'package:AwesomeRepos/views/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Awesome Repos',
        home: Scaffold(
          appBar: AppBar(
            title: Text('Awesome Repos'),
          ),
          body: BlocProvider(
            create: (context) =>
                GithubBloc(RepoGithub())..add(FetchDataEvent()),
            child: MyHomePage(),
          ),
        ));
  }
}
