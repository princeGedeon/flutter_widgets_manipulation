

import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:tp_cours_advanced_widgets/models/model_widget/navigation_models.dart';

import '../../models/enum_model/enum_genre.dart';
import '../../models/model_class/user_model.dart';

class PageForm extends StatefulWidget {
  const PageForm({Key? key}) : super(key: key);

  @override
  State<PageForm> createState() => _PageFormState();
}

class _PageFormState extends State<PageForm> {
  User user=User(nom: '', password: '', genre: Genre.Masculin);
  int _selectedIndex=0;
  late TextEditingController nomcontroller;
  late TextEditingController genrecontroller;
  late TextEditingController passcontroller;
  List<String> favoris=[];
  List<String> myhobbies=[];
  Genre initialGenre=Genre.Masculin;
  bool _isloading=false;
  bool _isDisplay=false;
  String imagPath="assets/10490451.jpg";
  final _formkey=GlobalKey<FormState>();
  Map<String,bool> hoobies={
    "Mangas":false,
    "Coder":false,
    "Football":false,
    "Séries":false
  };




  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    nomcontroller=TextEditingController();
    genrecontroller=TextEditingController();
    passcontroller=TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    nomcontroller.dispose();
    genrecontroller.dispose();
    passcontroller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    final Size size=MediaQuery.of(context).size;
    return Scaffold(


      body: SingleChildScrollView(
        child: Container(
          width: size.width,
          padding: EdgeInsets.symmetric(vertical: 10,horizontal: 6),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text("Information de l'utilisateur",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue,fontSize: 20,),textAlign: TextAlign.center,),
              Container(
                padding: EdgeInsets.symmetric(vertical: 8),


                child: Stack(
                  alignment: Alignment.bottomLeft,
                  children:[
                    CircleAvatar(
                      radius: 60,
                      foregroundImage: AssetImage(imagPath),
                    ),

                    ElevatedButton(onPressed: ()=>takePicture(ImageSource.gallery), child: Icon(Icons.camera),style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          // Change your radius here
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),))
                  ]
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 5,horizontal: 20),
                child: monForm()
              )


            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {

      },
        child: Icon(Icons.add),

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
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              icon: Icon(Icons.person),
              hintText: "Nom & Prénom *"
            ),

          ),
          TextFormField(
            controller: passcontroller,
            keyboardType: TextInputType.visiblePassword,
            obscureText: true,
            decoration: InputDecoration(
              icon: Icon(Icons.password),
              hintText: "Mot de Passe *"
            ),
          ),
          DropdownButtonFormField(hint: Text("Sexe"),decoration: InputDecoration(
            icon: Icon(Icons.accessible_sharp)
          ),items: Genre.values.map((genre){

            return DropdownMenuItem<Genre>(
              value: genre,
              child: Text(genre.toString()),
            );
          }).toList(), onChanged: (Genre? value) {
            setState(() {
              initialGenre=value!;
            });
          },


          ),

        Container(
          padding: EdgeInsets.only(top: 20,left: 10),


          child: funcHobbies(),
        ),

          Container(
            padding: EdgeInsets.only(top: 10),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                ElevatedButton(onPressed:(){
          if (_formkey.currentState!.validate()) {
            showdialog(context);
          }
                },
               child: Text("Valider")),
                SizedBox(width: 15,),
              _isloading?CircularProgressIndicator():SizedBox()
              ],
            ),

          ),
          Container(
            child: _isDisplay?maCard():SizedBox(),
          )
        ],


      ),


    );
  }

   showdialog(BuildContext context) async {
    return  showDialog(context: context, builder:(context){
      return AlertDialog(
        title: Text("Confirmation"),
        content: Text("Voulez-vous vraiment confirmer?"),
        actions: [
        TextButton(onPressed: (){
          Navigator.pop(context);
        }, child: Text("Non")),
          TextButton(onPressed: () async{


        setState(() {
          _isloading=true;
        });
        //Declencher une action apres 5seconde
        Navigator.pop(context);
        Future.delayed(Duration(seconds: 5),(){
          setState(() {
            _isloading=false;
            _isDisplay = true;

            user = User(nom: nomcontroller.text,
                password: nomcontroller.text,
                genre: initialGenre);
          });
        });



          }, child: Text("Oui"))
        ],
      );
    });
  }

  Column funcHobbies(){
    List<Widget> widgets=[Text("Quels sont vos passe-temps?",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),)];
    hoobies.forEach((hobbie, like) {
      Row r=Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(hobbie),
          Checkbox(value: like, onChanged: (newbool){
            setState((){
              hoobies[hobbie]= newbool??false;
              List<String> str=[];
              hoobies.forEach((key, value) {
                if (value==true){
                  str.add(key);
                }

              });
              myhobbies=str;

            });

          })
        ],
      );
      widgets.add(r);
    });
    return Column(children: widgets,);
  }

  Widget maCard(){
    return Card(

      child: Container(
        width: MediaQuery.of(context).size.width*0.75,
        height: 150,
        padding: EdgeInsets.symmetric(vertical: 5,horizontal: 8),
        child:Column(
          children: [
            Text("Mes informations",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,),textAlign: TextAlign.center,),
            SizedBox(height: 15,),
            Text("nom : ${user.nom}"),
            Text("Genre : ${user.genre}"),
            Container(
              padding: EdgeInsets.symmetric(vertical: 6),
              child: Column(
                children: [
                  Text("Mes passions",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),

                ],
              ),
            )
            
          ],
        )
      ),
    );
  }
  takePicture(ImageSource source) async {
    XFile? xfile=await ImagePicker().pickImage(source: source);
    if (xfile==null) return;
    setState(() {
      imagPath=xfile!.path;
    });
  }


}
