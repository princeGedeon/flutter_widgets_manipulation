import 'package:flutter/material.dart';
import 'package:tp_cours_advanced_widgets/models/model_widget/navigation_models.dart';

class PageForm extends StatefulWidget {
  const PageForm({Key? key}) : super(key: key);

  @override
  State<PageForm> createState() => _PageFormState();
}

class _PageFormState extends State<PageForm> {

  int _selectedIndex=0;
  late TextEditingController nomcontroller;
  late TextEditingController genrecontroller;
  late TextEditingController passcontroller;
  List<String> favoris=[];
  bool _isloading=false;
  bool _isDisplay=false;
  final _formkey=GlobalKey<FormState>();




  @override
  void initState() {
    // TODO: implement initState
    nomcontroller=TextEditingController();
    genrecontroller=TextEditingController();
    passcontroller=TextEditingController();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final Size size=MediaQuery.of(context).size;
    return Scaffold(


      body: Container(
        width: size.width,
        padding: EdgeInsets.symmetric(vertical: 10,horizontal: 6),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Text("Information de l'utilisateur",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue,fontSize: 20,),textAlign: TextAlign.center,),
            Container(
              padding: EdgeInsets.symmetric(vertical: 8),


              child: CircleAvatar(
                radius: 60,
              foregroundImage: AssetImage("assets/10490451.jpg"),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 5,horizontal: 20),
              child: monForm()
            )


          ],
        ),
      ),

    );
  }

  Widget monForm(){
    return Form(
      key: _formkey,

      child: Column(
        children: [
          TextFormField(
            controller: nomcontroller,
          ),
          TextFormField(
            controller: ,
          ),


        ],

      ),


    );
  }

}
