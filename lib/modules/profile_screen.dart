import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:travellers/components/components.dart';
import 'package:travellers/constants/constants.dart';
import 'package:travellers/providers/pass_provider.dart';
import 'package:travellers/providers/theme_provider.dart';
import 'package:travellers/registerdatabase/register_data_base.dart';
import 'package:travellers/styles/colors.dart';
import 'package:travellers/user_data.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var FormKey = GlobalKey<FormState>();
    var usernameController =
        TextEditingController(text: UserData.LoggedUser.userName);
    var emailController =
        TextEditingController(text: UserData.LoggedUser.Email);
    var passwordController =
        TextEditingController(text: UserData.LoggedUser.Password);
    var dateController =
        TextEditingController(text: UserData.LoggedUser.DateOfBirth);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
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
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 50),
              child: const Center(
                child: CircleAvatar(
                  radius: 80,
                  backgroundColor: defaultColor,
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 135,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.circular(35),
                boxShadow: const [
                  BoxShadow(color: Colors.transparent, spreadRadius: 4),
                ],
              ),
              padding: const EdgeInsets.only(
                top: 25,
                left: 15,
              ),
              child: Form(
                key: FormKey,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Username:',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 20),
                          width: 230,
                          height: 65,
                          child: TextFormField(
                            controller: usernameController,
                            decoration: InputDecoration(
                              labelStyle: Theme.of(context).textTheme.bodyText2,
                              prefixIcon: const Icon(
                                Icons.person,
                                color: defaultColor,
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15)),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Enter Your Username';
                              } else if (value.length < 4) {
                                return 'Username at least 4 characters';
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      children: [
                        Text(
                          'Email:',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 66),
                          width: 230,
                          height: 65,
                          child: TextFormField(
                            controller: emailController,
                            decoration: InputDecoration(
                              labelStyle: Theme.of(context).textTheme.bodyText2,
                              prefixIcon: const Icon(
                                Icons.email,
                                color: defaultColor,
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15)),
                            ),
                            validator: (String? value) {
                              bool emailValid = RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@(gmail|hotmail|outlook)+\.com")
                                  .hasMatch(value!);

                              if (value.isEmpty) {
                                return 'Enter Your Email Address';
                              } else if (!emailValid) {
                                return 'Enter a Valid Email';
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      children: [
                        Text(
                          'Date:',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 75),
                          width: 230,
                          height: 65,
                          child: TextFormField(
                            controller: dateController,
                            decoration: InputDecoration(
                              labelStyle: Theme.of(context).textTheme.bodyText2,
                              prefixIcon: const Icon(
                                Icons.calendar_today,
                                color: defaultColor,
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15)),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Enter Your Date Of Birth';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      children: [
                        Text(
                          'Password:',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        Consumer<PasswordProvider>(
                          builder: (context, myProvider, _) => Container(
                            margin: const EdgeInsets.only(left: 24),
                            width: 230,
                            height: 65,
                            child: TextFormField(
                                controller: passwordController,
                                obscureText: myProvider.isPass,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    labelStyle:
                                        Theme.of(context).textTheme.bodyText2,
                                    prefixIcon: const Icon(
                                      Icons.lock,
                                      color: defaultColor,
                                    ),
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
                                  } else if (value.length < 8) {
                                    return 'Password at least 8 characters';
                                  }

                                  return null;
                                }),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      child: CircleAvatar(
                        radius: 43,
                        backgroundColor: defaultColor,
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            if (FormKey.currentState!.validate()) {
                              if (usernameController.text != "" &&
                                  emailController.text != "" &&
                                  passwordController.text != "" &&
                                  dateController.text != "") {
                                RegDataBase.updateDatabase(
                                    usernameController.text,
                                    emailController.text,
                                    dateController.text,
                                    passwordController.text,
                                    UserData.LoggedUser.id);
                                Fluttertoast.showToast(
                                    msg: 'User Updated successfully');
                                UserData.LoggedUser = UserData(
                                    id: UserData.LoggedUser.id,
                                    userName: usernameController.text,
                                    Email: emailController.text,
                                    Password: passwordController.text,
                                    DateOfBirth: dateController.text);
                                RegDataBase.getData(RegDataBase.database);
                              }
                            } else {
                              Fluttertoast.showToast(
                                  msg: 'please compleate all data');
                              RegDataBase.getData(RegDataBase.database);
                            }
                            // Update DB ..
                          },
                          icon: const Icon(
                            Icons.edit,
                            color: Colors.white,
                            size: 50,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
