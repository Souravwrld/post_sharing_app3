// text_post_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:post_sharing_app3/screens%20/bloc/share_bloc.dart';
import 'package:share_plus/share_plus.dart';

class TextPostScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShareBloc(),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('This is a sample text post'),
            BlocConsumer<ShareBloc, ShareState>(
              listener: (context, state) {
                if (state is LinkGenerated) {
                  // Share the generated link
                  Share.share(state.url);
                }
              },
              builder: (context, state) {
                return ElevatedButton(
                  onPressed: () {
                    context.read<ShareBloc>().add(GenerateLink(type: 'text'));
                  },
                  child: Text('Share'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
