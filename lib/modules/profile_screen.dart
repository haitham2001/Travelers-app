import 'package:flutter/material.dart';
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
                        margin: EdgeInsets.only(left: 63),
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
                        margin: EdgeInsets.only(left: 65),
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
                                    borderRadius: BorderRadius.circular(15)),
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
                          ),
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
          ],
        ),
      ),
    );
  }
}
