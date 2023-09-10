import 'second_screen.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() =>  _MyHomePageState();
}

class  _MyHomePageState extends State <MyHomePage> {

  var items = List<String>.generate(100, (index) => 'Item $index');
  @override
 Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text("Flutter"),
            leading: IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {},
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () {},
            ),
            ],
            /*flexibleSpace: Image.asset(
              "assets/back.jpg", 
              fit: BoxFit.cover,
            ),*/
            bottom: const TabBar(
              tabs: <Widget>[
                Tab(
                  text: 'Car',
                  icon: Icon(Icons.directions_car),
                ),
                Tab(
                  text: 'Train',
                  icon: Icon(Icons.directions_transit),
                ),
                Tab(
                  text: 'Bike',
                  icon: Icon(Icons.directions_bike),
                ),
              ],
            ),
            elevation: 2.0,
            backgroundColor: Colors.blue,
          ),
          /*body: const TabBarView(
          children: <Widget>[
            Icon(Icons.directions_car),
            Icon(Icons.directions_transit),
            Icon(Icons.directions_bike),
          ],
        ),*/

        body: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  maxLength: 8,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                  ),
                  //keyboardType: TextInputType.number,
                  style: TextStyle(fontSize: 22.0),
                ),
              ),
            ],
          ) 
        ),


        /*body: Container(
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              ListTile(
                leading: Icon(Icons.brightness_auto),
                title: Text("Brightness Auto"),
                subtitle: Text("Change the brightness"),
                trailing: Icon(Icons.menu),
                onTap: (){},
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.image),
                title: Text("Change Image"),
                subtitle: Text("Change the Image"),
                trailing: Icon(Icons.menu),
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.keyboard),
                title: Text("Keyboard Layout"),
                subtitle: Text("Change the Keyboard Layout"),
                trailing: Icon(Icons.menu),
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.ac_unit),
                title: Text("Ring Option"),
                subtitle: Text("Change the Ring Option"),
                trailing: Icon(Icons.menu),
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.build),
                title: Text("Settings"),
                subtitle: Text("Change Settings"),
                trailing: Icon(Icons.menu),
              ),
              ListTile(
                leading: Icon(Icons.nature_people),
                title: Text("Near"),
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.backup),
                title: Text("Backups"),
              ),
            ],
          ),
        ),*/

        /*body: ListView.builder(
          itemCount: items.length, 
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(items[index]),
            );
          },
        ),*/


        floatingActionButton:FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (_){
              return SecondScreen("Hello");
            }));
            //Navigator.of(context).pushNamed('/second');
          },
        ) ,
        ),
      ),
    );
  }
}
