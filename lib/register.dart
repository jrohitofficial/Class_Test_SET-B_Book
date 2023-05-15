import 'package:flutter/material.dart';
import 'package:flutter_class_test/users.dart';

class RegisterPages extends StatefulWidget {
  const RegisterPages({super.key});

  @override
  State<RegisterPages> createState() => _RegisterPagesState();
}

class _RegisterPagesState extends State<RegisterPages> {
  final finalKey = GlobalKey<FormState>();
  List<Users> lstUsers = [];
  TextEditingController userId = TextEditingController();
  TextEditingController fname = TextEditingController();
  TextEditingController lname = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  Padding fieldss(String hintss, String labels, TextEditingController contr) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextFormField(
        controller: contr,
        validator: (value) {
          if (value!.isEmpty) {
            return 'Enter Proper Details';
          }
          return null;
        },
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue, width: 2.0),
          ),
          hintText: hintss,
          labelText: labels,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registration'),
        centerTitle: true,
      ),
      body: Card(
        child: Form(
          key: finalKey,
          child: ListView(
            children: <Widget>[
              fieldss('Enter Accout number', 'Account No', userId),
              fieldss('Enter First name', 'First Name', fname),
              fieldss('Enter Last name', 'Last Name', lname),
              fieldss('Enter Age', 'Age', age),
              fieldss('Enter Username', 'Username', username),
              fieldss('Enter Password', 'Password', password),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 50.0,
                  width: double.infinity,
                  child: ElevatedButton(
                    child: const Text('Register'),
                    onPressed: () {
                      setState(() {
                        if (finalKey.currentState!.validate()) {
                          Users user = Users(
                            int.parse(userId.text),
                            fname.text.trim(),
                            lname.text.trim(),
                            int.parse(age.text),
                            username.text.trim(),
                            password.text.trim(),
                          );
                          lstUsers.add(user);
                          Navigator.pushNamed(context, '/login',
                              arguments: lstUsers);
                        }
                      });
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
