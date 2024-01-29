import 'dart:io';
import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:randomstring_dart/randomstring_dart.dart';

// dependency injection
FirebaseImagesDatabase injectFirebaseImagesDatabase(){
  return FirebaseImagesDatabase.getInstance();
}

// the object
class FirebaseImagesDatabase {

  FirebaseImagesDatabase._();
  static FirebaseImagesDatabase? instance;
  static getInstance(){
    return instance ??= FirebaseImagesDatabase._();
  }

  final _firebaseStorage = FirebaseStorage.instance;

  // upload image to firebase storage
  Future<String> uploadImage({required Uint8List  file})async{

    // upload image to firebase storage
    var snapshot = await _firebaseStorage.ref().child('components/${generateName()}').putData(file,  SettableMetadata(contentType: "image/jpeg"));
    // get the image URL from firebase storage
    var downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }


  // upload image to firebase storage
  Future<String> updateImage({required String url , required Uint8List file})async{
    // upload image to firebase storage
    var snapshot = await _firebaseStorage.refFromURL(url).putData(file,  SettableMetadata(contentType: "image/jpeg"));
    // get the image URL from firebase storage
    var downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  // generate random string for image name
  String generateName(){
    return RandomString().getRandomString(
        lowersCount: 20 ,
        numbersCount: 20,
        specialsCount: 4,
        uppersCount: 20,
        canSpecialRepeat: true,
        specials: "_"
    );
  }
}