import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'share_event.dart';
part 'share_state.dart';

class ShareBloc extends Bloc<ShareEvent, ShareState> {
  ShareBloc() : super(ShareInitial()) {
    on<GenerateLink>((event, emit) async {
      final String url = 'https://post-sharing-app2.vercel.app/${event.type}';

      emit(LinkGenerated(url));
    });
  }
}
