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
import 'package:carousel_slider/carousel_slider.dart'show CarouselOptions, CarouselSlider;

class DetailsScreen extends StatefulWidget {
RecipeModel item ;

DetailsScreen(this.item);


  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
List<ingredients> ingredientsList=[];
List ingredientLinesList=[];

@override
  void initState() {
  super.initState();

widget.item.ingredients.forEach((element) {ingredientsList.add(ingredients.fromJson(element??= <String, String>{}));});
widget.item.ingredientLines.forEach((element) {ingredientLinesList.add(element??= []);});

}


  @override
  Widget build(BuildContext context) {
return Scaffold(
  floatingActionButton: FloatingActionButton(
    backgroundColor: Colors.orange,
    child: Icon(Icons.home),
    onPressed: (){Navigator.of(context).pop();},),

  body: Container(child: details( context, widget.item ) 
        ),
      );}

  Widget details(BuildContext context,RecipeModel item ) {
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
    border: Border.all(width: 3,color: Colors.orange.shade100,style: BorderStyle.solid)),
  width: MediaQuery.of(context).size.width ,
  child: ClipRRect(
     borderRadius: BorderRadius.all(Radius.circular(30)),
     child: Image.network(item.image,alignment: Alignment.center,height: 225,
     fit: BoxFit.cover,scale: 1,)
                              
                              ),
                            ),
IconButton(icon:Icon( item.fav == "1"? Icons.favorite_border :Icons.favorite,),
                                    color: item.fav == "1"? Colors.orange :Colors.red,
                                     
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




Text("ingredientLines",style: TextStyle(fontSize: 25  ,
fontStyle: FontStyle.italic ,fontWeight: FontWeight.bold),),
  Container(

height: MediaQuery.of(context).size.height * 0.25,
    
    child: CarouselSlider.builder(

options: CarouselOptions(
viewportFraction:0.42 ,
                            //    aspectRatio: 2,
          //    height: 186,
              initialPage:  1 ,
              enableInfiniteScroll: false, // تدوير الصور بشكل غير نهائي
              enlargeCenterPage:true, // الصورة المعروضة كبيرة الحجم والباقي اصغر انميشن حلو
        //      autoPlay: true, // تحريك الصور بشكل تلقائي
          //    autoPlayInterval:Duration(seconds: 4), // مدة محددة للتنقل بين الصفحات تلقايا
              pauseAutoPlayOnTouch:true, // عند الضغط على العنصر هل يتوقف ام لا يتوقف
             // reverse: true, // ترتيب الصور معكوس
              scrollDirection: Axis.vertical, // نمط تدور الصور
        //      onPageChanged: (index, _) {
                // اندكس الصورة الظاهرة
            //    setState(() { t = index;}); }
                
                ),



      
      itemCount: ingredientLinesList.length,
      itemBuilder:(BuildContext context, int index) 
       { return 
           Container(
                          alignment: Alignment.center,
                        padding: EdgeInsets.all(5),
      
    
      decoration: BoxDecoration(

            color: Colors.orange.shade200,
    
            borderRadius: BorderRadius.only( topLeft: Radius.circular(20),bottomRight:Radius.circular(20) )),           
                  child: Text('${ingredientLinesList[index]}'),
                                    );}
                                 
    ),
  ),
      Text("ingrediens",style: TextStyle(fontSize: 30,
fontStyle: FontStyle.italic ,fontWeight: FontWeight.bold),),                       
  Container(
                         
height: MediaQuery.of(context).size.height * 0.3,
                            child:
                            
                            
                            
                            
                             CarouselSlider.builder(

                               options: CarouselOptions(
viewportFraction:0.5 ,
                               // aspectRatio: 2,
              height: 165,
              initialPage:   1,
              enableInfiniteScroll: false, // تدوير الصور بشكل غير نهائي
              enlargeCenterPage:true, // الصورة المعروضة كبيرة الحجم والباقي اصغر انميشن حلو
       //       autoPlay: true, // تحريك الصور بشكل تلقائي
          //    autoPlayInterval:Duration(seconds: 4), // مدة محددة للتنقل بين الصفحات تلقايا
              pauseAutoPlayOnTouch:true, // عند الضغط على العنصر هل يتوقف ام لا يتوقف
              //reverse: true, // ترتيب الصور معكوس
              scrollDirection: Axis.horizontal, // نمط تدور الصور
        //      onPageChanged: (index, _) {
                // اندكس الصورة الظاهرة
            //    setState(() { t = index;}); }
                
                )
                ,
                              itemCount: ingredientsList.length ,
                              itemBuilder: (context , index){
return    
        Container(
         
    padding: EdgeInsets.all(5),
    
    
      decoration: BoxDecoration(
    
        color: Colors.orange.shade200,
    
        borderRadius: BorderRadius.only( topLeft: Radius.circular(20),bottomRight:Radius.circular(20) )),
    
      
    
      child:Column(
    
    mainAxisAlignment: MainAxisAlignment.center,
    
    crossAxisAlignment: CrossAxisAlignment.center,
    
        children: [
    
    
    
        Text( ingredientsList[index].text==null?"": ingredientsList[index].text.toString()
        ,style: TextStyle(color: Colors.white),), 
    
        Text(ingredientsList[index].quantity==null? "":"quantity="+ ingredientsList[index].quantity.toString()),
    
        Text(ingredientsList[index].measure==null?"":"measure="+ ingredientsList[index].measure.toString() ),
    
        Text(ingredientsList[index].food==null?"":"food="+ingredientsList[index].food.toString())    ,         
    
        Text(ingredientsList[index].weight==null?""  :"weight="+  ingredientsList[index].weight.toString()),
    Divider(thickness: 2, indent: 30 ,endIndent:30 , color: Colors.black,)

 
    
    
    
    
        ],
    
      )
    
      
    
      
    
      
    
       ,);
  



                            })
                            
                            
                        
                            ),


                        

    ],
  ),
      );
      
      
      
      
      
      }
    );
  }

}