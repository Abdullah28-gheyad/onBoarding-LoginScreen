import 'package:advancedcourse/modules/login/cubit/cubit.dart';
import 'package:advancedcourse/modules/login/cubit/states.dart';
import 'package:advancedcourse/shared/components/button.dart';
import 'package:advancedcourse/shared/components/textbutton.dart';
import 'package:advancedcourse/shared/components/textformfield.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>() ;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>LoginCubit(),
      child: BlocConsumer<LoginCubit,LoginStates>(
        listener: (context,state){},
        builder: (context,state){
          var cubit = LoginCubit.get(context) ;
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
            ),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Center(
                            child: Image(
                                image: AssetImage('assets/images/splash_logo.png'))),
                        SizedBox(
                          height: 20,
                        ),
                        customTextFormField(
                          controller: emailController,
                          label: 'Email',
                          type: TextInputType.emailAddress,
                          validate: (value){
                            if (value.isEmpty)
                            {
                              print (value) ;
                              return 'email cannot be empty' ;
                            }
                            return null ;
                          },
                        ),
                        SizedBox(height: 10,) ,
                        customTextFormField(
                            controller: passwordController,
                            label: 'Password',
                            type: TextInputType.visiblePassword,
                            validate: (value){
                              if (value!.isEmpty)
                                return 'password cannot be empty' ;
                              return null ;
                            },
                            secure: true
                        ),
                        SizedBox(height: 20,) ,
                        ConditionalBuilder(
                          condition: state is! LoginLoadingState,
                          builder: (context)=>customButton(text: 'LOGIN', function: (){
                            if (formKey.currentState!.validate())
                            {
                              print ('hi world') ;
                              cubit.userLogin(email: emailController.text, password: passwordController.text) ;
                            }
                          }),
                          fallback: (context)=>Center(child: CircularProgressIndicator()),
                        ) ,
                        SizedBox(height: 20,),
                        Row(
                          children: [
                            customTextButton(text: 'Forget Password', onPress: (){}) ,
                            Spacer() ,
                            customTextButton(text: 'Not a member ? Sign up', onPress: (){}) ,
                          ],
                        ) ,
                        SizedBox(height: 20,)
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ) ;
    },
      ),
    );
  }
}
