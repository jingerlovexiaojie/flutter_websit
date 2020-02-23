import 'package:flutter/material.dart';
import 'package:flutter_websit/pages/about_contact_page.dart';

class AboutUsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AboutUsPageState();
  }
}

class AboutUsPageState extends State<AboutUsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/images/company.jpeg',
            fit: BoxFit.cover,),
            ListTile(
              leading: Icon(Icons.message),
              title: Text('公司介绍'),
              onTap: (){
                Navigator.of(context).pushReplacementNamed('company_info');
              },
            ),
            Divider(
              height: 10.0,
              color: Colors.grey,
            ),
            ListTile(
              leading: Icon(Icons.message),
              title: Text('公司介绍'),
            ),
            Divider(
              height: 10.0,
              color: Colors.grey,
            ),
            ListTile(
              leading: Icon(Icons.message),
              title: Text('联系我们'),
              onTap: (){
                Navigator.push(context,MaterialPageRoute(builder: (context)=>AboutContactPage()));
              },
            ),
            Divider(
              height: 10.0,
              color: Colors.grey,
            ),

          ],
        ),
      ),
    );
  }
}