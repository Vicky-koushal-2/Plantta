import 'package:flutter/material.dart';

class TermAndCondition extends StatefulWidget {
  const TermAndCondition({Key? key}) : super(key: key);

  @override
  State<TermAndCondition> createState() => _TermAndConditionState();
}

class _TermAndConditionState extends State<TermAndCondition> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen.shade100,
      appBar: AppBar(
        backgroundColor: Colors.lightGreen.shade100,
        title: Text('Terms & Conditions'),),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Terms and Conditions',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              '''Welcome to Plantta! 

Please read these terms and conditions carefully before using our app. By using Plantta, you agree to abide by these terms:

1. **Acceptance of Terms:** By accessing or using Plantta, you agree to comply with and be bound by these terms.

2. **Use of the App:** You are responsible for your use of the app and agree to use it in a manner that is lawful and respectful to others.

3. **Account Responsibility:** You are responsible for maintaining the confidentiality of your account information and for any activities that occur under your account.

4. **Content Ownership:** All content provided on the app, including text, images, and other materials, is owned by Plantta or its licensors and is protected by applicable copyright laws.

5. **Prohibited Activities:** You agree not to engage in any activities that may harm or interfere with the proper functioning of the app, including but not limited to hacking, distributing viruses, or spamming.

6. **Limitation of Liability:** Plantta is not responsible for any damages, losses, or injuries arising from the use of the app.

7. **Privacy:** Your privacy is important to us. Please review our Privacy Policy to understand how we collect, use, and protect your information.

8. **Changes to Terms:** We reserve the right to modify these terms at any time. Your continued use of the app after any changes indicates your acceptance of the new terms.

If you have any questions or concerns about these terms, please contact us at support@plantta.com.

Thank you for using Plantta! We hope you enjoy your experience.''',
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
            SizedBox(height: 24),
            // Button to accept terms

          ],
        ),
      ),
    );
  }
}
