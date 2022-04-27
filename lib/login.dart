import 'package:flutter/material.dart';
import 'package:materi3/page.dart';
import 'dummy_data.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'page.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final username = TextEditingController();

  final password = TextEditingController();

  void initState() {
    super.initState();
    checkJikaSudahLogin();
  }

  void checkJikaSudahLogin() async {
    final prefs = await SharedPreferences.getInstance();
    final bool? status = prefs.getBool('Login');
    if (status == true) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return ChatPage();
      }));
    }
  }

  void log(String username, String password) async {
    // nyimpe data ke sharepreferences
    final prefs = await SharedPreferences.getInstance();
    if (username != "" && password != "") {
      for (int a = 0; a < DummyData.Data.length; a++) {
        if (DummyData.Data[a]["username"] == username &&
            DummyData.Data[a]["password"] == password) {
          prefs.setBool("login", true);
          prefs.setInt("id", DummyData.Data[a]["id"]);
          prefs.setString("nama", DummyData.Data[a]["nama"]);
          prefs.setString("nim", DummyData.Data[a]["Nim"]);
          prefs.setString("username", DummyData.Data[a]["username"]);
          prefs.setString("password", DummyData.Data[a]["password"]);
          // Navigator.of(context).push(
          //     MaterialPageRoute(builder: (BuildContext) => halamanUtama()));
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return ChatPage();
          }));
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.fromLTRB(15, 180, 15, 4),
        child: Column(
          children: [
            Image.asset(
              "images/pngwing.com.png",
              width: 150,
              height: 150,
            ),
            SizedBox(
              height: 50,
            ),
            TextFormField(
              controller: username,
              cursorColor: Colors.white38,
              decoration: InputDecoration(
                hintText: "username",
                filled: true,
                fillColor: Color.fromARGB(255, 150, 145, 145),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 2, color: Colors.grey),
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            TextFormField(
              obscureText: true,
              controller: password,
              cursorColor: Colors.white38,
              decoration: InputDecoration(
                hintText: "password",
                filled: true,
                fillColor: Color.fromARGB(255, 150, 145, 145),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 2, color: Colors.grey),
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            SizedBox(
              width: 180,
              height: 45, // match_parent
              child: RaisedButton(
                  color: Colors.pink,
                  child: Text("Submit"),
                  onPressed: () async {
                    log(username.text, password.text);
                  }),
            )
          ],
        ),
      ),
    ));
  }
}
