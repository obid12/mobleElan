import 'package:flutter/material.dart';
import 'package:materi3/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainAppBar extends StatefulWidget with PreferredSizeWidget {
  @override
  State<MainAppBar> createState() => _MainAppBarState();

  @override
  Size get preferredSize => Size(0, 55);
}

class _MainAppBarState extends State<MainAppBar> {
  bool isDark = false;
  saveToLocalStorage() async {
    final frefs = await SharedPreferences.getInstance();
    frefs.setBool("isDark", isDark);
  }

  getLocalData() async {
    final prefs = await SharedPreferences.getInstance();

    prefs.getBool("isDark") ?? false;
    setState(() {});
  }

  void initState() {
    getLocalData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor:
          isDark ? Color(0xff333333) : Color.fromARGB(255, 233, 107, 23),
      centerTitle: true,
      titleSpacing: 0,
      title: Text(
        "Chat",
        textAlign: TextAlign.center,
      ),
      actions: [
        InkWell(
          child: isDark ? Icon(Icons.masks_sharp) : Icon(Icons.ac_unit),
          onTap: () {
            isDark = !isDark;
            saveToLocalStorage();
            setState(() {
              initState();
            });
          },
        ),
        SizedBox(
          width: 12.0,
        ),
        IconButton(
            icon: Icon(Icons.logout),
            onPressed: () async {
              final prefs = await SharedPreferences.getInstance();
              prefs.remove("login");
              prefs.remove("id");
              prefs.remove("nama");
              prefs.remove("nim");
              prefs.remove("username");
              prefs.remove("password");
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Login();
              }));
            })
      ],
    );
  }
}
