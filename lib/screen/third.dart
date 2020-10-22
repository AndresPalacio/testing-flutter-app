import 'package:flutter/material.dart';
import 'package:flutter_app_testing_dojo/model/item.dart';
import 'package:flutter_app_testing_dojo/screen/getItems.dart';
import 'package:flutter_app_testing_dojo/service/item_service.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import '../bloc/account.dart';

class ThirdScreen extends StatefulWidget {
  @override
  _ThirdScreenState createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  ItemService itemService = new ItemService();
  ProgressDialog progressDialog;
  final _formKey = GlobalKey<FormState>();
  var error;

  saveToDB(String repo,int start,BuildContext buildContext) async {
    var result = await itemService.insertItem(Item(
      name:repo,
      cost:  start
    ));
    displayAlert(result,buildContext);
  }

  displayAlert(value, BuildContext context) {
    if (value != 0) {
      Alert(
        context: context,
        type: AlertType.success,
        title: "Hooray!",
        desc: "Item saved successfully",
        buttons: [
          DialogButton(
            child: Text(
              "OK",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: (){
              Navigator.of(context, rootNavigator: true).pop();
            },
            width: 120,
          )
        ],
      ).show();
    } else {
      Alert(
        context: context,
        type: AlertType.error,
        title: "Oh no!",
        desc: "Unable to save item, please try again later!",
        buttons: [
          DialogButton(
            child: Text(
              "OK",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            color: Colors.red,
            onPressed: (){
              Navigator.of(context, rootNavigator: true).pop();
            },
            width: 120,
          )
        ],
      ).show();
    }
  }

  @override
  Widget build(BuildContext context) {
    var accountBloc = Provider.of<AccountBloc>(context);
    return MaterialApp(
      home: Scaffold(
        key: _formKey,
        appBar: AppBar(
          title: Text("Provider & Bloc example"),
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
                      builder: (context) => ThirdScreen(),
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
        body: Form(
          child: Stack(
            children: <Widget>[
              Scrollbar(
                child: NotificationListener<ScrollNotification>(
                  onNotification: (ScrollNotification scrollInfo) {
                    if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
                      if (!accountBloc.getLoading()) {
                        accountBloc.setPage(accountBloc.getPage() + 1);
                        accountBloc.setLoading();
                        accountBloc.getData(accountBloc.getPage());
                        return true;
                      }
                    }
                    return false;
                  },
                  child: ListView.builder(
                    itemCount: accountBloc.getList().length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        child: ListTile(
                            leading:
                            Image.network(accountBloc.getList()[index].avatar),
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Expanded(
                                  child:
                                  Text('${accountBloc.getList()[index].name}'),
                                ),
                                Row(
                                  children: <Widget>[
                                    Icon(Icons.star),
                                    Text('${accountBloc.getList()[index].star}'),
                                  ],
                                ),
                              ],
                            ),
                            subtitle: Row(
                              children: <Widget>[
                                Expanded(
                                  child: Text(
                                      '${accountBloc.getList()[index].description}'),
                                ),
                                IconButton(icon: Icon(Icons.add_circle), onPressed:
                                    (){
                                  saveToDB(accountBloc.getList()[index].name, accountBloc.getList()[index].star,context);
                                },
                                ),
                              ],
                            )),
                      );
                    },
                  ),
                ),
              ),
              _loader(context,accountBloc),

            ],
          ),
        ),
      ),
    );
  }

  Widget _loader(BuildContext context,accountModel) {
    return accountModel.getLoading()
        ? Align(
      child: Container(
        width: 200.0,
        height: 150.0,
        child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Center(child: CircularProgressIndicator())),
      ),
      alignment: FractionalOffset.bottomCenter,
    )
        : SizedBox(
      width: 0.0,
      height: 0.0,
    );
  }
}

