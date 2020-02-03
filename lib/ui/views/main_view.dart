import 'package:flutter/material.dart';
import 'package:moneda_par_app_dev/ui/views/create_post_view.dart';
import 'package:moneda_par_app_dev/ui/views/user_profile_view.dart';
import 'package:moneda_par_app_dev/viewmodels/main_view_model.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:moneda_par_app_dev/ui/views/home_view.dart';

/// Main view container that handles rendering pages according to which bottom
/// navigation bar item is tapped
///   - can be replaced with a [TabView]
class MainView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<MainViewModel>.withConsumer(
      viewModel: MainViewModel(),
      builder: (context, model, child) => Scaffold(
        body: IndexedStack(
          index: model.index,
          children: <Widget>[
            HomeView(),
            UserProfileView(),
            CreatePostView(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: model.index,
          onTap: model.changeTab,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.sync),
              icon: Icon(Icons.sync),
              title: Text(
                'Home',
              ),
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(Icons.tune),
              icon: Icon(Icons.tune),
              title: Text(
                'User',
              ),
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(
                Icons.publish,
              ),
              icon: Icon(Icons.publish),
              title: Text(
                'Post',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
