import 'package:moneda_par_app_dev/models/post.dart';
import 'package:moneda_par_app_dev/ui/shared/ui_helpers.dart';
import 'package:moneda_par_app_dev/ui/widgets/post_item.dart';
import 'package:moneda_par_app_dev/viewmodels/home_view_model.dart';
import 'package:moneda_par_app_dev/viewmodels/update_user_info_model.dart';
import 'package:flutter/material.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:moneda_par_app_dev/services/navigation_service.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<HomeViewModel>.withConsumer(
      viewModel: HomeViewModel(),
      onModelReady: (model) => model.listenToPosts(),
      builder: (context, model, child) => Scaffold(
        backgroundColor: Colors.white,
        floatingActionButton: FloatingActionButton(
          heroTag: "btnHome",
          backgroundColor: Theme.of(context).primaryColor,
          child: !model.busy ? Icon(Icons.add) : CircularProgressIndicator(),
          onPressed: model.navigateToCreateView,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              verticalSpace(50),
              Row(
                children: <Widget>[
                  SizedBox(
                    height: 20,
                    child: Text('Bienvenido ' +
                        model.currentUser.userName.toUpperCase()),
                  ),
                ],
              ),
              Expanded(
                child: model.posts != null
                    ? ListView.builder(
                        itemCount: model.posts.length,
                        itemBuilder: (context, index) => GestureDetector(
                          onTap: () => model.editPost(index),
                          child: PostItem(
                            post: model.posts[index],
                            onDeleteItem: () => model.deletePost(index),
                          ),
                        ),
                      )
                    : Center(
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation(
                              Theme.of(context).primaryColor),
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
