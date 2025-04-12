import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

//stateless
//material app
//scaffold

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal,
      brightness: Brightness.dark)),
      home: Scaffold(
        appBar: AppBar(
          //leading: Icon(Icons.add_business),
          title: Text('Structure'),
          centerTitle: true,
          actions: [
            Text("Login"),
            Icon(Icons.login)
            ],
          backgroundColor: Colors.teal,
        ),
        drawer: Drawer(
          child: Column(
            children: [
              DrawerHeader(child: Text("Drawer"),),
              ListTile(title: Text("Logout ?"),),
            ],
          ),
        ),
        floatingActionButton: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FloatingActionButton(onPressed: (){
              print("Checking !");
            },
              heroTag: 'Btn1',
              child: Icon(Icons.add),
            ),
            const SizedBox(height: 10,),
            FloatingActionButton(onPressed: (){
              print("Checking !");
            },
              heroTag: 'Btn1',
              child: Icon(Icons.delete),
            ),
          ],
        ),
        bottomNavigationBar: NavigationBar(
            destinations: const [
              NavigationDestination(
                icon: Icon(Icons.home),
                label: "Home"),
              NavigationDestination(
                  icon: Icon(Icons.person),
                  label: "Profile")
            ],
          onDestinationSelected: (int value){
            print(value);
          },

        ),
      ),
    );
  }
}
