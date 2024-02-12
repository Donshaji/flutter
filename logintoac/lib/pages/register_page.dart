import 'package:flutter/material.dart';
import 'package:logintoac/components/my_button.dart';
import 'package:logintoac/components/my_text_field.dart';
import 'package:logintoac/pages/login_page.dart';
import 'package:logintoac/services/auth/auth_services.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  // final void Function()? onTap;

  // const RegisterPage({super.key, required this.onTap});
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  
  final emailController=TextEditingController();
  final ConfirmPasswordController=TextEditingController();
  final passwordController=TextEditingController();

  void signUp()async{
    if(passwordController.text!=ConfirmPasswordController.text){
      ScaffoldMessenger.of(context)
      .showSnackBar(const SnackBar(content: Text("password don't match"),
      ),
      );
      return ;
    }
    final authService=Provider.of<AuthService>(context,listen: false);
    try{
      await authService.signInWithEmailAndPassword(
        emailController.text,
        passwordController.text,);
    }catch (e){
      ScaffoldMessenger.of(context)
      .showSnackBar(SnackBar(content: Text(e.toString()),
      ),
      );
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
          const SizedBox(height: 35),
          const Icon(
            Icons.message,
            size: 80,
          ),
          const SizedBox(height: 15),
          const Text("Create New Account",
          style: TextStyle(
            fontSize: 16,
          ),
          ),
          const SizedBox(height: 15),
          MyTextField(
            controller: emailController,
            hintText: 'Email',
            obscureText: false,
            ),
            const SizedBox(height: 15),
            MyTextField(
            controller: passwordController,
            hintText: 'New Password',
            obscureText: true,
            ),
            const SizedBox(height: 15),
            MyTextField(
            controller: ConfirmPasswordController,
            hintText: 'Re-Type Password',
            obscureText: true,
            ),
            const SizedBox(height: 15),
            MyButton(onTap: signUp, text: "Sign up"),
            const SizedBox(height: 15),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
            

            children: [
              const Text("Already Have Account?"),
              const SizedBox(width: 4,),
              GestureDetector(
                onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                },
                child: const Text(
                  "Login",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
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