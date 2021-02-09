import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:sql_flutter_json_second/Service/Service_api.dart';
import 'package:sql_flutter_json_second/Service/User_service.dart';

class Employ extends StatefulWidget {
  const Employ ({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<Employ> {
  var isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('JSON sqlite'),
        centerTitle: true,
        actions: <Widget>[
          Container(
            padding: EdgeInsets.only(right: 10.0),
            child: IconButton(
              icon: Icon(Icons.settings_input_antenna),
              onPressed: () async {
                await _loadFromApi();
              },
            ),
          ),
          Container(
            padding: EdgeInsets.only(right: 10.0),
            child: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () async {
                await _deleteData();
              },
            ),
          ),
        ],
      ),
      body: isLoading
          ? Center(
        child:,
      )
          : _buildEmployeeListView(),
    );
  }

  _loadFromApi() async {
    setState(() {
      isLoading = true;
    });

    var apiProvider = EmployeeApiProvider();
    await apiProvider.getAllEmployees();

    // wait for 2 seconds to simulate loading of data
    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      isLoading = false;
    });
  }

  _deleteData() async {
    setState(() {
      isLoading = true;
    });

    await DBProvider.db.deleteAllEmployees();

    // wait for 1 second to simulate loading of data
    await Future.delayed(const Duration(seconds: 1));

    setState(() {
      isLoading = false;
    });

    print('All employees deleted');
  }

  _buildEmployeeListView() {
    return FutureBuilder(
      future: DBProvider.db.getAllEmployees(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {

          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Card(
            elevation: 0,
            child: ListView.separated(
              separatorBuilder: (context, index) => Divider(
              ),
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                return  ListTile(
                    leading: Text(
                      "${index + 1}",
                      style: TextStyle(fontSize: 20.0),
                    ),
                    title: Text(
                        "Name: ${snapshot.data[index].name} ${snapshot.data[index].username}"),
                    subtitle: Text('EMAIL: ${snapshot.data[index].address.city}'),
                    trailing: Container(
                      child: Column(
                        children: [
                          Text("name"),
                        ],
                      ),
                    ),
                );
              },
            ),
          );
        }
      },
    );
  }
}