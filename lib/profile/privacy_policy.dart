import 'package:flutter/material.dart';

class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({Key? key}) : super(key: key);

  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.lightGreen.shade100,
      appBar: AppBar(
        title: Text('Privacy Policy'),
        backgroundColor: Colors.lightGreen.shade100,
      ),
      body:


      SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Privacy Policy for Plantta',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),
            ),
            SizedBox(height: 20,),
            Text('''Last Updated: [Date]

  Welcome to Plantta! Your privacy is important to us. This Privacy Policy outlines how we collect, use, disclose, and safeguard your information when you use our app. Please read this policy carefully. By using Plantta, you agree to the collection and use of your information in accordance with this policy.

 1. Information We Collect
 We collect information to provide better services to our  users. The types of information we collect include:

   Personal Information: When you register on our app, we may collect personal details such as your name, email address, phone number, and other contact information.
   Usage Data: We collect information on how you interact with the app, including your device type, IP address, browser type, and other diagnostic data.
   Location Data: We may collect location data to provide location-based services. You can enable or disable this through your device settings.
   
   2. How We Use Your Information
   We use the collected information for various purposes, including:

                To provide and maintain our service.
                To improve and personalize your experience on the app.
                To send you updates, notifications, and other communications related to the app.
                To monitor app usage and detect, prevent, and address technical issues.
                To comply with legal obligations and protect the rights of Plantta and its users.
                3. Sharing Your Information
  We do not sell, trade, or otherwise transfer your personal information to outside parties except in the following cases:

        With Your Consent: We may share your information with third parties when you give us explicit consent to do so.
        Service Providers: We may share information with third-party service providers who assist us in operating our app and providing our services, such as payment processing and data analysis.
        Legal Requirements: We may disclose your information if required by law or in response to valid requests by public authorities (e.g., court or government agencies).
          4. Data Security
          We prioritize the security of your personal data. We implement appropriate security measures to protect your information from unauthorized access, alteration, disclosure, or destruction. However, please note that no method of transmission over the internet or electronic storage is completely secure, and we cannot guarantee absolute security.

      5. Your Rights
      You have the right to access, update, or delete your personal information. You can do this through your account settings or by contacting us directly. You also have the right to withdraw consent to our data processing activities at any time.

      6. Third-Party Links
      Our app may contain links to third-party websites or services that are not operated by us. We are not responsible for the privacy practices of these third-party sites. We encourage you to review the privacy policies of every site you visit.

      7. Children’s Privacy
      Our app is not intended for children under the age of 13. We do not knowingly collect personal information from children under 13. If you become aware that a child has provided us with personal information, please contact us, and we will take steps to remove such information.

      8. Changes to This Privacy Policy
      We may update our Privacy Policy from time to time. Any changes will be posted on this page with an updated “Last Updated” date. Your continued use of the app after any changes indicates your acceptance of the new terms.

          9. Contact Us
          If you have any questions or concerns about this Privacy Policy, please contact us at:

      Email: support@plantta.com''')
            ]
        ),
      )
    );
  }
}
