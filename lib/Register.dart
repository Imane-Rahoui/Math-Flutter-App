import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login.dart';
import 'Map.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  FirebaseAuth auth = FirebaseAuth.instance;
  String email = '';
  String password = '';
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register  page"),
        actions: [
          TextButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Map()),
                );
              },
              icon: Icon(Icons.person),
              label: const Text('Login'),
              style: TextButton.styleFrom(primary: Colors.white))
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 20.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: 'Enter ur email ',
                ),
                onChanged: (text) {
                  setState(() {
                    email = text;
                  });
                  print(email);
                },
                //validator:(text)=>text!.isEmpty?"Email Empty !":null,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: 'Enter ur password ',
                  labelText: 'password',
                ),
                obscureText: true,
                onChanged: (text) {
                  setState(() {
                    password = text;
                  });
                  print(password);
                },
                //validator:(text)=>text!.length<6?"short email!":null,
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () async {
                    if (true) {
                      print("Validated ");
                      print("Mpd est " + password);
                      print("email est " + email);
                      try {
                        await auth
                            .createUserWithEmailAndPassword(
                                email: email, password: password);

                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Login()),
                        );
                      } on FirebaseAuthException catch (e) {
                        print(e.toString());
                      }
                    } else {
                      print("Error ");
                    }
                  },
                  child: const Text("Sign  Up")),
            ],
          ),
        ),
      ),
    );
  }


}
