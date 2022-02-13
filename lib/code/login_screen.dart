
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:travellers/components/components.dart';
import 'package:travellers/modules/cubit/cubit.dart';
import 'package:travellers/modules/cubit/states.dart';
import 'package:travellers/modules/cubit/theme_cubit.dart';
import 'package:travellers/modules/register_screen.dart';
import 'package:travellers/providers/pass_provider.dart';
import 'package:travellers/providers/theme_provider.dart';
import 'package:travellers/styles/colors.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var FormKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Travellers',
        ),
        actions: [
          Consumer<ThemeProvider>(
            builder: (context,myProv,_)=>
              IconButton(
                onPressed: ()
                {
                  myProv.changeAppMode();
                },

                icon: Icon(Icons.brightness_4_outlined),
                color: Colors.white,),
          ),
            ],
      ),
      body: Center(
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
                      SizedBox(
                        height: 7.0,
                      ),
                      Text(
                        'Login Now To Book Your Ticket',
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(
                        height: 23.0,
                      ),
                      TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Email Address',
                            labelStyle: Theme.of(context).textTheme.bodyText2,
                            prefixIcon: Icon(Icons.email_outlined,
                            color: defaultColor,
                          ),
                            border: OutlineInputBorder(),
                          ),

                          validator: (value)
                          {
                            if (value!.isEmpty)
                            {
                              return 'Enter Your Email Address';
                            }
                            return null;
                          }
                      ),
                      SizedBox(
                        height: 23.0,
                      ),
                      Consumer<PasswordProvider>(
                        builder: (context,myProvider,_) =>
                            TextFormField(
                                obscureText: myProvider.isPass,
                                decoration: InputDecoration(
                                    labelText: 'Password',
                                    labelStyle: Theme.of(context).textTheme.bodyText2,
                                    prefixIcon: Icon(
                                      Icons.lock,
                                      color: defaultColor,
                                    ),

                                    border: OutlineInputBorder(),
                                    suffixIcon: IconButton(onPressed: ()
                                    {
                                      myProvider.ChangePassVisibility();
                                    },
                                      icon: Icon(myProvider.suffix,),
                                      color: defaultColor,)
                                ),
                                validator: (value)
                                {
                                  if (value!.isEmpty)
                                  {
                                    return 'Enter Your Password';
                                  }
                                  return null;
                                }
                            ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      defaultBtn(
                        txt: 'LOGIN',
                        function: () {
                          if (FormKey.currentState!.validate()) {
                          }
                        },
                        backgroundcolor: defaultColor,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Don\'t have An Account ?',
                            style: TextStyle(
                              fontSize: 15.0,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(context, PageTransition(child: RegisterScreen(),
                                  type:PageTransitionType.fade));
                            },
                            child: Text(
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
    );

  }
}
