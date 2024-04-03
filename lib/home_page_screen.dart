import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Icon(Icons.menu, color: Colors.black),
        title: Text('Homepage', style: TextStyle(color: Colors.black)),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.black),
            onPressed: () {
              // TODO: Implement search functionality
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF57c1eb),
              Color(0xFF004e92),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView(
          children: [
            // Category section with horizontal scrolling
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  CategoryItem(iconData: Icons.person, title: 'Find Player'),
                  // Add more CategoryItems here...
                ],
              ),
            ),
            // Player profile card section
            PlayerProfileCard(
              // Add the relevant data and callbacks for your PlayerProfileCard here
            ),
            // More player profile cards...
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          // Add more items if necessary
        ],
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final IconData iconData;
  final String title;

  const CategoryItem({Key? key, required this.iconData, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.blueAccent, // Placeholder color
          child: Icon(iconData, size: 24, color: Colors.white),
        ),
        Text(title),
      ],
    );
  }
}

class PlayerProfileCard extends StatelessWidget {
  // You can pass the necessary data through the constructor
  // const PlayerProfileCard({Key? key, required this.playerData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              // Player profile image
              backgroundImage: AssetImage('path/to/player_image.jpg'), // Placeholder asset
            ),
            title: Text('Player Name'), // Replace with your player name data
            subtitle: Text('Online Now'),
            trailing: IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () {
                // TODO: Implement more options
              },
            ),
          ),
          Image.asset('path/to/player_background.jpg'), // Placeholder asset
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text('Join a gaming session and meet new players online.'),
          ),
          ButtonBar(
            children: [
              IconButton(
                icon: Icon(Icons.favorite_border),
                onPressed: () {
                  // TODO: Implement favorite functionality
                },
              ),
              IconButton(
                icon: Icon(Icons.chat_bubble_outline),
                onPressed: () {
                  // TODO: Implement chat functionality
                },
              ),
              TextButton(
                child: Text('More'),
                onPressed: () {
                  // TODO: Implement more functionality
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
