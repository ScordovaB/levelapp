import 'package:flutter/material.dart';

class TermsAndConditions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Terms and Conditions'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                  'By creating an account with Level Up, you agree to provide accurate and up-to-date account information. You are responsible for maintaining the security of your account credentials, using our services in a lawful manner, and complying with our privacy and content guidelines. We reserve the right to terminate or suspend your account for violations of these terms. Thank you for using Level Up!'),
              SizedBox(height: 25),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Close'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
