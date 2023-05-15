import 'package:flutter/material.dart';
import 'package:flutter_class_test/books.dart';
import 'package:flutter_class_test/users.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  List<Users>? lstUSers;
  List<String> itemss = [
    'Kiran Rana',
    'Achyut Timsina',
    'Ram Charan',
    'Allu Arjun'
  ];
  TextEditingController bookname = TextEditingController();
  List<Books> lstBooks = [];
  String dropdownValue = 'Author';

  final pinKey = GlobalKey<FormState>();
  @override
  void didChangeDependencies() {
    lstUSers = ModalRoute.of(context)!.settings.arguments as List<Users>;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        centerTitle: true,
      ),
      body: Form(
        key: pinKey,
        child: ListView(
          children: <Widget>[
            for (var user in lstUSers!) ...{
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  title: Text('Username : ${user.username}'),
                  subtitle: Text('User ID : ${user.userid}'),
                  trailing: const Icon(Icons.book),
                ),
              ),
            },
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                controller: bookname,
                validator: (text) {
                  if (text!.isEmpty) {
                    return 'Please Enter Book Name';
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
                  hintText: 'Enter Book Name',
                  labelText: 'Book Name',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: DropdownButtonFormField(
                validator: (text) {
                  if (text == null) {
                    return 'Please select an author';
                  }

                  return null;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 2),
                  ),
                  labelText: 'Select Author',
                ),
                // dropdownColor: Colors.greenAccent,
                // value: dropdownValue,
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValue = newValue!;
                  });
                },
                items: itemss.map<DropdownMenuItem<String>>(
                  (String city) {
                    return DropdownMenuItem<String>(
                      value: city,
                      child: Text(
                        city,
                        style: const TextStyle(fontSize: 20),
                      ),
                    );
                  },
                ).toList(),
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
                      Books book = Books(bookname.text.trim(), dropdownValue);
                      lstBooks.add(book);
                      if (pinKey.currentState!.validate()) {
                        Navigator.pushNamed(context, '/books',
                            arguments: lstBooks);
                      }
                    });
                  },
                  child: const Text('Add Book'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
