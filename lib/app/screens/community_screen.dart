import 'package:flutter/material.dart';

class Post {
  final String username;
  final String content;
  int likes;
  final List<String> comments;
  bool isLiked;
  final String timeAgo;
  final String? imageUrl;

  Post({
    required this.username,
    required this.content,
    required this.likes,
    required this.comments,
    this.isLiked = false,
    required this.timeAgo,
    this.imageUrl,
  });
}

class CommunityScreen extends StatefulWidget {
  const CommunityScreen({super.key});

  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  final List<Post> _posts = [
    Post(
      username: 'GardenGuru',
      content: 'Just harvested my first batch of homegrown tomatoes! The taste is incredible compared to store-bought. Swipe to see my setup! 🍅 #UrbanGardening #GrowYourOwn',
      likes: 24,
      comments: [
        'Amazing harvest! How long did they take to grow?',
        'Those look delicious! What variety are they?'
      ],
      timeAgo: '2h ago',
      imageUrl: null,
    ),
    Post(
      username: 'UrbanFarmer',
      content: 'Need advice! My basil plants are showing yellow leaves. Anyone experienced with herb growing who can help? Trying to maintain an indoor herb garden but struggling with light conditions. 🌿',
      likes: 15,
      comments: [
        'Try moving them closer to a south-facing window!',
        'Yellow leaves usually mean overwatering. Let the soil dry between waterings.'
      ],
      timeAgo: '4h ago',
      imageUrl: null,
    ),
    Post(
      username: 'GreenThumb',
      content: 'My balcony transformation is complete! From concrete jungle to urban oasis in 3 months. Still cant believe how much you can grow in such a small space! 🌺🥬',
      likes: 42,
      comments: [
        'This is incredible! Would love to know your container setup',
        'Such an inspiration! What plants did you start with?'
      ],
      timeAgo: '1d ago',
      imageUrl: null,
    ),
  ];

  void _showCreatePostDialog() {
    final TextEditingController _contentController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Create Post'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _contentController,
              maxLines: 4,
              decoration: const InputDecoration(
                hintText: 'Share your gardening journey...',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () {
              
              },
              icon: const Icon(Icons.photo_library),
              label: const Text('Add Photo'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              if (_contentController.text.isNotEmpty) {
                setState(() {
                  _posts.insert(
                    0,
                    Post(
                      username: 'Me',
                      content: _contentController.text,
                      likes: 0,
                      comments: [],
                      timeAgo: 'Just now',
                    ),
                  );
                });
                Navigator.pop(context);
              }
            },
            child: const Text('Post'),
          ),
        ],
      ),
    );
  }

  void _showCommentsSheet(Post post) {
    final TextEditingController _commentController = TextEditingController();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Comments',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Flexible(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: post.comments.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(post.comments[index]),
                    );
                  },
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _commentController,
                      decoration: const InputDecoration(
                        hintText: 'Add a comment...',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      if (_commentController.text.isNotEmpty) {
                        setState(() {
                          post.comments.add(_commentController.text);
                        });
                        _commentController.clear();
                        Navigator.pop(context);
                      }
                    },
                    icon: const Icon(Icons.send),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Community'),
        backgroundColor: Colors.green.shade50,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: _posts.length,
        itemBuilder: (context, index) {
          final post = _posts[index];
          return _buildCommunityPost(post);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showCreatePostDialog,
        backgroundColor: Colors.green.shade600,
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildCommunityPost(Post post) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.green.shade100,
                  child: Text(post.username[0]),
                ),
                const SizedBox(width: 8.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        post.username,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        post.timeAgo,
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12.0),
            Text(post.content),
            const SizedBox(height: 12.0),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      if (post.isLiked) {
                        post.likes--;
                      } else {
                        post.likes++;
                      }
                      post.isLiked = !post.isLiked;
                    });
                  },
                  child: Icon(
                    post.isLiked ? Icons.favorite : Icons.favorite_border,
                    color: post.isLiked ? Colors.red : Colors.green.shade300,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 4.0),
                Text('${post.likes}'),
                const SizedBox(width: 16.0),
                InkWell(
                  onTap: () => _showCommentsSheet(post),
                  child: Icon(Icons.comment, color: Colors.green.shade300, size: 20),
                ),
                const SizedBox(width: 4.0),
                Text('${post.comments.length}'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}