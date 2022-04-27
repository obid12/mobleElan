import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login.dart';
import 'data.dart';
import 'detailScreen.dart';

class ChatPage extends StatefulWidget {
  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
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

  void valuee() async {
    //login
    final prefs = await SharedPreferences.getInstance();
    final String? name = prefs.getString('nama');
    final String? nim = prefs.getString('nim');

    setState(() {
      namaAslab = name.toString();
      nimAslab = nim.toString();
    });
  }

  String namaAslab = "";
  String nimAslab = "";

  @override
  void initState() {
    valuee();
    getLocalData();
    super.initState();
    // _controller = TabController(length: 4, vsync: this, initialIndex: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isDark ? Color(0xff333333) : Colors.white,
      appBar: AppBar(
        backgroundColor:
            isDark ? Colors.black87 : Color.fromARGB(255, 233, 107, 23),
        centerTitle: true,
        titleSpacing: 0,
        title: Text(
          "Chat",
          textAlign: TextAlign.center,
        ),
        actions: [
          IconButton(
            icon: isDark ? Icon(Icons.masks_sharp) : Icon(Icons.ac_unit),
            onPressed: () {
              isDark = !isDark;
              saveToLocalStorage();
              getLocalData();
              // setState(() {
              //   initState();
              // });
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
                prefs.remove("Nim");
                prefs.remove("username");
                prefs.remove("password");
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Login();
                }));
              })
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Halo",
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 30.0,
              color: isDark ? Colors.white : Color.fromARGB(255, 233, 107, 23),
            ),
          ),
          Text(
            "$namaAslab", //
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
              color: isDark ? Colors.white : Color.fromARGB(255, 233, 107, 23),
            ),
          ),
          Text(
            "$nimAslab", //\n
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
              color: isDark ? Colors.white : Color.fromARGB(255, 233, 107, 23),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                final BtsMember member = memberBtsList[index];
                return InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return DetailScreen(
                        member: member,
                      );
                    }));
                  },
                  child: Card(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: Image.asset(member.imageAsset),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Text(
                                  member.name,
                                  style: TextStyle(fontSize: 16.0),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(member.panggilan),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(member.birthday),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              itemCount: memberBtsList.length,
            ),
          )
        ],
      ),
    );
  }
}
