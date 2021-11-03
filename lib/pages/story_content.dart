import 'package:flutter/material.dart';
import 'package:story_view/story_view.dart';

class StoryContent extends StatefulWidget {
  const StoryContent({Key? key}) : super(key: key);

  @override
  State<StoryContent> createState() => _StoryContentState();
}

class _StoryContentState extends State<StoryContent> {
  final StoryController storyController = StoryController();


  @override
  void dispose() {
    storyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StoryView(
        controller: storyController,
        progressPosition: ProgressPosition.top,
        repeat: false,
        storyItems: [
          StoryItem.text(title: 'Bienvenidos a Carlos Cueto', backgroundColor: Colors.blue),
          StoryItem.text(title: 'Este es una historia de WhatsApp', backgroundColor: Colors.brown),
          StoryItem.pageImage(
              url: "https://media.giphy.com/media/5GoVLqeAOo6PK/giphy.gif",
              caption: "Probando gifs",
              controller: storyController),
          StoryItem.pageImage(
            url: "https://media.giphy.com/media/XcA8krYsrEAYXKf4UQ/giphy.gif",
            caption: "Hello, from the other side",
            controller: storyController,
          ),
          StoryItem.pageImage(
            url: "https://media.giphy.com/media/XcA8krYsrEAYXKf4UQ/giphy.gif",
            caption: "Hello, from the other side2",
            controller: storyController,
          ),
        ],
        onComplete: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
