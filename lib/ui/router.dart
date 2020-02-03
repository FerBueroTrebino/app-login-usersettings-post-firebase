import 'package:moneda_par_app_dev/models/post.dart';
import 'package:moneda_par_app_dev/ui/views/create_post_view.dart';
import 'package:moneda_par_app_dev/ui/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:moneda_par_app_dev/constants/route_names.dart';
import 'package:moneda_par_app_dev/ui/views/login_view.dart';
import 'package:moneda_par_app_dev/ui/views/main_view.dart';
import 'package:moneda_par_app_dev/ui/views/signup_view.dart';
import 'package:moneda_par_app_dev/ui/views/user_profile_view.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case LoginViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: LoginView(),
      );
    case SignUpViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: SignUpView(),
      );
    case MainViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: MainView(),
      );
    case HomeViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: HomeView(),
      );
    case UserInfoViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: UserProfileView(),
      );
    case CreatePostViewRoute:
      var postToEdit = settings.arguments as Post;
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: CreatePostView(
          edittingPost: postToEdit,
        ),
      );
    default:
      return MaterialPageRoute(
          builder: (_) => Scaffold(
                body: Center(
                    child: Text('No route defined for ${settings.name}')),
              ));
  }
}

PageRoute _getPageRoute({String routeName, Widget viewToShow}) {
  return MaterialPageRoute(
      settings: RouteSettings(
        name: routeName,
      ),
      builder: (_) => viewToShow);
}
