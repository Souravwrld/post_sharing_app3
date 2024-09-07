import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:post_sharing_app3/screens%20/image_post.dart';
import 'package:post_sharing_app3/screens%20/text_post.dart';
import 'package:post_sharing_app3/screens%20/video_post.dart';

import 'package:uni_links/uni_links.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  late StreamSubscription<String?> _sub;
  String? _initialLink;

  final List<Widget> _pages = [
    TextPostScreen(),
    VideoPostScreen(),
    ImagePostScreen(),
  ];

  @override
  void initState() {
    super.initState();
    initUniLinks();
  }

  Future<void> initUniLinks() async {
    // Handle initial link (the link that started the app)
    try {
      final String? initialLink = await getInitialLink();
      if (initialLink != null) {
        _handleIncomingLink(initialLink);
      }
    } on PlatformException catch (e) {
      print('Failed to get initial link: $e');
    }

    _sub = linkStream.listen((String? link) {
      if (link != null) {
        _handleIncomingLink(link);
      }
    }, onError: (err) {
      print('Failed to receive incoming link: $err');
    });
  }

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _handleIncomingLink(String link) {
    if (link.contains('/text')) {
      setState(() {
        _currentIndex = 0;
      });
    } else if (link.contains('/video')) {
      setState(() {
        _currentIndex = 1;
      });
    } else if (link.contains('/image')) {
      setState(() {
        _currentIndex = 2;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Post Share App')),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.text_fields), label: 'Text'),
          BottomNavigationBarItem(
              icon: Icon(Icons.video_library), label: 'Video'),
          BottomNavigationBarItem(icon: Icon(Icons.image), label: 'Image'),
        ],
      ),
    );
  }
}
