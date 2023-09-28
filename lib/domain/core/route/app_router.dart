import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:social_buzz/presentation/screens/auth/login/login_screen.dart';
import 'package:social_buzz/presentation/screens/auth/register/register_screen.dart';
import 'package:social_buzz/presentation/screens/intro/splash_screen.dart';
import 'package:social_buzz/presentation/screens/main/home/home_screen.dart';

abstract class Routing {
  String get initialPage;

  List<GetPage> get pages;
}

class RoutingImpl implements Routing {
  @override
  String get initialPage => RegisterScreen.id;

  @override
  List<GetPage> get pages => <GetPage>[
     GetPage(
          name: SplashScreen.id,
          page: () => const SplashScreen(),
        ),
        GetPage(
          name: RegisterScreen.id,
          page: () => RegisterScreen(),
        ),
        GetPage(
          name: LoginScreen.id,
          page: () => LoginScreen(),
        ),
        GetPage(
          name: HomeScreen.id,
          page: () => const HomeScreen(),
        ),
        
      ];
}



final routeProvider = Provider((ref) => RoutingImpl());