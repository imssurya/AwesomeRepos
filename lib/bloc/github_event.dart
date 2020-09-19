part of 'github_bloc.dart';

@immutable
abstract class GithubEvent {}

class FetchDataEvent extends GithubEvent {
  final String date;
  FetchDataEvent({this.date});
}
