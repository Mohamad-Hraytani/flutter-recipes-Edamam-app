import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutterrecipe/SQL/Sql1.dart';

import 'package:flutterrecipe/SQL/mySqdb.dart';
import 'package:flutterrecipe/helpers/recipe.dart';
import 'package:flutterrecipe/model/ingredients._model.dart';
import 'package:flutterrecipe/model/recipe_model.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home_screen.dart';

class DetailsScreen extends StatefulWidget {
RecipeModel item ;

DetailsScreen(this.item);


  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
List<ingredients> m=[];


@override
  void initState() {
  super.initState();

List<dynamic> mmh = widget.item.ingredients;

mmh.forEach((element) {
m.add(ingredients.fromJson(element??= <String, String>{}));

});
}


  @override
  Widget build(BuildContext context) {
 

      return Scaffold(
        floatingActionButton: FloatingActionButton(

child: Icon(Icons.home),
          onPressed: (){


   

Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=> HomeScreen()));


 
          },
        ),
        body: Container(
          child: n( context, widget.item ) 
        ),
      );
 
  }

  Widget n(BuildContext context,RecipeModel item ) {

    return Consumer<mySqdb>(
      builder:  (ctx, currentitem, _){
      return   SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
    children: [
        SizedBox(height: 20,),
        Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  border: Border.all(
                                      width: 3,
                                      color: Colors.orange,
                                      style: BorderStyle.solid)),
                              width: MediaQuery.of(context).size.width ,
                              child: ClipRRect(
                                borderRadius: BorderRadius.all(Radius.circular(30)),
                                child: Image.network(item.image,alignment: Alignment.center,height: 300,fit: BoxFit.cover,scale: 1,)
                              
                              ),
                            ),
IconButton(icon:Icon( item.fav == "1"? Icons.favorite_border :Icons.favorite,),
                                    color: item.fav == "1"? Colors.white :Colors.red
                                    , 
onPressed: ()async{
if (item.fav == "1")
  { 
    SharedPreferences prefs =await SharedPreferences.getInstance();
       int id =int.parse(prefs.getString("id")??"0");
       int newid = id+1;
       prefs.setString('id', newid.toString());


    Provider.of<Recipe>(context,listen: false).setrecipelistbymodel(item, "2");
   await currentitem.insert(recipemodel( id: id, lable: item.label,image: item.image), );
   
   }
else {
mySqdb mo1=new mySqdb();
var t1= await mo1.getAll("recipe", "recipe_db");
var id_item = t1.where((element) => item.label==element.getlable()).first.getid();
 Provider.of<Recipe>(context,listen: false).setrecipelistbymodel(item, "1");
currentitem.delete(recipemodel(id:id_item, lable: item.label,image: item.image), );
}

                                     }),




Text("ingredientLines",style: TextStyle(fontSize: 20),),
  Container(
                  
                          
                            child: Text('${item.ingredientLines}'),
                            ),
      Text("ingrediens",style: TextStyle(fontSize: 20),),                       
  Container(
                         
                          height: MediaQuery.of(context).size.height * 0.4,
                            child:
                            
                            
                            
                            
                             ListView.builder(
                              itemCount: m.length,
                              itemBuilder: (context , index){
return    Column(
  children: 
  
  [
         Text("text="+ m[index].text ?? ""), 
    Text("quantity="+ m[index].quantity.toString() ??""),
              Text("measure="+ m[index].measure??""),
                  Text("food="+ m[index].food??"")    ,         
    Text("weight="+ m[index].weight.toString()??""),
 
                               
  ],
);


                            })
                            
                            
                        
                            ),


                        

    ],
  ),
      );
      
      
      
      
      
      }
    );
  }

}