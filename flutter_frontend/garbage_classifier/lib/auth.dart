import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';



String UsertoJson(Adduser data) => json.encode(data.toJson());

class Adduser {
  Adduser(
    this.id,
    this.score,
  );

  String id;
  int score;

  Map<String, dynamic> toJson() => {
    "greeting": id,
    "instructions": score,
  };
}


class AuthenticationService {
  final FirebaseAuth _firebaseAuth;

  AuthenticationService(this._firebaseAuth);

  /// Changed to idTokenChanges as it updates depending on more cases.
  Stream<User> get authStateChanges => _firebaseAuth.idTokenChanges();

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  Future<String> signIn({String email, String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      return "Signed in";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<String> signUp({String email, String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      var  web = "https://quickstart-image-rvoiadg33q-uc.a.run.app/home";
      // To parse this JSON data, do
      //
      //var ud = new Adduser(email,0);
      //final sendJson = UsertoJson(ud);
      var url = 'https://quickstart-image-rvoiadg33q-uc.a.run.app/home';
      var body = json.encode({"id": email, "score": 0});
      Map<String,String> headers = {
        'Content-type' : 'application/json',
        'Accept': 'application/json',
      };
    var resp = await http.post(url,body: body, headers: headers);
    if (resp.statusCode==200){
      print("nice");
    }
      return "Signed up";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }
}


