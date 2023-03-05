//In Dart 2.17
//basic enum
/**
    // enum Status {
    //   pending,
    //   completed,
    //   rejected,
    // }
 **/

enum Status {
  authenticated('Successfully Authenticated'),
  unauthenticated('Unsuccessful in Authentication');

  final String message;

  const Status(this.message);
}

void main() async {
  Status userStatus = Status.authenticated;
  if (userStatus == Status.authenticated) {
    /// You can show the message on UI, using:
    print(userStatus.message);
  }
}
