import 'package:flutter/material.dart';

class ProfileSetupScreen extends StatefulWidget {
  const ProfileSetupScreen({super.key});

  @override
  _ProfileSetupScreenState createState() => _ProfileSetupScreenState();
}

class _ProfileSetupScreenState extends State<ProfileSetupScreen> {
  static const double _padding = 24.0;
  static const double _spacing = 20.0;
  static const double _borderRadius = 16.0;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _bioController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  void _completeProfileSetup() {
    
    if (_nameController.text.isEmpty || 
        _bioController.text.isEmpty || 
        _emailController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please fill in all fields'),
          backgroundColor: Colors.red.shade600,
        ),
      );
      return;
    }

    
    Navigator.of(context).pushReplacementNamed('/main');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: _padding,
            vertical: _padding * 2,
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.green.shade50,
                Colors.green.shade100,
              ],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Setup Your Profile',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: Colors.green.shade900,
                      fontWeight: FontWeight.bold,
                    ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: _spacing),
              Text(
                'Help us personalize your urban gardening experience',
                style: TextStyle(
                  color: Colors.grey.shade700,
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: _spacing * 2),
              _buildProfileAvatar(),
              const SizedBox(height: _spacing * 1.5),
              _buildProfileForm(),
              const SizedBox(height: _spacing * 2),
              _buildCompleteButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileAvatar() {
    return Center(
      child: Stack(
        children: [
          CircleAvatar(
            radius: 60,
            backgroundColor: Colors.green.shade100,
            child: const Icon(
              Icons.person, 
              size: 60, 
              color: Colors.green,
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.green.shade600,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: const Icon(
                  Icons.camera_alt, 
                  color: Colors.white,
                ),
                onPressed: () {
                  
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileForm() {
    return Container(
      padding: const EdgeInsets.all(_padding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(_borderRadius),
        boxShadow: [
          BoxShadow(
            color: Colors.green.shade100,
            spreadRadius: 1,
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        children: [
          TextField(
            controller: _nameController,
            decoration: InputDecoration(
              labelText: 'Full Name',
              prefixIcon: Icon(Icons.person, color: Colors.green.shade600),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(_borderRadius / 2),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.green.shade600, width: 2),
                borderRadius: BorderRadius.circular(_borderRadius / 2),
              ),
            ),
          ),
          const SizedBox(height: _spacing),
          TextField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: 'Email Address',
              prefixIcon: Icon(Icons.email, color: Colors.green.shade600),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(_borderRadius / 2),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.green.shade600, width: 2),
                borderRadius: BorderRadius.circular(_borderRadius / 2),
              ),
            ),
          ),
          const SizedBox(height: _spacing),
          TextField(
            controller: _bioController,
            maxLines: 3,
            decoration: InputDecoration(
              labelText: 'Bio',
              hintText: 'Tell us about your gardening journey',
              prefixIcon: Icon(Icons.eco, color: Colors.green.shade600),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(_borderRadius / 2),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.green.shade600, width: 2),
                borderRadius: BorderRadius.circular(_borderRadius / 2),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCompleteButton() {
    return ElevatedButton(
      onPressed: _completeProfileSetup,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green.shade600,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(
          horizontal: _padding * 2,
          vertical: _padding / 2,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_borderRadius),
        ),
        elevation: 0,
      ),
      child: const Text(
        'Complete Profile',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }
}