import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tugas_disney/login.dart';

class ProfilePage extends StatelessWidget {
  Future<Map<String, String>> getUserData() async {
    final prefs = await SharedPreferences.getInstance();
    final email = prefs.getString('email') ?? 'Unknown';
    final password = '******';
    final dob = prefs.getString('dob') ?? 'Unknown';

    return {
      'Email': email,
      'Password': password,
      'Date of Birth': dob,
    };
  }

  void _logout(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: FutureBuilder<Map<String, String>>(
        future: getUserData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          final userData = snapshot.data ?? {};

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.email, color: Colors.blueGrey[700]),
                            SizedBox(width: 10),
                            Text('Email: ${userData['Email']}'),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Icon(Icons.lock, color: Colors.blueGrey[700]),
                            SizedBox(width: 10),
                            Text(
                                'Password: ${userData['Password']}'),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Icon(Icons.cake, color: Colors.blueGrey[700]),
                            SizedBox(width: 10),
                            Text('Date of Birth: ${userData['Date of Birth']}'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: () => _logout(context),
                    child: Text('Logout'),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
