import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spotify/form/form%20builder.dart';

import '../models/list_model.dart';

class Demo extends StatefulWidget {
  String username;
  String password;
  String gender;
  Demo({required this.username, required this.password, required this.gender});

  @override
  State<Demo> createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  int index = 0;

  List<HomeModel> cars = [
    HomeModel(
        name: "Afra",
        image: AssetImage("img1.jpg"),
        icon: Icon(Icons.delete),
        subtitle: "I am Afra "),
    HomeModel(
        name: "Aafrin",
        image: AssetImage("img2.jpg"),
        icon: Icon(Icons.delete),
        subtitle: "I am Aafrin "),
    HomeModel(
        name: "Rooban",
        image: AssetImage("img3.jpg"),
        icon: Icon(Icons.delete),
        subtitle: "I am Rooban"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal[200],
        title: Text("Contacts"),
        actions: [
          IconButton(onPressed: (() {}), icon: Icon(Icons.search)),
          IconButton(onPressed: (() {}), icon: Icon(Icons.more_vert))
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
                child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
              ),
              itemCount: cars.length,
              itemBuilder: (context, index) {
                return GridTile(
                    child: Column(
                  children: [
                    Container(
                      child: CircleAvatar(
                        backgroundImage: cars[index].image,
                        radius: 50,
                      ),
                    ),
                    Container(
                      child: Text(cars[index].name),
                    ),
                    Container(
                      child: Text(cars[index].subtitle),
                    ),
                    Container(
                      child: cars[index].icon,
                    )
                  ],
                ));
              },
            )

                // // scrollDirection: Axis.horizontal,
                // children: [
                //   GridTile(child:
                //   CircleAvatar(backgroundImage: AssetImage("assets/img1.jpg") ,radius: 30,)),
                //    GridTile(child:
                //   CircleAvatar(backgroundImage: AssetImage("assets/img2.jpg") ,radius: 30,)),
                //    GridTile(child:
                //   CircleAvatar(backgroundImage: AssetImage("assets/img3.jpg") ,radius: 30,)),
                //    GridTile(child:
                //   CircleAvatar(backgroundImage: AssetImage("assets/img4.jpg") ,radius: 30,)),
                //    GridTile(child:
                //   CircleAvatar(backgroundImage: AssetImage("assets/img5.jpg") ,radius: 30,)),
                //    GridTile(child:
                //   CircleAvatar(backgroundImage: AssetImage("assets/img6.jpg") ,radius: 30,)),

                //  Image(image: AssetImage("assets/img5.jpg"),)),
                //  GridTile(child: Image(image: AssetImage("assets/img4.jpg"),)),
                //   GridTile(child: Image(image: AssetImage("assets/img6.jpg"),)),
                //    GridTile(child: Image(image: AssetImage("assets/img.jpg"),)),
                //     GridTile(child: Image(image: AssetImage("assets/pixi1.jpg"),))

                ),
            Expanded(
              child: ListView.builder(
                itemCount: cars.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: cars[index].image,
                      radius: 20,
                    ),
                    title: Text(cars[index].name),
                    subtitle: Text(cars[index].subtitle),
                    trailing: cars[index].icon,
                  );
                },
              ),
            )
          ],
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.teal[200],
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            CircleAvatar(
                radius: 70,
                backgroundColor: Colors.transparent,
                backgroundImage: NetworkImage(
                    "https://images.pexels.com/photos/1765299/pexels-photo-1765299.jpeg?auto=compress&cs=tinysrgb&w=600")),
            SizedBox(
              height: 10,
            ),
            Text(
            widget.username,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            SizedBox(
              height: 10,
            ),
            Divider(
              thickness: 2,
              color: Color.fromARGB(255, 37, 37, 37),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Profile"),
            ),
            ListTile(
              leading: Icon(Icons.favorite_border),
              title: Text("Favorite"),
            ),
            ListTile(
              leading: Icon(Icons.notifications),
              title: Text("Notification"),
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text("Call"),
            ),
            SizedBox(
              height: 10,
            ),
            Divider(
              thickness: 2,
              color: Color.fromARGB(255, 37, 37, 37),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () async {
                  SharedPreferences UserPrefs=await SharedPreferences.getInstance();
                UserPrefs.remove('UserInfo');
                 Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) => form()), (route) => false);
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.black12),
                ),
                child: Text("Sign Out")),
                
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.brown,
          unselectedItemColor: Colors.brown,
          currentIndex: index,
          onTap: (value) {
            setState(() {
              index = value;
              // print(index);
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.shopping_bag_outlined,
                  color: Colors.brown[400],
                ),
                label: "shopping",
                activeIcon: Icon(
                  Icons.shopping_bag_outlined,
                  size: 40,
                  color: Colors.white,
                )),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.shopping_cart,
                  color: Colors.brown[400],
                ),
                label: "cart",
                activeIcon: Icon(
                  Icons.shopping_cart,
                  size: 40,
                  color: Colors.white,
                )),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.favorite,
                  color: Colors.brown[400],
                ),
                label: "favorite",
                activeIcon: Icon(
                  Icons.favorite,
                  size: 40,
                  color: Colors.white,
                ))
          ],
          backgroundColor: Colors.teal[300]),
    );
  }
}
