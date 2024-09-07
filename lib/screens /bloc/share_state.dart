part of 'share_bloc.dart';

@immutable
sealed class ShareState {}

final class ShareInitial extends ShareState {}

class LinkGenerated extends ShareState {
  final String url;

  LinkGenerated(this.url);
}
