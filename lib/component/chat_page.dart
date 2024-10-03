import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  final String sender;

  ChatScreen({required this.sender});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  List<String> messages = []; // Store messages in a list

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        messages.add(_controller.text); // Add message to list
        _controller.clear(); // Clear the text field
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black, // Set AppBar background to black
        title: Text(
          "Chat with ${widget.sender}",
          style:
              const TextStyle(color: Colors.white), // Set text color to white
        ),
        iconTheme:
            const IconThemeData(color: Colors.white), // Set icon color to white
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return Align(
                  alignment:
                      Alignment.centerRight, // Align messages to the right
                  child: Container(
                    margin:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.indigoAccent[200], // Blue background
                      borderRadius:
                          BorderRadius.circular(15), // Rounded corners
                    ),
                    child: Text(
                      messages[index],
                      style: const TextStyle(color: Colors.white), // Text color
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            color: Colors.black, // Set the bottom container to black
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisSize: MainAxisSize.min, // Adjust row size to its children
              mainAxisAlignment:
                  MainAxisAlignment.start, // Align children to start
              children: [
                // Camera Icon
                IconButton(
                  icon: const Icon(Icons.camera_alt,
                      color: Colors.white), // Set icon color to white
                  onPressed: () {
                    // Implement camera functionality
                  },
                ),
                // Image Icon
                IconButton(
                  icon: const Icon(Icons.image,
                      color: Colors.white), // Set icon color to white
                  onPressed: () {
                    // Implement image picking functionality
                  },
                ),
                // Microphone Icon
                IconButton(
                  icon: const Icon(Icons.mic,
                      color: Colors.white), // Set icon color to white
                  onPressed: () {
                    // Implement microphone functionality
                  },
                ),
                // TextField for input with emoji icon
                Expanded(
                  child: Stack(
                    alignment: Alignment.centerRight,
                    children: [
                      TextField(
                        controller: _controller,
                        style: const TextStyle(
                            color: Colors.white), // Set text color to white
                        decoration: const InputDecoration(
                          hintText: 'Type a message',
                          hintStyle: TextStyle(
                              color: Colors.white), // Set hint text color to white
                          border: OutlineInputBorder(),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 10), // Adjust padding for emoji icon
                        ),
                      ),
                      // Emoji Icon
                      Positioned(
                        right: 3, // Positioning inside the TextField
                        child: IconButton(
                          icon: const Icon(Icons.emoji_emotions,
                              color: Colors.white), // Set icon color to white
                          onPressed: () {
                            // Implement emoji picker functionality
                          },
                          padding: EdgeInsets.zero, // Remove default padding
                          constraints:
                              const BoxConstraints(), // Remove constraints
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send,
                      color: Colors.white), // Set icon color to white
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
