import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:travellers/components/components.dart';
import 'package:travellers/constants/constants.dart';
import 'package:travellers/modules/cubit/cubit.dart';
import 'package:travellers/modules/cubit/states.dart';
import 'package:travellers/modules/cubit/theme_cubit.dart';
import 'package:travellers/modules/register_screen.dart';
import 'package:travellers/providers/pass_provider.dart';
import 'package:travellers/providers/theme_provider.dart';
import 'package:travellers/styles/colors.dart';
import 'package:travellers/user_data.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var FormKey = GlobalKey<FormState>();
    var emailController = TextEditingController();
    var passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Travellers',
        ),
        actions: [
          Consumer<ThemeProvider>(
            builder: (context, myProv, _) => IconButton(
              onPressed: () {
                myProv.changeAppMode();
              },
              icon: const Icon(Icons.brightness_4_outlined),
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(26.0),
                  child: Form(
                    key: FormKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'LOGIN',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        const SizedBox(
                          height: 7.0,
                        ),
                        const Text(
                          'Login Now To Book Your Ticket',
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(
                          height: 23.0,
                        ),
                        TextFormField(
                            controller: emailController,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(21),
                              labelText: 'Email Address',
                              labelStyle: Theme.of(context).textTheme.bodyText2,
                              prefixIcon: const Icon(
                                Icons.email_outlined,
                                color: defaultColor,
                              ),
                              border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15)),

                              suffix: CircleAvatar(
                                radius: 15,
                                backgroundColor: defaultColor,
                                child: GestureDetector(
                                  child: const Icon(
                                    Icons.clear,
                                    color: Colors.white,
                                  ),
                                  onTap: () {
                                    emailController.clear();
                                  },
                                ),
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Enter Your Email Address';
                              }
                              return null;
                            }),
                        const SizedBox(
                          height: 23.0,
                        ),
                        Consumer<PasswordProvider>(
                          builder: (context, myProvider, _) => TextFormField(
                              controller: passwordController,
                              obscureText: myProvider.isPass,
                              decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(21),
                                  labelText: 'Password',
                                  labelStyle:
                                      Theme.of(context).textTheme.bodyText2,
                                  prefixIcon: Icon(
                                    Icons.lock,
                                    color: defaultColor,
                                  ),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15)),
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      myProvider.ChangePassVisibility();
                                    },
                                    icon: Icon(
                                      myProvider.suffix,
                                    ),
                                    color: defaultColor,
                                  )),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Enter Your Password';
                                }
                                return null;
                              }),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        defaultBtn(
                          txt: 'LOGIN',
                          function: () {
                            bool success = false;
                            if (FormKey.currentState!.validate()) {
                              for (var data in data) {
                                if (data.Email == emailController.text &&
                                    data.Password == passwordController.text) {
                                  success = true;
                                }
                              }
                              if (success) {
                                Fluttertoast.showToast(msg: 'Login Success');
                              } else {
                                Fluttertoast.showToast(
                                    msg: 'Invalid Email or Password');
                              }
                            }
                          },
                          backgroundcolor: defaultColor,
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Don\'t have An Account ?',
                              style: TextStyle(
                                fontSize: 15.0,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    PageTransition(
                                        child: const RegisterScreen(),
                                        type: PageTransitionType.fade));
                              },
                              child: const Text(
                                'REGISTER',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 18.0,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
// for (var data in Data)
// {
// if (data.Email == emailController.text
// && data.Password == passwordController.text)
// {
// Fluttertoast.showToast(msg: 'Login Success');
// }
// else
// {
// Fluttertoast.showToast(msg: 'Error');
// break;
// }
// }
