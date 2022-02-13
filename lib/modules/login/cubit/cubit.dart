
import 'package:advancedcourse/modules/login/cubit/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/network/dio_helper.dart';
import '../../../shared/network/endpoints.dart';

class LoginCubit extends Cubit <LoginStates>
{
  LoginCubit():super(LoginInitialState()) ;
  static LoginCubit get(context)=>BlocProvider.of(context) ;

  //LoginModel model  ;
  void userLogin(
  {
  required String email ,
  required String password ,
}
      )
  {
        emit(LoginLoadingState()) ;
        DioHelper.postData(path: LOGIN, data: {
          'email':email,
          'password':password,
        }).then((value) {
         // print (value.data['data']) ;
       // model =  LoginModel.fromJson(value.data);
        //print (model.data.token) ;
       // token = model.data.token ;
          //print (model.status) ;
          print ('login done') ;
          emit(LoginSuccessState(
            // model: model
          )) ;

        })
        .catchError((error){
          print (error.toString()) ;
          emit(LoginErrorState());
        });
  }


  bool isSecure = true ;
  void changePasswordSecure ()
  {
    isSecure = !isSecure ;
    emit(ChangePasswordSecureState()) ;
  }
}