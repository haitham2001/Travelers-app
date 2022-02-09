import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:travellers/components/components.dart';
import 'package:travellers/modules/cubit/cubit.dart';
import 'package:travellers/modules/cubit/states.dart';
import 'package:travellers/modules/cubit/theme_cubit.dart';
import 'package:travellers/styles/colors.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var FormKey = GlobalKey<FormState>();
    var cont = TextEditingController();
    return BlocProvider(

      create: (BuildContext context) => AppCubit(),
      child: BlocConsumer<AppCubit,AppStates>(
        listener: (context,state){},
        builder: (context,state) =>Scaffold(
          appBar: AppBar(

            title: Text(
              'Travellers',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            actions: [
              IconButton(
                onPressed: ()
                {
                  ThemeCubit.get(context).changexMode();
                },
                icon: Icon(Icons.brightness_4_outlined),
                color: Colors.white,)
            ],
          ),
          body: Center(
            child: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[
                    Text(
                      'Registeration',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(38.0),
                      child: Form(
                        key: FormKey,
                        child: Column(
                          children:
                          [
                            TextFormField(
                              decoration: InputDecoration(
                                labelText: 'UserName',
                                labelStyle: Theme.of(context).textTheme.bodyText2,
                                prefixIcon: Icon(
                                  Icons.person,
                                    color: defaultColor,
                                ),
                                border: OutlineInputBorder(),
                              ),
                              validator: (value)
                              {
                                if (value!.isEmpty)
                                  {
                                    return 'Enter Your Username';
                                  }
                                else if (value.length < 3)
                                  return 'Username at least 4 characters';
                              },

                            ),
                            SizedBox(height: 25,),
                            TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Email Address',
                                labelStyle: Theme.of(context).textTheme.bodyText2,
                                prefixIcon: Icon(Icons.email_outlined,
                                color: defaultColor,),
                                border: OutlineInputBorder(),
                              ),
                              validator: (String? value)
                              {
                                bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value!);
                                if (value!.isEmpty)
                                {
                                  return 'Enter Your Email Address';
                                }
                                else if (!emailValid)
                                {
                                  return 'Enter a Valid Email';
                                }
                              },

                            ),
                            SizedBox(height: 25,),
                            TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Date Of Birth',
                                labelStyle: Theme.of(context).textTheme.bodyText2,
                                border: OutlineInputBorder(),
                                prefixIcon: Icon(Icons.calendar_today,
                                  color: defaultColor,
                                ),
                              ),
                            validator: (value)
                            {
                            if (value!.isEmpty)
                              {
                                 return 'Enter Your Date Of Birth';
                              }
                              return null;
                            },
                              keyboardType: TextInputType.datetime,
                              controller: cont,
                              onTap: (){
                                showDatePicker(context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime.parse('1990-10-25'),
                                    lastDate: DateTime.parse('2022-10-25'),
                                ).then((value){
                                  cont.text = DateFormat.yMMMd().format(value!);
                                });
                              },
                              
                            ),
                            SizedBox(height: 25,),
                            TextFormField(
                              decoration: InputDecoration(
                                labelText: 'Password',
                                labelStyle: Theme.of(context).textTheme.bodyText2,
                                prefixIcon: Icon(Icons.lock,
                                color: defaultColor,),
                                border: OutlineInputBorder(),
                                suffixIcon: IconButton(onPressed: ()
                                {
                                  AppCubit.get(context).ChangePassVisibility();
                                },
                                    icon: Icon(AppCubit.get(context).suffix,),
                                color: defaultColor
                                  ,)
                                ),
                              obscureText: AppCubit.get(context).isPass,
                              validator: (value)
                              {
                                if (value!.isEmpty)
                                {
                                  return 'Enter Your Password';
                                }
                                else if (value.length < 5)
                                  return 'At Least Password Should be 6 characters';
                              },

                            ),
                            SizedBox(height: 25,),
                            defaultBtn(txt: 'Register',
                                function: ()
                                {
                                  if (FormKey.currentState!.validate())
                                    {}
                                },
                            backgroundcolor:defaultColor),
                          ],
                        ),
                      ),
                    ),
                  ]

              ),
            ),
          ),
        ),
      ),
    );
  }
}
