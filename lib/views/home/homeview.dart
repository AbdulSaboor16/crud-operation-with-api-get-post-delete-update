import 'package:apiworking/controller/homecontroller.dart';
import 'package:apiworking/model/homemodel.dart';
import 'package:apiworking/views/add_user_data.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddUserData()),
          );
          setState(() {});
        },
        child: Text("data"),
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: FutureBuilder(
          future: getUsers(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data.data.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(snapshot.data.data[index].name),
                      subtitle: Row(
                        children: [
                          Column(
                            children: [
                              Text(snapshot.data.data[index].username),
                          Text(snapshot.data.data[index].email),
                          Text(snapshot.data.data[index].phone.toString())
                            ],
                          )
                        ],
                      ),
                      trailing: Wrap(
                        children: [
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  deleteUser(
                                      id: snapshot.data.data[index].id
                                          .toString());
                                });
                              },
                              icon: Icon(Icons.delete)),
                          IconButton(
                              onPressed: () async {
                                TextEditingController namesController =
                                    TextEditingController();
                                TextEditingController usernamesController =
                                    TextEditingController();
                                TextEditingController emailsController =
                                    TextEditingController();
                                    TextEditingController phonesController =
                                    TextEditingController();
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Column(
                                          children: [
                                            TextField(
                                              controller: namesController,
                                              decoration: InputDecoration(
                                                  hintText: 'name'),
                                            ),
                                            TextField(
                                              controller: usernamesController,
                                              decoration: InputDecoration(
                                                  hintText: 'username'),
                                            ),
                                            TextField(
                                              controller: emailsController,
                                              decoration: InputDecoration(
                                                  hintText: 'email'),
                                            ),
                                             TextField(
                                              controller: phonesController,
                                              decoration: InputDecoration(
                                                  hintText: 'phone'),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            ElevatedButton(
                                                onPressed: ()async {
                                                await  updateUser(snapshot.data.data[index].id, 
                                                  Data(
                                                    name: namesController.text,
                                                     username: usernamesController.text,
                                                      email: emailsController.text,
                                                      phone: phonesController.text,
                                                  ));
                                               setState(() {
                                               });
                                                  Navigator.of(context).pop();
                                                },
                                                child: Text("updatedata"))
                                          ],
                                        ),
                                      );
                                    });
                              },
                              icon: Icon(Icons.edit)),
                        ],
                      ),
                    );
                  });
            } else {
              return CircularProgressIndicator();
            }
          }),
    );
  }
}
