import 'package:flutter/material.dart';
import 'package:citygrow/app/services/auth_service.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final AuthService authService = AuthService();
  bool isLoading = false;
  bool _showPassword = false;
  String? emailError;
  String? passwordError;

  bool isValidEmail(String email) {
    final RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }

  bool isValidPassword(String password) {
    return password.length >= 6;
  }

  void validateEmail(String email) {
    setState(() {
      if (email.isEmpty) {
        emailError = 'Email is required';
      } else if (!isValidEmail(email)) {
        emailError = 'Please enter a valid email address';
      } else {
        emailError = null;
      }
    });
  }

  void validatePassword(String password) {
    setState(() {
      if (password.isEmpty) {
        passwordError = 'Password is required';
      } else if (!isValidPassword(password)) {
        passwordError = 'Password must be at least 6 characters long';
      } else {
        passwordError = null;
      }
    });
  }

  void register(BuildContext context) async {
    
    validateEmail(emailController.text);
    validatePassword(passwordController.text);
    
    if (emailError != null || passwordError != null) {
      return;
    }

    setState(() => isLoading = true);

    try {
      await authService.register(
        emailController.text.trim(),
        passwordController.text.trim(),
      );
      Navigator.pushReplacementNamed(context, '/profile');
    } catch (e) {
      String errorMessage = e.toString();
      // Add specific error handling for existing email
      if (errorMessage.contains('email-already-in-use')) {
        errorMessage = "An account already exists with this email. Please login instead.";
      }
      
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              Icon(Icons.error_outline, color: Colors.white),
              SizedBox(width: 10),
              Expanded(child: Text(errorMessage)),
            ],
          ),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
        ),
      );
    } finally {
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.green.shade50,
              Colors.white,
            ],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.local_florist,
                    size: 80,
                    color: Theme.of(context).primaryColor,
                  ),
                  SizedBox(height: 20),

                  Text(
                    "Create a CityGrow Account",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Start your urban farming journey today",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  SizedBox(height: 40),

                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      prefixIcon: Icon(Icons.email_outlined),
                      errorText: emailError,
                    ),
                    keyboardType: TextInputType.emailAddress,
                    onChanged: validateEmail,
                  ),
                  SizedBox(height: 20),

                  TextField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      prefixIcon: Icon(Icons.lock_outlined),
                      errorText: passwordError,
                      suffixIcon: IconButton(
                        icon: Icon(
                          _showPassword ? Icons.visibility_off : Icons.visibility,
                        ),
                        onPressed: () {
                          setState(() {
                            _showPassword = !_showPassword;
                          });
                        },
                      ),
                    ),
                    obscureText: !_showPassword,
                    onChanged: validatePassword,
                  ),
                  SizedBox(height: 30),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: isLoading ? null : () => register(context),
                      child: isLoading
                          ? SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: Colors.white,
                              ),
                            )
                          : Text(
                              "Register",
                              style: TextStyle(fontSize: 16),
                            ),
                    ),
                  ),
                  SizedBox(height: 20),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already have an account?"),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("Login"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}