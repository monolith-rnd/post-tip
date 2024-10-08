import 'package:flutter/material.dart';
import 'package:post_tip/post_tip.dart';

void main() => runApp(const ExampleApp());

class ExampleApp extends StatelessWidget {
  const ExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PostTip Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),

      /// PostTip around a single item.
      home: const PostTipPage(),

      /// PostTip in a ScrollView
      // home: const PostTipScrollPage(),
    );
  }
}

const positions = <PostTipPosition>[
  PostTipPosition.topStart,
  PostTipPosition.topCenter,
  PostTipPosition.topEnd,
  PostTipPosition.rightStart,
  PostTipPosition.rightCenter,
  PostTipPosition.rightEnd,
  PostTipPosition.bottomEnd,
  PostTipPosition.bottomCenter,
  PostTipPosition.bottomStart,
  PostTipPosition.leftEnd,
  PostTipPosition.leftCenter,
  PostTipPosition.leftStart,
];

class PostTipPage extends StatefulWidget {
  const PostTipPage({super.key});

  @override
  State<PostTipPage> createState() => _PostTipPageState();
}

class _PostTipPageState extends State<PostTipPage> {
  int _index = 0;
  final controller = PostTipController(value: PostTipStatus.hidden);

  @override
  void initState() {
    super.initState();
    controller.show();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: PostTip(
              controller: controller,
              position: positions[_index],
              distance: 4,
              backgroundColor: Colors.lightBlue,
              content: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                child: Text('PostTip'),
              ),
              child: GestureDetector(
                onTap: () {
                  showGeneralDialog(
                    context: context,
                    pageBuilder: (context, animation, secondaryAnimation) {
                      return AlertDialog(
                        title: const Text('ToolTip'),
                        content: const Text('ToolTip above dialog'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'OK'),
                            child: const Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Container(
                  color: Colors.yellow,
                  padding: const EdgeInsets.all(8),
                  child: const Icon(
                    Icons.favorite,
                    color: Colors.pink,
                    size: 64.0,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            child: ElevatedButton(
              onPressed: () {
                if (controller.isShown) {
                  controller.hide();
                } else {
                  controller.show();
                }
              },
              child: Text('show and hide'),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _updatePostTipPosition,
        tooltip: 'Next position',
        child: const Icon(Icons.refresh),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void _updatePostTipPosition() {
    setState(() {
      _index = (_index + 1) % positions.length;
    });
  }
}

class PostTipScrollPage extends StatelessWidget {
  const PostTipScrollPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              buildPostTip(),
              const SizedBox(height: 8),
              buildPostTip(),
              const SizedBox(height: 8),
              buildPostTip(isTip: true),
              const SizedBox(height: 8),
              buildPostTip(),
              const SizedBox(height: 8),
              buildPostTip(),
              const SizedBox(height: 8),
              buildPostTip(),
              const SizedBox(height: 8),
              buildPostTip(),
              const SizedBox(height: 8),
              buildPostTip(),
              const SizedBox(height: 8),
              buildPostTip(),
              const SizedBox(height: 8),
              buildPostTip(),
              const SizedBox(height: 8),
              buildPostTip(),
              const SizedBox(height: 8),
              buildPostTip(),
              const SizedBox(height: 8),
              buildPostTip(),
              const SizedBox(height: 8),
              buildPostTip(),
              const SizedBox(height: 8),
              buildPostTip(),
              const SizedBox(height: 8),
              buildPostTip(),
              const SizedBox(height: 8),
              buildPostTip(),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPostTip({bool isTip = false}) {
    if (isTip) {
      return Center(
        child: PostTip(
          position: PostTipPosition.leftStart,
          distance: 4,
          backgroundColor: Colors.lightBlue,
          content: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
            child: Text('PostTip'),
          ),
          child: Container(
            color: Colors.yellow,
            padding: const EdgeInsets.all(8),
            child: const Icon(
              Icons.favorite,
              color: Colors.pink,
              size: 64.0,
            ),
          ),
        ),
      );
    } else {
      return Container(
        color: Colors.yellow,
        padding: const EdgeInsets.all(8),
        child: const Icon(
          Icons.favorite,
          color: Colors.pink,
          size: 64.0,
        ),
      );
    }
  }
}
