import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    return const FirebaseOptions(
      apiKey: "AIzaSyB9BX1OwHhOcKPRHJfPX_dxeVNKA9PV2cI",
      authDomain: "ltnhungnhomanhtuan.firebaseapp.com",
      databaseURL: "https://ltnhungnhomanhtuan-default-rtdb.asia-southeast1.firebasedatabase.app",
      projectId: "ltnhungnhomanhtuan",
      storageBucket: "ltnhungnhomanhtuan.firebasestorage.app",
      messagingSenderId: "357266245281",
      appId: "1:357266245281:android:b6aa505e9cf1a581b7d2e0",
    );
  }
}