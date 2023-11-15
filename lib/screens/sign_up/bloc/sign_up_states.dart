class SignUpStates {
  SignUpStates({this.username="",this.email="",this.password="",this.repassword=""});
  final String username,email,password,repassword;
  SignUpStates copyWith({String? username,String?email,String?password,String?repassword}){
    return SignUpStates(
      username: username?? this.username, 
      email: email??this.email,
      password: password??this.password,
      repassword: repassword??this.password
    );
  }
}