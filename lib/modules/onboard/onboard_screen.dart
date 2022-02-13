import 'package:advancedcourse/models/onboard_model.dart';
import 'package:advancedcourse/modules/onboard/cubit/cubit.dart';
import 'package:advancedcourse/modules/onboard/cubit/states.dart';
import 'package:advancedcourse/shared/widgets/onboard_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatelessWidget {
  var pageController = PageController() ;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>OnBoardingCubit(),
      child: BlocConsumer<OnBoardingCubit,OnBoardingStates>(
        listener: (context,state){},
        builder: (context,state){
          var cubit = OnBoardingCubit.get(context) ;
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              actions: [
                TextButton(onPressed: (){
                    cubit.submit(context) ;
                }, child: Text(
                  'SKIP' , style: TextStyle(fontSize: 20 ,  color: Colors.orange,fontWeight:  FontWeight.bold),
                ))
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Expanded(
                    child: PageView.builder(
                      physics: BouncingScrollPhysics(),
                      onPageChanged: (int index){
                        cubit.onPageChanged(index) ;
                      },
                      itemBuilder: (context , index)=>buildBoardingItem(cubit.boardingList[index]),
                      itemCount: cubit.boardingList.length,
                      controller: pageController ,
                    ),
                  ) ,
                  Row(
                    children: [
                      SmoothPageIndicator(
                        controller: pageController,
                        count: cubit.boardingList.length,
                        effect: ExpandingDotsEffect(
                          activeDotColor: Colors.orange,
                          dotColor: Colors.grey ,
                          spacing: 10 ,
                          dotHeight: 20 ,
                          dotWidth: 20 ,
                          expansionFactor: 4 ,
                        ),
                      ),
                      Spacer(),
                      FloatingActionButton(
                        backgroundColor: Colors.orange,
                        onPressed: (){
                         cubit.changePageIndicator(pageController,context) ;
                        } , child: Icon(Icons.arrow_forward_ios),)
                    ],
                  )
                ],
              ),
            ),
          ) ;
        },
      ),
    );
  }



}
