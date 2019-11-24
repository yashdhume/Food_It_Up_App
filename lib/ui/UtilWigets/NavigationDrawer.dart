import 'package:flutter/material.dart';

final Color active = Colors.white;

buildDrawer() {
  return ClipPath(
    child: Drawer(
      child: Container(
        padding: const EdgeInsets.only(left: 16.0, right: 40),
        decoration: BoxDecoration(
            color: Color(0xfff12711),
            boxShadow: [BoxShadow(color: Colors.black45)],
            gradient:
                LinearGradient(colors: [Color(0xfff12711), Color(0xfff5af19)])),
        width: 300,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  height: 90,
                  alignment: Alignment.center,
                  child: CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage("assets/profile.png"),
                  ),
                ),
                SizedBox(height: 5.0),
                Text(
                  "Yash Dhume",
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                ),
                SizedBox(height: 30.0),
                _buildRow(Icons.home, "Home"),
                _buildDivider(),
                _buildRow(Icons.fastfood, "Meals"),
                _buildDivider(),
                _buildRow(Icons.people, "Freinds"),
                _buildDivider(),
                _buildRow(Icons.settings, "Settings"),
                _buildDivider(),
                _buildRow(Icons.info, "Help"),
                _buildDivider(),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

Divider _buildDivider() {
  return Divider(
    color: active,
  );
}

Widget _buildRow(IconData icon, String title) {
  final TextStyle tStyle = TextStyle(color: active, fontSize: 16.0);
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Row(children: [
      Icon(
        icon,
        color: active,
      ),
      SizedBox(width: 10.0),
      Text(
        title,
        style: tStyle,
      ),
    ]),
  );
}
