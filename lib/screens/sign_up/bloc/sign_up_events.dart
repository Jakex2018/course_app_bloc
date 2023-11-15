abstract class SignUpEvent {
  const SignUpEvent();
}

class UsernameEvent extends SignUpEvent {
  final String username;
  UsernameEvent(this.username);
}

class EmailEvents extends SignUpEvent {
  final String email;
  EmailEvents(this.email);
}


class PasswordEvents extends SignUpEvent {
  final String password;
  PasswordEvents(this.password);
}


class RePasswordEvent extends SignUpEvent {
  final String repassword;
  RePasswordEvent(this.repassword);
}