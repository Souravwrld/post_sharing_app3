part of 'share_bloc.dart';

@immutable
sealed class ShareEvent {}

class GenerateLink extends ShareEvent {
  final String type;

  GenerateLink({required this.type});
}
