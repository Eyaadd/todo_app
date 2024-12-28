import 'package:flutter/material.dart';
import 'package:todo_app/screens/login_screen.dart';

class RegisterScreen extends StatelessWidget {
  static const routeName = "RegisterScreen";

  RegisterScreen({super.key});

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var rePasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register",style: Theme.of(context).textTheme.titleMedium,),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              "assets/images/Logo.png",
              height: 150,
            ),
            SizedBox(
              height: 24,
            ),
            TextField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: "Name",
                  labelStyle: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(color: Theme.of(context).focusColor),
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(context).focusColor, width: 2),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(context).focusColor, width: 2),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(context).focusColor, width: 2),
                    borderRadius: BorderRadius.circular(16),
                  ),
                )),
            SizedBox(
              height: 16,
            ),
            TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: "Email",
                  labelStyle: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(color: Theme.of(context).focusColor),
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(context).focusColor, width: 2),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(context).focusColor, width: 2),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(context).focusColor, width: 2),
                    borderRadius: BorderRadius.circular(16),
                  ),
                )),
            SizedBox(
              height: 16,
            ),
            TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Password",
                  labelStyle: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(color: Theme.of(context).focusColor),
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: Icon(Icons.remove_red_eye),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(context).focusColor, width: 2),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(context).focusColor, width: 2),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(context).focusColor, width: 2),
                    borderRadius: BorderRadius.circular(16),
                  ),
                )),
            SizedBox(
              height: 16,
            ),
            TextField(
                controller: rePasswordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Re Password",
                  labelStyle: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(color: Theme.of(context).focusColor),
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: Icon(Icons.remove_red_eye),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(context).focusColor, width: 2),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(context).focusColor, width: 2),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(context).focusColor, width: 2),
                    borderRadius: BorderRadius.circular(16),
                  ),
                )),
            SizedBox(
              height: 16,
            ),
            SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text("Create Account",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Colors.white)),
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(16),
                  backgroundColor: Theme.of(context).primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  )),
            ),
            SizedBox(
              height: 24,
            ),
            InkWell(
              onTap: (){
                Navigator.pushNamed(context, LoginScreen.routeName);
              },
              child: Text.rich(
                  textAlign: TextAlign.center,
                  TextSpan(
                    children: [
                      TextSpan(
                          text: "Already Have Account ? ",
                          style: Theme.of(context).textTheme.titleSmall),
                      TextSpan(
                        text: "Login",
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: Theme.of(context).primaryColor,
                            fontSize: 18,
                            decoration: TextDecoration.underline,
                            decorationColor: Theme.of(context).primaryColor),
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
