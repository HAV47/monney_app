import 'package:flutter/cupertino.dart';
import 'package:monneyapp/constants/helper/asset_helper.dart';
import 'package:monneyapp/constants/model/argument_transfer_model.dart';
import 'package:monneyapp/main_app.dart';
import 'package:monneyapp/screen/home/cards_screen.dart';
import 'package:monneyapp/screen/home/information_screen.dart';
import 'package:monneyapp/screen/login_register/login_screen.dart';
import 'package:monneyapp/screen/login_register/register_screen.dart';
import 'package:monneyapp/screen/login_register/welcome_screen.dart';
import 'package:monneyapp/screen/otp/otp_screen.dart';
import 'package:monneyapp/screen/otp/otp_verification.dart';
import 'package:monneyapp/screen/otp/profile_setup.dart';
import 'package:monneyapp/screen/tranfer/confirm_tranfer_screen.dart';
import 'package:monneyapp/screen/tranfer/transfer_screen.dart';
import 'package:monneyapp/screen/transactions/transaction_screen.dart';

// final Map<String, WidgetBuilder> routes = {
//   WelcomeScreen.routeName: (context) => const WelcomeScreen(),
//   LoginScreen.routeName: (context) =>  LoginScreen(),
//   RegisterScreen.routeName: (context) => const RegisterScreen(),
//   OtpScreen.routeName: (context) => const OtpScreen(),
//   OtpVerification.routeName: (context) => const OtpVerification(),
//   CompleteScreen.routeName: (context) => const CompleteScreen(),
//   TransactionScreen.routeName: (context) => const TransactionScreen(),
//   CardsScreen.routeName: (context) => const CardsScreen(),
//   MainApp.routeName: (context) => const MainApp(),
//   InformationScreen.routeName : (context) => const InformationScreen(),
//   TransferScreen.routeName : (context) => const TransferScreen(),
//   TransferScreen.routeName : (context) => const ConfirmTransferScreen(),
// };
class Routes {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case WelcomeScreen.routeName:
        return CupertinoPageRoute(
            settings: settings, builder: (_) => const WelcomeScreen());


        case LoginScreen.routeName:
        return CupertinoPageRoute(
            settings: settings, builder: (_) => LoginScreen());


        case RegisterScreen.routeName:
        return CupertinoPageRoute(
            settings: settings, builder: (_) => const RegisterScreen());


        case OtpScreen.routeName:
        return CupertinoPageRoute(
            settings: settings, builder: (_) => const OtpScreen());


        case OtpVerification.routeName:
        return CupertinoPageRoute(
            settings: settings, builder: (_) => const OtpVerification());


        case CompleteScreen.routeName:
        return CupertinoPageRoute(
            settings: settings, builder: (_) => const CompleteScreen());


        case TransactionScreen.routeName:
        return CupertinoPageRoute(
            settings: settings, builder: (_) => const TransactionScreen());


        case CardsScreen.routeName:
        return CupertinoPageRoute(
            settings: settings, builder: (_) => const CardsScreen());


        case MainApp.routeName:
        return CupertinoPageRoute(
            settings: settings, builder: (_) => const MainApp());


        case InformationScreen.routeName:
        return CupertinoPageRoute(
            settings: settings, builder: (_) => const InformationScreen());


        case TransferScreen.routeName:
        return CupertinoPageRoute(
            settings: settings, builder: (_) => const TransferScreen());


      case ConfirmTransferScreen.routeName:
        final args = settings.arguments as TransferArguments;
        return CupertinoPageRoute(
            settings: settings, builder: (_) => ConfirmTransferScreen(amount: args.amount, name: args.name,imagePath: args.imagePath,));
      default:
        return null;
    }
  }
}
