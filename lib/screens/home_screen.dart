import 'package:clone_profile/component/chat_page.dart';
import 'package:flutter/material.dart';
import 'story_screen.dart'; // Import the StoryScreen

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0; // Track the selected index
  final TextEditingController _searchController = TextEditingController();

  final List<Message> messages = [
    Message(sender: "Jingleed", text: "Hey there!", imageUrl: 'assets/images/Jingleed.jpg'),
    Message(sender: "Kero", text: "How's it going?", imageUrl: 'assets/images/Kero.jpg'),
    Message(sender: "kiriko", text: "See you later!", imageUrl: 'assets/images/kiriko nagi.jpg'),
    Message(sender: "Neon", text: "Are we still on for lunch?", imageUrl: 'assets/images/Neon.png'),
    Message(sender: "Neoon", text: "Just finished the project!", imageUrl: 'assets/images/Neoon.png'),
    Message(sender: "Reze", text: "Did you get my last message?", imageUrl: 'assets/images/Reze color.jpg'),
    Message(sender: "Rezia", text: "Let’s catch up this weekend!", imageUrl: 'assets/images/Reze4.jpg'),
    Message(sender: "Yoru", text: "What’s the plan for tonight?", imageUrl: 'assets/images/Yoru3.jpg'),
  ];

  final List<String> customMessages = [
    "Hey!",
    "Hi",
    "Hello",
    "Cheers!",
    "Greetings",
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Update navigation based on the remaining items
    if (index == 0) { // If "Chats" tab is tapped
      print("Selected Chats");
    } else if (index == 1) { // If "Stories" tab is tapped
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => StoryScreen(),
        ),
      );
    }
  }

  // Navigate to ChatScreen
  void _startChat(String sender) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ChatScreen(sender: sender),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const double profileIconSize = 40.0; // Custom size for profile icons

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: Container(
          margin: const EdgeInsets.only(left: 8.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey[800],
          ),
          child: IconButton(
            icon: const Icon(Icons.menu, color: Colors.white),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        title: const Text(
          "Chats",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 8.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey[800],
            ),
            child: IconButton(
              icon: const Icon(Icons.edit, color: Colors.white),
              onPressed: () {
                print('Pencil icon tapped');
              },
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.deepPurple,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: const Text('Profile'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Settings'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Log Out'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Centered search box and profile icons
            Center(
              child: Column(
                children: [
                  // Search Box
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: _searchController,
                      style: const TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        hintText: 'Search...',
                        hintStyle: const TextStyle(color: Colors.grey),
                        filled: true,
                        fillColor: Colors.grey[300],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide.none,
                        ),
                        prefixIcon: const Icon(Icons.search, color: Colors.grey),
                      ),
                    ),
                  ),
                  // Horizontal Profile Icons with custom messages
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: List.generate(5, (index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: GestureDetector(
                              onTap: () => _startChat(messages[index].sender),
                              child: Column(
                                children: [
                                  Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      // Profile icon
                                      Container(
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(color: Colors.black, width: 1.5),
                                        ),
                                        child: CircleAvatar(
                                          radius: profileIconSize / 0.9,
                                          backgroundImage: AssetImage(messages[index].imageUrl),
                                        ),
                                      ),
                                      // Mini text box
                                      Positioned(
                                        top: 0,
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.0),
                                          decoration: BoxDecoration(
                                            color: Colors.black.withOpacity(0.7),
                                            borderRadius: BorderRadius.circular(12.0),
                                          ),
                                          child: Text(
                                            customMessages[index % customMessages.length],
                                            style: const TextStyle(color: Colors.white, fontSize: 12),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    messages[index].sender,
                                    style: const TextStyle(fontSize: 14, color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Vertical Profile Icons List
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => _startChat(messages[index].sender), // Make the vertical icons clickable
                    child: Container(
                      color: Colors.transparent, // Set your desired background color here
                      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
                      child: Row(
                        children: [
                          Container(
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.black, width: 1.5),
                            ),
                            child: CircleAvatar(
                              radius: 30,
                              backgroundImage: AssetImage(messages[index].imageUrl),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  messages[index].sender,
                                  style: const TextStyle(fontSize: 18),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  messages[index].text,
                                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chats',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.note),
            label: 'Stories',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}

class Message {
  final String sender;
  final String text;
  final String imageUrl;

  Message({required this.sender, required this.text, required this.imageUrl});
}
