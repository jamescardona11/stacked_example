import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_example_app/app/locator.dart';
import 'package:stacked_example_app/services/media_service.dart';

class ImagePickerViewModel extends BaseViewModel {
  String _title = 'ImagePicker View';
  String get title => _title;

  final _mediaService = locator<MediaService>();

  File _selectedImage;
  Future selectImage({@required bool fromGallery}) async {
    _selectedImage = await runBusyFuture(_mediaService.getImage(fromGallery: fromGallery));
  }
}
