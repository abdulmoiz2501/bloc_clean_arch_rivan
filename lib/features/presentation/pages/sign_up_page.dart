import 'package:bloc_cleanarch/core/theme/app_palette.dart';
import 'package:bloc_cleanarch/features/presentation/pages/login_page.dart';
import 'package:bloc_cleanarch/features/presentation/widgets/auth_field.dart';
import 'package:bloc_cleanarch/features/presentation/widgets/auth_gradient_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();

@override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    super.dispose();
  }


  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const LoginPage(),
              ),
            );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Sign Up",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 30),
          
              AuthField(hintText: "Name", controller: nameController),
              SizedBox(height: 15),
              AuthField(hintText: "Email", controller: emailController),
              SizedBox(height: 15),
              AuthField(hintText: "Password",   controller: passwordController, isObscureText: true),
              SizedBox(height: 15),
              AuthGradientButton(buttonText: "Sign Up"),
              SizedBox(height: 20),
              RichText(
                text: TextSpan(
                  text: "Already have an account? ",
                  style: Theme.of(context).textTheme.titleMedium,
                  children: [
                    TextSpan(
                      text: "Sign In",
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: AppPallete.gradient2,
                        fontWeight: FontWeight.bold,
                      ),
                      recognizer:
                          TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const LoginPage(),
                                ),
                              );
                            },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
