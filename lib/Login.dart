import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'Map.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  FirebaseAuth auth = FirebaseAuth.instance;

  String email = '';
  String password = '';
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login page'),
        actions: [
          //FlatButton.icon(icon:, onPressed: , label: ,) PAS UTILISe
          TextButton.icon(
            onPressed: () {
              print("pressed button");
            },
            icon: const Icon(Icons.person),
            label: const Text('Login'),
            style: TextButton.styleFrom(primary: Colors.white),
          )
        ], //elem cliquable
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 20.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.email), hintText: 'email'),
                onChanged: (text) {
                  email = text;
                },
                //validator: (text)=>text!.isEmpty?'email Empty':'null',
              ),
              //const SizedBox(height: 20.0),
              TextFormField(
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.lock), hintText: 'password'),
                onChanged: (text) {
                  password = text;
                },
              ),
              ElevatedButton(
                  onPressed: () async {
                    if (true) {
                      print("Validated ");
                      print("Mpd est " + password);
                      print("email est " + email);

                      try {
                        await auth.signInWithEmailAndPassword(
                            email: email, password: password);
                        print('good');
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Map()),
                        );
                      } on FirebaseAuthException catch (e) {
                        print(e);
                        print("Error connection");
                      }
                    } else {
                      print("Error ");
                    }
                  },
                  child: const Text('sign in'))
            ],
          ),
        ),
      ),
    );
  }
}
