import 'package:flutter/material.dart';
import 'package:flutter_class_test/users.dart';

class LoginPages extends StatefulWidget {
  const LoginPages({super.key});

  @override
  State<LoginPages> createState() => _LoginPagesState();
}

class _LoginPagesState extends State<LoginPages> {
  TextEditingController stdid = TextEditingController();
  TextEditingController passcode = TextEditingController();

  final formKey = GlobalKey<FormState>();

  List<Users>? lstUsers;

  @override
  void didChangeDependencies() {
    lstUsers = ModalRoute.of(context)!.settings.arguments as List<Users>;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LOGIN'),
        centerTitle: true,
      ),
      body: Card(
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              for (var student in lstUsers!) ...{
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: stdid,
                    validator: (text) {
                      if (text!.isEmpty) {
                        return 'Please Enter Account ID';
                      }
                      if (text != student.username) {
                        return 'Enter Valid Account ID';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 2.0),
                      ),
                      hintText: 'Enter UserName',
                      labelText: 'User Name',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: passcode,
                    validator: (text) {
                      if (text!.isEmpty) {
                        return 'Please Enter Details';
                      }
                      if (text != student.password) {
                        return 'Enter Valid Password';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 2.0),
                      ),
                      hintText: 'Enter password',
                      labelText: 'Password',
                    ),
                  ),
                ),
              },
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 50.0,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        if (formKey.currentState!.validate()) {
                          Navigator.pushNamed(context, '/dashboard',
                              arguments: lstUsers);
                        }
                      });
                    },
                    child: const Text('LOGIN'),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 50.0,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        Navigator.pushNamed(context, '/');
                      });
                    },
                    child: const Text('REGISTER'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
