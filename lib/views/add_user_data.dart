import 'package:flutter/material.dart';
import '../controller/homecontroller.dart';
import '../model/homemodel.dart';

class AddUserData extends StatefulWidget {
  const AddUserData({super.key});

  @override
  State<AddUserData> createState() => _AddUserDataState();
}

class _AddUserDataState extends State<AddUserData> {
  TextEditingController nameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  clear() {
    setState(() {
      nameController.clear();
      usernameController.clear();
      emailController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextField(
            controller: nameController,
            decoration: InputDecoration(hintText: "name"),
          ),
          TextField(
            controller: usernameController,
            decoration: InputDecoration(hintText: "username"),
          ),
          TextField(
            controller: emailController,
            decoration: InputDecoration(hintText: "email"),
          ),
          Column(
            children: [
              ElevatedButton(
                  onPressed: () async {
                    await postUser(
                      Data(
                        name: nameController.text,
                        username: usernameController.text,
                        email: emailController.text));
                    Navigator.pop(context);
                  },
                  child: Text("data"))
            ],
          )
        ],
      ),
    );
  }
}
