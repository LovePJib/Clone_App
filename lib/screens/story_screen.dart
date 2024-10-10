import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Story Layout',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark, // Dark theme
      ),
      home: StoryScreen(), // Use StoryScreen as the home
    );
  }
}

class StoryScreen extends StatelessWidget {
  StoryScreen({Key? key}) : super(key: key);

  final List<Map<String, String>> stories = [
    {'name': 'Tatake', 'image': 'assets/images/story1.jpg'},
    {'name': 'Friends', 'image': 'assets/images/story2.jpg'},
    {'name': 'Darawadee Punruk', 'image': 'assets/images/story3.jpg'},
    {'name': 'Siravit Samtap', 'image': 'assets/images/story4.jpg'},
    {'name': 'Street ahdawg', 'image': 'assets/images/story5.jpg'},
    {'name': 'School Friends', 'image': 'assets/images/story6.jpg'},
    {'name': 'Petch', 'image': 'assets/images/story7.jpg'},
    {'name': 'Naga', 'image': 'assets/images/story8.jpg'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stories'),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white, // Set text and icon color to white
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 2 columns
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: stories.length,
          itemBuilder: (context, index) {
            return StoryCard(
              name: stories[index]['name']!,
              image: stories[index]['image']!,
            );
          },
        ),
      ),
    );
  }
}

class StoryCard extends StatelessWidget {
  final String name;
  final String image;

  const StoryCard({required this.name, required this.image});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Handle story click
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          alignment: Alignment.bottomLeft,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: const LinearGradient(
              colors: [Colors.black54, Colors.transparent],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
          child: Text(
            name,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
