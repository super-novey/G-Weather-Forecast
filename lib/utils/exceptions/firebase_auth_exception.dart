class MyFirebaseAuthException implements Exception {
  final String code;

  MyFirebaseAuthException(this.code);

  String get message {
    switch (code) {
      case 'email-already-in-use':
        return "The email address is already registered. Please use a different email.";
      case 'invalid-email':
        return "The email address is not valid. Please provide a valid email.";
      case 'operation-not-allowed':
        return "Email/password accounts are not enabled. Enable email/password accounts in the Firebase Console, under the Auth tab.";
      case 'weak-password':
        return "The password is not strong enough. Please choose a stronger password.";
      default:
        return "An unknown error occurred. Please try again.";
    }
  }
}
