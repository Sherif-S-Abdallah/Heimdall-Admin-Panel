
import 'package:firebase_database/firebase_database.dart';

FirebaseLockRealtimeDatabase injectFirebaseLockRealtimeDatabase(){
  return FirebaseLockRealtimeDatabase.getInstance();
}


class FirebaseLockRealtimeDatabase {


  FirebaseLockRealtimeDatabase._();
  static FirebaseLockRealtimeDatabase? instance;
  static getInstance(){
    return instance ??= FirebaseLockRealtimeDatabase._();
  }

  Future<void> addLockToDatabase({required String id})async{
     DatabaseReference firebaseStorage = FirebaseDatabase.instance.ref("Locks/$id");
     await firebaseStorage.set({
       "opened" : false,
       "lastImage" : ""
     });
  }

  Future<void> deleteLock({required String id})async{
    DatabaseReference firebaseStorage = FirebaseDatabase.instance.ref("Locks/$id");
    await firebaseStorage.remove();
  }

}