part of 'github_bloc.dart';

@immutable
abstract class GithubState {}

class Initial extends GithubState {}

class DataIsLoading extends GithubState {}

class DataLoaded extends GithubState {
  final DataModel githubDataModel;
  DataLoaded({@required this.githubDataModel})
      : assert(githubDataModel != null);
}

class DataNotLoaded extends GithubState {}
