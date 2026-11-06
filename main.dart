
import 'package:flutter/material.dart';

void main() {
  runApp(const FatherSocialApp());
}

class FatherSocialApp extends StatelessWidget {
  const FatherSocialApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Father of Social Media',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      home: const MainScreen(),
    );
  }
}

class Post {
  String name;
  String text;
  int likes;
  bool liked;

  Post({
    required this.name,
    required this.text,
    this.likes = 0,
    this.liked = false,
  });
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;

  final TextEditingController postController =
      TextEditingController();

  final List<Post> posts = [
    Post(
      name: 'Father of Social Media',
      text: 'Welcome to our new social media platform!',
      likes: 25,
    ),
    Post(
      name: 'Hamza',
      text: 'Hello everyone! Welcome to our community.',
      likes: 12,
    ),
  ];

  void addPost() {
    if (postController.text.trim().isEmpty) return;

    setState(() {
      posts.insert(
        0,
        Post(
          name: 'Hamza',
          text: postController.text.trim(),
        ),
      );
      postController.clear();
      selectedIndex = 0;
    });
  }

  Widget homePage() {
    return ListView(
      padding: const EdgeInsets.all(12),
      children: [
        const Text(
          'Welcome Home!',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 15),
        Card(
          child: ListTile(
            leading: const CircleAvatar(
              child: Icon(Icons.person),
            ),
            title: const Text('What is on your mind?'),
            trailing: IconButton(
              icon: const Icon(Icons.add_circle,
                  color: Colors.blue, size: 30),
              onPressed: () {
                setState(() => selectedIndex = 2);
              },
            ),
          ),
        ),
        const SizedBox(height: 12),
        for (int i = 0; i < posts.length; i++)
          Card(
            margin: const EdgeInsets.only(bottom: 14),
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        child: Icon(Icons.person),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          posts[i].name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const Icon(Icons.more_horiz),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Text(
                    posts[i].text,
                    style: const TextStyle(fontSize: 16),
                  ),
                  const Divider(height: 25),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            posts[i].liked = !posts[i].liked;
                            posts[i].likes +=
                                posts[i].liked ? 1 : -1;
                          });
                        },
                        icon: Icon(
                          posts[i].liked
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: posts[i].liked
                              ? Colors.red
                              : Colors.grey,
                        ),
                      ),
                      Text('${posts[i].likes} Likes'),
                      const Spacer(),
                      const Icon(Icons.comment_outlined),
                      const SizedBox(width: 6),
                      const Text('Comment'),
                    ],
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }

  Widget explorePage() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.explore, size: 75, color: Colors.blue),
          SizedBox(height: 15),
          Text(
            'Explore Community',
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Text('Discover new people and posts'),
        ],
      ),
    );
  }

  Widget createPage() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const Text(
            'Create New Post',
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          TextField(
            controller: postController,
            maxLines: 6,
            decoration: InputDecoration(
              hintText: 'Write something...',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
          const SizedBox(height: 15),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: addPost,
              icon: const Icon(Icons.send),
              label: const Text('Publish Post'),
            ),
          ),
        ],
      ),
    );
  }

  Widget messagesPage() {
    return ListView(
      children: const [
        ListTile(
          leading: CircleAvatar(child: Icon(Icons.person)),
          title: Text('Welcome'),
          subtitle: Text('Welcome to our community!'),
          trailing: Icon(Icons.chat),
        ),
        ListTile(
          leading: CircleAvatar(child: Icon(Icons.person)),
          title: Text('Support'),
          subtitle: Text('Your messages will appear here'),
          trailing: Icon(Icons.chat),
        ),
      ],
    );
  }

  Widget profilePage() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircleAvatar(
            radius: 48,
            child: Icon(Icons.person, size: 55),
          ),
          const SizedBox(height: 15),
          const Text(
            'Hamza',
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold),
          ),
          const Text('Father of Social Media Member'),
          const SizedBox(height: 20),
          Text('${posts.length} Posts'),
          const SizedBox(height: 20),
          OutlinedButton.icon(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Profile settings coming soon'),
                ),
              );
            },
            icon: const Icon(Icons.settings),
            label: const Text('Settings'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final pages = [
      homePage(),
      explorePage(),
      createPage(),
      messagesPage(),
      profilePage(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Father of Social Media',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: pages[selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: (index) {
          setState(() => selectedIndex = index);
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.explore),
            label: 'Explore',
          ),
          NavigationDestination(
            icon: Icon(Icons.add_box),
            label: 'Create',
          ),
          NavigationDestination(
            icon: Icon(Icons.message),
            label: 'Messages',
          ),
          NavigationDestination(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    postController.dispose();
    super.dispose();
  }
}
