import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:image_picker/image_picker.dart';
import 'package:mind/utils/audio/background_audio_utility.dart';
import 'package:mind/utils/constants/images.dart';
import 'package:mind/utils/constants/sizes.dart';
import 'package:mind/utils/local_storage/storage_utility.dart';
import 'package:path_provider/path_provider.dart';

class ProfileController extends GetxController {
  // variables
  final storage = ULocalStorage.instance();
  RxBool isLoading = true.obs;
  RxBool musicEnabled = false.obs; // Initial value
  RxBool updateRanking = true.obs;
  RxString userName = ''.obs;
  RxString userImage = ''.obs;
  RxInt userPoints = 0.obs;
  RxString userRanking = ''.obs;

  @override
  void onInit() async {
    await getUser();
    await getMusicControls();
    isLoading.value = false;
    super.onInit();
  }

  Future getUser() async {
    final List users = await storage.readData('users');
    final currentUser = users[0];
    final String username = currentUser['name'];
    final String imageUrl = currentUser['image'];
    final int points = currentUser['points'];
    final String ranking = currentUser['ranking'];

    // Set Values
    userName.value = username;
    userImage.value = imageUrl;
    userPoints.value = points;
    userRanking.value = ranking;
    return;
  }

  Future getMusicControls() async {
    musicEnabled.value = await storage.readData('users')[0]['musicEnabled'];
  }

  // User can control background music
  void musicEnableDisable(bool val) async {
    if (val) {
      BackgroundMusicController.enableMusic();
    } else {
      BackgroundMusicController.disableMusic();
    }

    musicEnabled.value = val;
  }

  void autoRankingUpdate(bool val) {
    if (val) {
    } else {}

    updateRanking.value = val;
  }

  // Change Image of user
  Future changeUserImage() async {
    // Pick the image file
    final pickedFile = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        imageQuality: 70,
        maxHeight: 512,
        maxWidth: 512);

    if (pickedFile == null) return; // User canceled the picker

    // Save it in the DocumentsDirectory
    final Directory appDocsDir = await getApplicationDocumentsDirectory();
    final String path = appDocsDir.path;

    File imageFile = File(pickedFile.path);
    final File localImage = await imageFile
        .copy('$path/profile_image_${Timestamp.now().toDate()}.png');

    // Modify the Local Storage to save the new path of the File
    final List users = await storage.readData('users');
    final currentUser = users[0];
    currentUser['image'] = localImage.path;
    await storage.saveData('users', users);

    // Change userImage variable
    userImage.value = localImage.path;
  }

  Future changeUserName(String name) async {
    // Modify the Local Storage to save the new path of the File
    final List users = await storage.readData('users');
    final currentUser = users[0];
    currentUser['name'] = name;
    await storage.saveData('users', users);

    userName.value = name;
  }

  // show the profile image
  void showEnlaredImage(String image) {
    Get.to(
        fullscreenDialog: true,
        () => Dialog.fullscreen(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: CSizes.defaultSpace * 2,
                        horizontal: CSizes.defaultSpace),
                    child: image.isEmpty
                        ? const Image(
                            image: AssetImage(CImages.defaultUserImage))
                        : Image(
                            image: FileImage(File(image)),
                          ),
                  ),
                  const SizedBox(
                    height: CSizes.spaceBtwSections,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      width: 150,
                      child: OutlinedButton(
                          onPressed: () => Get.back(),
                          child: const Text('Close')),
                    ),
                  )
                ],
              ),
            ));
  }
}
