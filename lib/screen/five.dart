import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_testing_dojo/model/item.dart';
import 'package:flutter_app_testing_dojo/screen/addTransaction.dart';
import 'package:flutter_app_testing_dojo/screen/getItems.dart';
import 'package:flutter_app_testing_dojo/service/item_service.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class FiveScreen extends StatefulWidget {
  @override
  _FiveScreenState createState() => _FiveScreenState();
}

class _FiveScreenState extends State<FiveScreen> {


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        brightness: Brightness.light,
        iconTheme: IconThemeData(color: Colors.pinkAccent),
        elevation: 0.0,
        backgroundColor: Colors.white70,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text(
                'Menu',
                style: TextStyle(color: Colors.white, fontSize: 28.0),
              ),
              decoration: BoxDecoration(
                color: Colors.black87,
              ),
            ),
            ListTile(
              title: Text(
                'Add Expense',
                style: TextStyle(fontSize: 20.0),
              ),
              trailing: Icon(Icons.add_circle_outline),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddTransaction(),
                  ),
                );
              },
            ),
            Divider(),
            ListTile(
              title: Text(
                'View Expenses',
                style: TextStyle(fontSize: 20.0),
              ),
              trailing: Icon(Icons.query_builder),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GetItems(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Welcome to',
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 40.0,
                ),
              ),
              Text(
                'Alfred',
                style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                  fontSize: 40.0,
                ),
              ),
              SizedBox(
                height: 25.0,
              ),
              Image(
                  image: AssetImage('images/open-doodles-selfie.png'),
                  height: 200.0),
              SizedBox(
                height: 25.0,
              ),
              Column(
                children: <Widget>[
                  ListTile(
                    title: Center(
                      child: Column(
                        children: <Widget>[
                          Text(
                            'App that will help you instantly',
                            style: TextStyle(
                              fontSize: 22.0,
                              fontFamily: 'Muli',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'record your expenses',
                            style: TextStyle(
                              fontFamily: 'Muli',
                              fontWeight: FontWeight.bold,
                              fontSize: 22.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  MaterialButton(
                    color: Colors.pinkAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    padding: EdgeInsets.only(left: 50.0, right: 50.0),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddTransaction(),
                          ));
                    },
                    child: Text(
                      'ADD NOW',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
