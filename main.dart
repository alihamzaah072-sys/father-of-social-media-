import 'package:flutter/material.dart';

void main() => runApp(const FatherSocialApp());

const brandPink = Color(0xFFFF2D75);
const brandPurple = Color(0xFF7547FF);
const brandBlue = Color(0xFF20B8E8);
const ink = Color(0xFF171326);

class FatherSocialApp extends StatelessWidget {
  const FatherSocialApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Father of Social Media',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: brandPurple),
        scaffoldBackgroundColor: const Color(0xFFF8F7FC),
        fontFamily: 'Roboto',
      ),
      home: const AppShell(),
    );
  }
}

class AppShell extends StatefulWidget {
  const AppShell({super.key});

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  int tab = 0;
  bool signedIn = false;

  final pages = const [
    HomePage(),
    ExplorePage(),
    CreatePage(),
    MessagesPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    if (!signedIn) {
      return LoginPage(onContinue: () => setState(() => signedIn = true));
    }
    return Scaffold(
      body: IndexedStack(index: tab, children: pages),
      bottomNavigationBar: NavigationBar(
        selectedIndex: tab,
        onDestinationSelected: (value) => setState(() => tab = value),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.explore_outlined), selectedIcon: Icon(Icons.explore), label: 'Explore'),
          NavigationDestination(icon: Icon(Icons.add_box_outlined), selectedIcon: Icon(Icons.add_box), label: 'Create'),
          NavigationDestination(icon: Icon(Icons.chat_bubble_outline), selectedIcon: Icon(Icons.chat_bubble), label: 'Chat'),
          NavigationDestination(icon: Icon(Icons.person_outline), selectedIcon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  final VoidCallback onContinue;
  const LoginPage({super.key, required this.onContinue});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final email = TextEditingController();
  final password = TextEditingController();

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [brandPink, brandPurple, brandBlue],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Card(
                elevation: 0,
                color: Colors.white.withOpacity(.96),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Icon(Icons.public, size: 58, color: brandPurple),
                      const SizedBox(height: 12),
                      const Text('FATHER', textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900, color: ink, letterSpacing: 2)),
                      const Text('OF SOCIAL MEDIA', textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 13, fontWeight: FontWeight.w800, color: brandPink, letterSpacing: 2)),
                      const SizedBox(height: 28),
                      const Text('Welcome back', style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 6),
                      const Text('Sign in to explore your community.'),
                      const SizedBox(height: 20),
                      TextField(controller: email, keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(labelText: 'Email address', prefixIcon: Icon(Icons.email_outlined), border: OutlineInputBorder())),
                      const SizedBox(height: 14),
                      TextField(controller: password, obscureText: true,
                        decoration: const InputDecoration(labelText: 'Password', prefixIcon: Icon(Icons.lock_outline), border: OutlineInputBorder())),
                      const SizedBox(height: 18),
                      FilledButton(
                        style: FilledButton.styleFrom(backgroundColor: brandPurple, padding: const EdgeInsets.symmetric(vertical: 16)),
                        onPressed: widget.onContinue,
                        child: const Text('Continue with demo account'),
                      ),
                      const SizedBox(height: 10),
                      const Text('Demo preview only — authentication is not connected yet.',
                        textAlign: TextAlign.center, style: TextStyle(fontSize: 11, color: Colors.black54)),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FATHER', style: TextStyle(fontWeight: FontWeight.w900, letterSpacing: 1.5)),
        actions: [
          IconButton(onPressed: () => _notice(context, 'Search is a demo feature.'), icon: const Icon(Icons.search)),
          IconButton(onPressed: () => _notice(context, 'Notifications will be added next.'), icon: const Icon(Icons.notifications_none)),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
        children: [
          const Text('Your world, your people.', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900)),
          const SizedBox(height: 4),
          const Text('Discover videos, stories and communities.', style: TextStyle(color: Colors.black54)),
          const SizedBox(height: 18),
          SizedBox(
            height: 94,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                StoryBubble(name: 'Your story', colors: [brandPink, brandPurple], add: true),
                StoryBubble(name: 'Ayesha', colors: [Color(0xFFFF9966), brandPink]),
                StoryBubble(name: 'Hamza', colors: [brandBlue, brandPurple]),
                StoryBubble(name: 'Zara', colors: [Color(0xFFFFC857), brandPink]),
                StoryBubble(name: 'Usman', colors: [brandPurple, brandBlue]),
              ],
            ),
          ),
          const SizedBox(height: 12),
          const PostCard(
            name: 'Ayesha Khan',
            handle: '@ayesha.creates',
            caption: 'A little color can make an ordinary day feel special ✨',
            tag: 'COMMUNITY',
            colors: [Color(0xFFFF8A65), Color(0xFFFF2D75), Color(0xFF7547FF)],
            likes: '2.4K',
          ),
          const PostCard(
            name: 'Hamza Ali',
            handle: '@hamza.vibes',
            caption: 'What are you creating this week? Share your ideas below.',
            tag: 'CREATOR TALK',
            colors: [Color(0xFF20B8E8), Color(0xFF4965E8), Color(0xFF7547FF)],
            likes: '856',
          ),
        ],
      ),
    );
  }
}

class StoryBubble extends StatelessWidget {
  final String name;
  final List<Color> colors;
  final bool add;
  const StoryBubble({super.key, required this.name, required this.colors, this.add = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 14),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(shape: BoxShape.circle, gradient: LinearGradient(colors: colors)),
            child: CircleAvatar(
              radius: 27,
              backgroundColor: Colors.white,
              child: add ? const Icon(Icons.add, color: brandPink) : Text(name.substring(0, 1), style: const TextStyle(fontWeight: FontWeight.bold, color: brandPurple)),
            ),
          ),
          const SizedBox(height: 5),
          Text(name, style: const TextStyle(fontSize: 11)),
        ],
      ),
    );
  }
}

class PostCard extends StatefulWidget {
  final String name, handle, caption, tag, likes;
  final List<Color> colors;
  const PostCard({super.key, required this.name, required this.handle, required this.caption, required this.tag, required this.colors, required this.likes});

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  bool liked = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      clipBehavior: Clip.antiAlias,
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: CircleAvatar(backgroundColor: brandPurple.withOpacity(.12), child: Text(widget.name[0], style: const TextStyle(color: brandPurple, fontWeight: FontWeight.bold))),
            title: Text(widget.name, style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text(widget.handle),
            trailing: IconButton(onPressed: () => _notice(context, 'More post options coming soon.'), icon: const Icon(Icons.more_horiz)),
          ),
          Container(
            height: 190,
            width: double.infinity,
            decoration: BoxDecoration(gradient: LinearGradient(colors: widget.colors, begin: Alignment.topLeft, end: Alignment.bottomRight)),
            child: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Icon(Icons.play_circle_fill, color: Colors.white, size: 58),
              const SizedBox(height: 8),
              Text(widget.tag, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w900, letterSpacing: 2)),
              const Text('CREATIVITY STARTS HERE', style: TextStyle(color: Colors.white70, fontSize: 10, letterSpacing: 1.5)),
            ])),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
            child: Text(widget.caption),
          ),
          Row(children: [
            IconButton(onPressed: () => setState(() => liked = !liked), icon: Icon(liked ? Icons.favorite : Icons.favorite_border, color: liked ? brandPink : null)),
            Text(liked ? 'Liked' : widget.likes),
            IconButton(onPressed: () => _notice(context, 'Comments screen will be added next.'), icon: const Icon(Icons.mode_comment_outlined)),
            const Text('Comments'),
            const Spacer(),
            IconButton(onPressed: () => _notice(context, 'Share feature will be connected next.'), icon: const Icon(Icons.share_outlined)),
          ]),
        ],
      ),
    );
  }
}

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});
  @override
  Widget build(BuildContext context) => const SimplePage(
    title: 'Explore',
    icon: Icons.explore,
    subtitle: 'Find creators, topics and communities.',
    items: ['Trending videos', 'Popular creators', 'Photography', 'Gaming', 'Learning'],
  );
}

class CreatePage extends StatelessWidget {
  const CreatePage({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Create')),
    body: Center(child: Padding(
      padding: const EdgeInsets.all(24),
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        const Icon(Icons.add_circle, size: 76, color: brandPink),
        const SizedBox(height: 12),
        const Text('Share something amazing', style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        const Text('Photo, video and post uploads will be connected in the next version.', textAlign: TextAlign.center),
        const SizedBox(height: 18),
        FilledButton.icon(onPressed: () => _notice(context, 'Upload is not connected in this demo.'), icon: const Icon(Icons.upload), label: const Text('Create a post')),
      ]),
    )),
  );
}

class MessagesPage extends StatelessWidget {
  const MessagesPage({super.key});
  @override
  Widget build(BuildContext context) => const SimplePage(
    title: 'Messages',
    icon: Icons.chat_bubble,
    subtitle: 'Your conversations will appear here.',
    items: ['Ayesha Khan  •  Hey, how are you?', 'Hamza Ali  •  Shared a video', 'Father Community  •  Welcome!'],
  );
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('My profile'), actions: [IconButton(onPressed: () => _notice(context, 'Settings will be added next.'), icon: const Icon(Icons.settings_outlined))]),
    body: ListView(padding: const EdgeInsets.all(20), children: [
      const CircleAvatar(radius: 42, backgroundColor: Color(0xFFEDE7FF), child: Icon(Icons.person, size: 48, color: brandPurple)),
      const SizedBox(height: 12),
      const Text('Your Name', textAlign: TextAlign.center, style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900)),
      const Text('@your.username', textAlign: TextAlign.center, style: TextStyle(color: Colors.black54)),
      const SizedBox(height: 20),
      Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: const [
        Stat(label: 'Posts', value: '0'),
        Stat(label: 'Followers', value: '0'),
        Stat(label: 'Following', value: '0'),
      ]),
      const SizedBox(height: 24),
      const Text('Creator dashboard', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
      const SizedBox(height: 10),
      const DashboardTile(icon: Icons.visibility_outlined, title: 'Post views', value: '0'),
      const DashboardTile(icon: Icons.favorite_outline, title: 'Total likes', value: '0'),
      const DashboardTile(icon: Icons.people_outline, title: 'Audience', value: '0'),
      const SizedBox(height: 12),
      const Text('Demo profile — connect an account to make this personal.', textAlign: TextAlign.center, style: TextStyle(color: Colors.black54, fontSize: 12)),
    ]),
  );
}

class Stat extends StatelessWidget {
  final String label, value;
  const Stat({super.key, required this.label, required this.value});
  @override
  Widget build(BuildContext context) => Column(children: [
    Text(value, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w900)),
    Text(label, style: const TextStyle(color: Colors.black54, fontSize: 12)),
  ]);
}

class DashboardTile extends StatelessWidget {
  final IconData icon;
  final String title, value;
  const DashboardTile({super.key, required this.icon, required this.title, required this.value});
  @override
  Widget build(BuildContext context) => Card(child: ListTile(leading: Icon(icon, color: brandPurple), title: Text(title), trailing: Text(value, style: const TextStyle(fontWeight: FontWeight.bold))));
}

class SimplePage extends StatelessWidget {
  final String title, subtitle;
  final IconData icon;
  final List<String> items;
  const SimplePage({super.key, required this.title, required this.icon, required this.subtitle, required this.items});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text(title)),
    body: ListView(padding: const EdgeInsets.all(20), children: [
      Icon(icon, size: 56, color: brandPurple),
      const SizedBox(height: 10),
      Text(subtitle, textAlign: TextAlign.center),
      const SizedBox(height: 20),
      ...items.map((item) => Card(child: ListTile(leading: const Icon(Icons.auto_awesome, color: brandPink), title: Text(item), onTap: () => _notice(context, 'This demo section will be expanded soon.')))),
    ]),
  );
}

void _notice(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
}
