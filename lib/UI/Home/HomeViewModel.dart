import 'package:heimdalladmin/Base/BaseViewModel.dart';
import 'package:heimdalladmin/UI/Home/HomeNavigator.dart';

class HomeViewModel extends BaseViewModel <HomeNavigator> {

  goToHardwareComponentsScreen(){
    navigator!.goToHardwareComponentsScreen();
  }

  goToLockModelScreen(){
    navigator!.goToLockModelScreen();
  }
  goToRegisterLockScreen(){
    navigator!.goToRegisterLockScreen();
  }
  goToLocksScreen(){
    navigator!.goToLocksScreen();
  }

}