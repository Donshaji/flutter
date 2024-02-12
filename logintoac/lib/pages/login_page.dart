import 'package:flutter/material.dart';
import 'package:logintoac/components/my_button.dart';
import 'package:logintoac/components/my_text_field.dart';
import 'package:logintoac/pages/register_page.dart';
import 'package:logintoac/services/auth/auth_services.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {

  // final void Function()? onTap;

  // const LoginPage({super.key, required this.onTap});
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  
  final emailController=TextEditingController();
  final passwordController=TextEditingController();

  // void signIn(){
  //   print("Test Working");
  // }

  void signIn() async{
    final authService = Provider.of<AuthService>(context,listen: false);
    try{
      await authService.SignInWithEmailandPassword(
        emailController.text,
        passwordController.text,
        );
    }catch(e){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString()),),);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 55),
          const Icon(
            Icons.message,
            size: 80,
          ),
          const SizedBox(height: 25),
          const Text("Welcome Back",
          style: TextStyle(
            fontSize: 16,
          ),
          ),
          const SizedBox(height: 25),
          MyTextField(
            controller: emailController,
            hintText: 'Email',
            obscureText: false,
            ),
            const SizedBox(height: 25),
            MyTextField(
            controller: passwordController,
            hintText: 'Password',
            obscureText: true,
            ),
            const SizedBox(height: 25),
            MyButton(onTap: signIn, text: "Sign In"),
            const SizedBox(height: 25),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
            

            children: [
              const Text("Not a Member?"),
              const SizedBox(width: 4),
              GestureDetector(
                onTap: (){
                  // Navigate to RegisterPage when tapped
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const RegisterPage()),
                        );
                },
                child: const Text(
                  "Register Now",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                ),
              ),
              ),
            ],
            ),
        ],
      ),
      ),
      ),
      ),
    );
  }
}