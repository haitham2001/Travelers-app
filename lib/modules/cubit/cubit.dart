import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travellers/modules/cubit/states.dart';

class AppCubit extends Cubit<AppStates>
{
  AppCubit() : super(AppInitialState());
  static AppCubit get(context) => BlocProvider.of(context);

  IconData suffix = Icons.visibility_outlined;
  bool isPass = true;

  void ChangePassVisibility ()
  {
    isPass = !isPass;
    suffix = isPass ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(ChangePassVisibilityState());
  }


}