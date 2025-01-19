import 'package:flutter/material.dart';
import 'package:citygrow/app/services/auth_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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

  void login() async {
    
    validateEmail(emailController.text);
    validatePassword(passwordController.text);
    
    if (emailError != null || passwordError != null) {
      return;
    }

    setState(() => isLoading = true);

    try {
      await authService.signIn(
        emailController.text.trim(),
        passwordController.text.trim(),
      );
      Navigator.pushReplacementNamed(context, '/main');
    } catch (e) {
      String errorMessage = e.toString();
      if (errorMessage.contains('user-not-found') || errorMessage.contains('no user record')) {
        errorMessage = "No account found with this email. Please register first.";
      } else if (errorMessage.contains('wrong-password')) {
        errorMessage = "Incorrect password. Please try again.";
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
                    "Welcome to CityGrow",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Grow your own food, right in the city",
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
                  SizedBox(height: 12),

                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                      },
                      child: Text("Forgot Password?"),
                    ),
                  ),
                  SizedBox(height: 20),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: isLoading ? null : login,
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
                              "Login",
                              style: TextStyle(fontSize: 16),
                            ),
                    ),
                  ),
                  SizedBox(height: 20),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account?"),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/register');
                        },
                        child: Text("Register"),
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