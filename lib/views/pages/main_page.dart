
import 'package:flutter/material.dart';
import 'package:tp_cours_advanced_widgets/views/pages/page_form.dart';

import '../../models/model_widget/navigation_models.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key,required this.title}) : super(key: key);
  String title;
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selected_index=0;
  static final List<NavigationItem> items_navigation=[
    NavigationItem(title: "home", icon: Icons.person, page: PageForm()),
    NavigationItem(title: "edit", icon: Icons.abc, page: Container(child: Text("A"),)),
    NavigationItem(title: "other", icon: Icons.delete, page: Container(child: Text("B"),))
  ];

  void _onItemTapped(int index) {
    print(index);
    setState(() {

      selected_index = index;
    });
  }
  final List<NavigationItem> draweritems=[
    NavigationItem(title: "test", icon: Icons.add, page: Container()),
    NavigationItem(title: "test2", icon: Icons.add, page: Container()),
    NavigationItem(title: "test3", icon: Icons.add, page: Container()),

  ];


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      drawer: customDrawer(),
      appBar: AppBar(
        title: Text("Inscription"),
        actions: [
          IconButton(onPressed:addMessage_by_snack , icon: Icon(Icons.add)),
          IconButton(onPressed: (){print("hello1");}, icon: Icon(Icons.lock))
        ],
      ),
      body: items_navigation.map((item) => item.page).toList().elementAt(selected_index),
      bottomNavigationBar:BottomNavigationBar(
        items: items_navigation.map((item) => BottomNavigationBarItem(icon: Icon(item.icon),label: item.title)).toList(),
      onTap:_onItemTapped,
          selectedItemColor:Colors.amber,
        currentIndex: selected_index,
      ) ,

    );
  }
  addMessage_by_snack(){
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Mes notifications"))
    );
  }



  //Drawer
  Drawer customDrawer(){
    return Drawer(

      child: Column(

        children: [

          Expanded(

            child: ListView.separated(itemBuilder: (context,index){

              if (index==0){
                return DrawerHeader(child: Text("Prince Gédéon GUEDJE",style: TextStyle(color: Colors.white,fontSize: 18),),
                  decoration: BoxDecoration(color: Colors.teal),);
              }
              final item=draweritems[index-1];

              return ListTile(title:Text( item.title),leading: Icon(item.icon),
                onTap: (){
                  print("Go");
                  Navigator.pop(context);
                },
              );

            },
                separatorBuilder: (context,index){
                  return Divider();
                }, itemCount: draweritems.length+1),
          )



        ],

      ),
    );
  }

}
