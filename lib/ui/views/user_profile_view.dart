import 'package:moneda_par_app_dev/models/post.dart';
import 'package:moneda_par_app_dev/models/user.dart';
import 'package:moneda_par_app_dev/ui/shared/ui_helpers.dart';
import 'package:moneda_par_app_dev/ui/widgets/post_item.dart';
import 'package:moneda_par_app_dev/viewmodels/home_view_model.dart';
import 'package:moneda_par_app_dev/viewmodels/update_user_info_model.dart';
import 'package:flutter/material.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:moneda_par_app_dev/services/navigation_service.dart';
import 'package:moneda_par_app_dev/ui/widgets/input_field.dart';

class UserProfileView extends StatelessWidget {
  final userNameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final userRoleController = TextEditingController();
  final adressController = TextEditingController();
  final nodesController = TextEditingController();
  final User edittingUser;

  UserProfileView({Key key, this.edittingUser}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<UpdateUserInfoModel>.withConsumer(
      viewModel: UpdateUserInfoModel(),
      onModelReady: (model) {
        // update the text in the controller
        userNameController.text = model.currentUser.userName;

        phoneNumberController.text = model.currentUser.phoneNumber;

        userRoleController.text = model.currentUser.userRole;

        adressController.text = model.currentUser.adress;

        nodesController.text = model.currentUser.nodes;

//        userRoleController.text = edittingUser?.userRole ?? '';

        model.setEdittingUser(edittingUser);
      },
      builder: (context, model, child) => Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: ListView(
            children: <Widget>[
              verticalSpace(50),
              InputField(
                placeholder: model.currentUser.userName,
                controller: userNameController,
                textInputType: TextInputType.text,
              ),
              InputField(
                placeholder: model.currentUser.email,
                textInputType: TextInputType.emailAddress,
                controller: null,
                isReadOnly: true,
              ),
              InputField(
                placeholder: model.currentUser.adress,
                controller: adressController,
              ),
              InputField(
                placeholder: model.currentUser.phoneNumber,
                controller: phoneNumberController,
                textInputType: TextInputType.number,
              ),
              InputField(
                placeholder: model.currentUser.nodes,
                controller: nodesController,
                // onChanged: (data) {
                //   if (!model.busy) {
                //     model.updateRoleUserInfo(
                //       userRole: data,
                //     );
                //   }
                // },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    child: Text('Guardar Cambios'),
                    onPressed: () {
                      if (!model.busy) {
                        model.updateUserInfo(
                          phoneNumber: phoneNumberController.text,
                          userRole: userRoleController.text,
                          email: model.currentUser.email,
                          adress: adressController.text,
                          userName: userNameController.text,
                          userImg: model.currentUser.userImg,
                          nodes: nodesController.text,
                        );
                      }
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    child: Text('Cerrar Sesion'),
                    onPressed: () {
                      if (!model.busy) {
                        model.signOut();
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
