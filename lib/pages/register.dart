import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:os/pages/mainpage.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text('Register',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 38)),
        centerTitle: true,
        backgroundColor: Colors.indigo,
      ),
      body: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(color: Colors.indigo),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildTextField(
                  _usernameController,
                  'Username',
                  Icons.person,
                  TextInputType.text,
                  false,
                ),
                const SizedBox(height: 16.0),
                buildTextField(
                  _emailController,
                  'Email',
                  Icons.email,
                  TextInputType.emailAddress,
                  false,
                ),
                const SizedBox(height: 16.0),
                buildTextField(
                  _phoneController,
                  'Phone',
                  Icons.phone,
                  TextInputType.phone,
                  false,
                ),
                const SizedBox(height: 16.0),
                buildTextField(
                  _nameController,
                  'Name',
                  Icons.person,
                  TextInputType.text,
                  false,
                ),
                const SizedBox(height: 16.0),
                buildPasswordField(
                  _passwordController,
                  'Password',
                  Icons.lock,
                  _obscurePassword,
                  () {
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  },
                ),
                const SizedBox(height: 16.0),
                buildPasswordField(
                  _confirmPasswordController,
                  'Confirm Password',
                  Icons.lock,
                  _obscureConfirmPassword,
                  () {
                    setState(() {
                      _obscureConfirmPassword = !_obscureConfirmPassword;
                    });
                  },
                ),
                const SizedBox(height: 32.0),
                ElevatedButton(
                  onPressed: () {
                    _handleRegistration();
                  },
                  child: const Text('Register'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextField(
    TextEditingController controller,
    String labelText,
    IconData icon,
    TextInputType keyboardType,
    bool obscureText,
  ) {
    return Container(
      width: 500,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          icon: Icon(icon, color: Colors.blueAccent),
          border: InputBorder.none,
        ),
        style: const TextStyle(color: Colors.blueAccent),
        keyboardType: keyboardType,
      ),
    );
  }

  Widget buildPasswordField(
    TextEditingController controller,
    String labelText,
    IconData icon,
    bool obscureText,
    VoidCallback onTap,
  ) {
    return Container(
      width: 500,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: labelText,
          icon: Icon(icon, color: Colors.blueAccent),
          border: InputBorder.none,
          suffixIcon: IconButton(
            icon: Icon(
              obscureText ? Icons.visibility : Icons.visibility_off,
              color: Colors.blueAccent,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MainPage()),
              );
            },
          ),
        ),
        style: const TextStyle(color: Colors.blueAccent),
      ),
    );
  }

  void _handleRegistration() {
    String username = _usernameController.text;
    String email = _emailController.text;
    String phone = _phoneController.text;
    String name = _nameController.text;
    String password = _passwordController.text;
    String confirmPassword = _confirmPasswordController.text;

    String errorMessage = _validateInputs(
        username, email, phone, name, password, confirmPassword);

    if (errorMessage.isEmpty) {
      // Add your registration logic here

      // For now, let's print the registration details
      if (kDebugMode) {
        print('Username: $username');
      }
      if (kDebugMode) {
        print('Email: $email');
      }
      if (kDebugMode) {
        print('Phone: $phone');
      }
      if (kDebugMode) {
        print('Name: $name');
      }
      if (kDebugMode) {
        print('Password: $password');
      }
    } else {
      _showErrorDialog(errorMessage);
    }
  }

  String _validateInputs(
    String username,
    String email,
    String phone,
    String name,
    String password,
    String confirmPassword,
  ) {
    String errorMessage = '';

    try {
      // Validate usernames, email, phone number, and name
      if (username.isEmpty || !RegExp(r'^[a-zA-Z0-9]*$').hasMatch(username)) {
        throw Exception('Invalid or empty username');
      }

      if (email.isEmpty || !email.contains('@')) {
        throw Exception('Invalid or empty email');
      }

      if (phone.isEmpty || !RegExp(r'^[0-9]+$').hasMatch(phone)) {
        throw Exception('Invalid or empty phone number');
      }

      if (name.isEmpty || !RegExp(r'^[a-zA-Z ]*$').hasMatch(name)) {
        throw Exception('Invalid or empty name');
      }

      // Validate passwords
      if (password.isEmpty || confirmPassword.isEmpty) {
        throw Exception('Passwords cannot be empty');
      }

      if (password != confirmPassword) {
        throw Exception('Passwords do not match');
      }
    } catch (e) {
      errorMessage = e.toString();
    }

    return errorMessage;
  }

  void _showErrorDialog(String errorMessage) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Registration Error'),
          content: Text(errorMessage),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
