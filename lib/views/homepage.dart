import 'package:AwesomeRepos/bloc/github_bloc.dart';
import 'package:AwesomeRepos/model/gihub_data_model.dart';
import 'package:AwesomeRepos/repository/repository_github.dart';
import 'package:AwesomeRepos/views/datapage.dart';
import 'package:AwesomeRepos/views/errorpage.dart';
import 'package:AwesomeRepos/views/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GithubBloc _githubBloc;

  @override
  void initState() {
    super.initState();
    _githubBloc = BlocProvider.of<GithubBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GithubBloc, GithubState>(
      builder: (context, state) {
        if (state is Initial) {
          return LoadingPage();
        }
        if (state is DataIsLoading) {
          return LoadingPage();
        }
        if (state is DataLoaded) {
          final List<Items> data = state.githubDataModel.items;
          return DataPage(
            githubData: data,
          );
        }
        if (state is DataNotLoaded) {
          return ErrorPage();
        } else {
          print(state);
          return Container();
        }
      },
    );
  }
}
