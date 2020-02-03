import 'package:moneda_par_app_dev/constants/route_names.dart';
import 'package:moneda_par_app_dev/locator.dart';
import 'package:moneda_par_app_dev/models/user.dart';
import 'package:moneda_par_app_dev/services/dialog_service.dart';
import 'package:moneda_par_app_dev/services/firestore_service.dart';
import 'package:moneda_par_app_dev/services/navigation_service.dart';
import 'package:moneda_par_app_dev/viewmodels/base_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:moneda_par_app_dev/services/authentication_service.dart';

import 'package:flutter/foundation.dart';

class UpdateUserInfoModel extends BaseModel {
  final FirestoreService _firestoreService = locator<FirestoreService>();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final DialogService _dialogService = locator<DialogService>();
  final NavigationService _navigationService = locator<NavigationService>();

  User _edittingUser;

  bool get _editting => _edittingUser != null;

  Future updateUserInfo({
    String userName,
    String id,
    String email,
    String userRole,
    String adress,
    String mapLocation,
    String phoneNumber,
    String nodes,
    String userImg,
  }) async {
    setBusy(true);

    var result;

    result = await _firestoreService.updateUser(
      User(
          userName: userName,
          id: currentUser.id,
          email: email,
          userRole: userRole,
          adress: adress,
          mapLocation: mapLocation,
          phoneNumber: phoneNumber,
          nodes: nodes,
          userImg: userImg),
    );

    notifyListeners();
    setBusy(false);

    if (result is String) {
      await _dialogService.showDialog(
        title: 'Cound update user',
        description: result,
      );
    } else {
      await _dialogService.showDialog(
        title: 'User updated succesfully',
        description: 'Your user has been updated',
      );
    }

    //_navigationService.pop();
  }

  void setEdittingUser(User edittingUser) {
    _edittingUser = edittingUser;
  }

  Future signOut() async {
    _firebaseAuth.signOut();

    _navigationService.navigateTo(LoginViewRoute);
  }
}
