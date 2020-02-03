import 'package:moneda_par_app_dev/constants/route_names.dart';
import 'package:moneda_par_app_dev/locator.dart';
import 'package:moneda_par_app_dev/models/post.dart';
import 'package:moneda_par_app_dev/models/user.dart';
import 'package:moneda_par_app_dev/services/dialog_service.dart';
import 'package:moneda_par_app_dev/services/firestore_service.dart';
import 'package:moneda_par_app_dev/services/navigation_service.dart';
import 'package:moneda_par_app_dev/viewmodels/base_model.dart';

class HomeViewModel extends BaseModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final FirestoreService _firestoreService = locator<FirestoreService>();
  final DialogService _dialogService = locator<DialogService>();

  List<Post> _posts;
  List<Post> get posts => _posts;
  User _user;
  User get users => _user;

  void listenToPosts() {
    setBusy(true);

    _firestoreService.listenToPostsRealTime().listen(
      (postsData) {
        List<Post> updatedPosts = postsData;
        if (updatedPosts != null && updatedPosts.length > 0) {
          _posts = updatedPosts;
          notifyListeners();
        }
      },
    );

    _firestoreService.listenToUserRealTime(currentUser).listen(
      (userData) {
        User updatedUser = userData;
        if (updatedUser != null) {
          _user = updatedUser;
          notifyListeners();
        }
      },
    );

    setBusy(false);
  }

  // void listenToUser() {
  //   setBusy(true);

  //   _firestoreService.listenToP

  //   ) {
  //     User updatedUser = userData;
  //     if (updatedUser != null) {
  //     _user = updatedUser;
  //     notifyListeners();
  //   };

  //   setBusy(false);

  // };}

  Future deletePost(int index) async {
    var dialogResponse = await _dialogService.showConfirmationDialog(
      title: 'Are you sure?',
      description: 'Do you really want to delete the post?',
      confirmationTitle: 'Yes',
      cancelTitle: 'No',
    );

    if (dialogResponse.confirmed) {
      setBusy(true);
      await _firestoreService.deletePost(_posts[index].documentId);
      setBusy(false);
    }
  }

  // Future navigateToCreateView2() async {
  //   await _navigationService.navigationKey;
  // }

  Future navigateToCreateView() async {
    await _navigationService.navigateTo(CreatePostViewRoute);
  }

  Future navigateToEditUser() async {
    _navigationService.navigateTo(UserInfoViewRoute);
  }

  void editPost(int index) {
    _navigationService.navigateTo(CreatePostViewRoute,
        arguments: _posts[index]);
  }
}
