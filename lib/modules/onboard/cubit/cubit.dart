import 'package:advancedcourse/models/onboard_model.dart';
import 'package:advancedcourse/modules/login/login_screen.dart';
import 'package:advancedcourse/modules/onboard/cubit/states.dart';
import 'package:advancedcourse/shared/components/navigator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnBoardingCubit extends Cubit<OnBoardingStates> {
  OnBoardingCubit() : super(OnBoardingInitialState());

  static OnBoardingCubit get(context) => BlocProvider.of(context);
  List<OnBoardModel> boardingList = [
    OnBoardModel(
        title: 'On Board 1 Title',
        subTitle: 'On Board 1 body',
        image: 'assets/images/onboarding_logo1.svg'),
    OnBoardModel(
        title: 'On Board 2 Title',
        subTitle: 'On Board 2 body',
        image: 'assets/images/onboarding_logo2.svg'),
    OnBoardModel(
        title: 'On Board 3 Title',
        subTitle: 'On Board 3 body',
        image: 'assets/images/onboarding_logo3.svg'),
    OnBoardModel(
        title: 'On Board 4 Title',
        subTitle: 'On Board 4 body',
        image: 'assets/images/onboarding_logo4.svg'),
  ];
  bool isLast = false;

  void onPageChanged(int index) {
    if (index == boardingList.length - 1) {
      isLast = true;
      emit(OnBoardingChangePageState());
    } else {
      isLast = false;
      emit(OnBoardingChangePageState());
    }
  }

  void changePageIndicator(PageController pageController,context) {
    if (isLast) {
       submit(context) ;
    }
    pageController.nextPage(
        duration: Duration(milliseconds: 750),
        curve: Curves.fastLinearToSlowEaseIn);
  }

  void submit(context) {
   navigateToAndReplacement(context, LoginScreen());
  }
}
