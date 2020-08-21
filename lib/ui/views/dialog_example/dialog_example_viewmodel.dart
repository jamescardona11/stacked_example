import 'package:stacked/stacked.dart';
import 'package:stacked_example_app/app/locator.dart';
import 'package:stacked_services/stacked_services.dart';

class DialogExampleViewModel extends BaseViewModel {
  bool _confirmationResult;
  bool get confirmationResult => _confirmationResult;

  final _dialogService = locator<DialogService>();

  DialogResponse _dialogResponse;
  DialogResponse get customDialogResult => _dialogResponse;

  Future showBasicDialog() async {
    await _dialogService.showDialog(
      title: 'The Basic Dialog',
      description: 'This is the description for the dialog that shows up under the title',
      buttonTitle: 'This is the main button title',
      dialogPlatform: DialogPlatform.Material, // DialogPlatform.Material
    );
  }

  Future showConfirmationDialog() async {
    var response = await _dialogService.showConfirmationDialog(
      title: 'The Confirmation Dialog',
      description: 'Do you want to update Confirmation state in the UI?',
      confirmationTitle: 'Yes',
      dialogPlatform: DialogPlatform.Material,
      cancelTitle: 'No',
    );

    _confirmationResult = response?.confirmed;

    notifyListeners();
  }

  Future showCustomDialog() async {
    var response = await _dialogService.showCustomDialog(
      title: 'Please enter your password to confirm',
      mainButtonTitle: 'Submit',
      customData: DialogType.Form,
    );
    print('response data: ${response?.responseData}');
    _dialogResponse = response?.responseData;

    notifyListeners();
  }
}

enum DialogType { Basic, Form }
