import 'package:moneda_par_app_dev/constants/route_names.dart';
import 'package:moneda_par_app_dev/locator.dart';
import 'package:moneda_par_app_dev/services/authentication_service.dart';
import 'package:moneda_par_app_dev/services/navigation_service.dart';
import 'package:moneda_par_app_dev/viewmodels/base_model.dart';

class StartUpViewModel extends BaseModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  final NavigationService _navigationService = locator<NavigationService>();

  Future handleStartUpLogic() async {
    var hasLoggedInUser = await _authenticationService.isUserLoggedIn();

    if (hasLoggedInUser) {
      _navigationService.navigateTo(MainViewRoute);
    } else {
      _navigationService.navigateTo(LoginViewRoute);
    }
  }
}
