import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:travellers/components/components.dart';
import 'package:travellers/constants/constants.dart';
import 'package:travellers/modules/cubit/cubit.dart';
import 'package:travellers/modules/cubit/states.dart';
import 'package:travellers/modules/cubit/theme_cubit.dart';
import 'package:travellers/modules/login_screen.dart';
import 'package:travellers/providers/pass_provider.dart';
import 'package:travellers/registerdatabase/register_data_base.dart';
import 'package:travellers/styles/colors.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var FormKey = GlobalKey<FormState>();
    var usernameController = TextEditingController();
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var dateController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Travellers',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              // ThemeCubit.get(context).changexMode();
            },
            icon: const Icon(Icons.brightness_4_outlined),
            color: Colors.white,
          )
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
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                'Registeration',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              Padding(
                padding: const EdgeInsets.all(38.0),
                child: Form(
                  key: FormKey,
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(18),
                          labelText: 'UserName',
                          labelStyle: Theme.of(context).textTheme.bodyText2,
                          prefixIcon: const Icon(
                            Icons.person,
                            color: defaultColor,
                          ),
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
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15)),
                        ),
                        controller: usernameController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter Your Username';
                          } else if (value.length < 3) {
                            return 'Username at least 4 characters';
                          }
                        },
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(18),
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
                        controller: emailController,
                        validator: (String? value) {
                          bool emailValid = RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.com")
                              .hasMatch(value!);

                          if (value.isEmpty) {
                            return 'Enter Your Email Address';
                          } else if (!emailValid) {
                            return 'Enter a Valid Email';
                          }
                        },
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(20),
                          labelText: 'Date Of Birth',
                          labelStyle: Theme.of(context).textTheme.bodyText2,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15)),
                          prefixIcon: Icon(
                            Icons.calendar_today,
                            color: defaultColor,
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter Your Date Of Birth';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.datetime,
                        controller: dateController,
                        onTap: () {
                          showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.parse('1990-10-25'),
                            lastDate: DateTime.parse('2022-10-25'),
                          ).then((value) {
                            dateController.text =
                                DateFormat.yMMMd().format(value!);
                          });
                        },
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Consumer<PasswordProvider>(
                        builder: (context, myProvider, _) => TextFormField(
                            obscureText: myProvider.isPass,
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.all(20),
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
                            controller: passwordController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Enter Your Password';
                              } else if (value.length < 3)
                                return 'Password at least 4 characters';

                              return null;
                            }),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      defaultBtn(
                          txt: 'Register',
                          function: () async {
                            bool found = false;
                            if (FormKey.currentState!.validate()) {
                              data.forEach((element) {
                                if (element.Email == emailController.text) {
                                  found = true;
                                }
                              });

                              if (!found) {
                                await RegDataBase.insertToDatabase(
                                  username: usernameController.text,
                                  password: passwordController.text,
                                  email: emailController.text,
                                  date: dateController.text,
                                );
                                RegDataBase.getData(RegDataBase.database);
                                Fluttertoast.showToast(
                                    msg: 'Registration Successfully');
                                NavigateAndFinish(context, const LoginScreen());
                              } else {
                                Fluttertoast.showToast(
                                    msg: 'This Email is already Exists');
                              }
                            }
                          },
                          backgroundcolor: defaultColor),
                    ],
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
