import 'package:flutter/material.dart';
import '../screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(String title, IconData icon, Function tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text(
              'Cooking Up!',
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                  color: Theme.of(context).primaryColor),
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ExpansionPanelList(
          expansionCallback: (int index, bool isExpanded) {},
          children: [
            ExpansionPanel(
              headerBuilder: (BuildContext context, bool isExpanded) {
                return ListTile(
                  title: Text('Item 1'),
                );
              },
              body: ListTile(
                title: Text('Item 1 child'),
                subtitle: Text('Details goes here'),
              ),
              isExpanded: true,
            ),
            ExpansionPanel(
              headerBuilder: (BuildContext context, bool isExpanded) {
                return ListTile(
                  title: Text('Item 2'),
                );
              },
              body: ListTile(
                title: Text('Item 2 child'),
                subtitle: Text('Details goes here'),
              ),
              isExpanded: false,
            ),
          ],
        ),
          ListTile(
            title: Text('Horse'),
            trailing: IconButton(
              icon: Icon(Icons.keyboard_arrow_right),
              onPressed: () {

              },
            ),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
      InkWell(
        onTap: () {
          Navigator.of(context).pushReplacementNamed('/');
        },
          child: ExpansionTile(
            trailing: IconButton(
                icon: Icon(Icons.keyboard_arrow_right),
                onPressed: () {
                  
                  Navigator.of(context).pushReplacementNamed('/');
                },
            ),
            title: Text("Expansion Title"),
            children: <Widget>[
              buildListTile(
                'Meals',
                Icons.restaurant,
                    () {
                  Navigator.of(context).pushReplacementNamed('/');
                },
              ),
              buildListTile(
                'Filters',
                Icons.settings,
                    () {
                  Navigator.of(context)
                      .pushReplacementNamed(FiltersScreen.routeName);
                },
              ),

            ],
          ),
        ),

        ],
      ),
    );
  }
}
