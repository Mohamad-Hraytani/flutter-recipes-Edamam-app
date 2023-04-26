import 'package:flutter/material.dart';
import 'package:flutterrecipe/helpers/recipe.dart';
import 'package:flutterrecipe/screens/Search.dart';
import 'package:provider/provider.dart';

import 'home_screen.dart';

class Filters extends StatefulWidget {


  @override
  State<Filters> createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
    int value1=0;
    int value2=1;
      int value3=2;
        int value4=3;
          int value5=4;
             int value6=5;

  int value11=0;
    int value22=1;
      int value33=2;
        int value44=3;
          int value55=4;
             int value66=5;


            int groupValue_radio_diet=6;
             int groupValue_radio_mealType=6;
TextEditingController co1 ; 
TextEditingController co2;



  @override
  Widget build(BuildContext context) {
var size = MediaQuery.of(context).size;
    return Scaffold(
      
floatingActionButton: FloatingActionButton(

  
      backgroundColor:
         Colors.orange,
     
      
    onPressed: (){
  Provider.of<Recipe>(context,listen: false).recipesSearch.clear();
  Provider.of<Recipe>(context,listen: false).getRecipesSearch();
 // then((value) => showSearch(context: context, delegate: Se()));
Navigator.of(context).pop();

  
  }, child: Text("Start")

 ),






      body:
    
  SingleChildScrollView(
    child: Container(

  
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              
SizedBox(height: 20,),
Container(
  decoration: BoxDecoration(
borderRadius: BorderRadius.circular(20),
color: Colors.orange,
  ),

height: 60,
  width: 200,
  child: Center(child: Text("Filtering", style: TextStyle(fontSize: 40,color: Colors.white),))  ,
),
SizedBox(height: 5,),
Container(
                      margin: EdgeInsets.symmetric(horizontal: size.height / 18),
                      width: size.width * 1.2,
                      color: Colors.black,
                      height:1,
                    ),
 Container(
  alignment: Alignment.center,
  width: 100,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
  color: Colors.orange.shade300
  ),
 child: Text("Diet", style:TextStyle(fontSize: 35),)),
             

Container(

  decoration: BoxDecoration(
    boxShadow: [BoxShadow(color: Colors.orange.shade100,offset: Offset(2,10))],
borderRadius: BorderRadius.all(Radius.circular(20)),
color: Colors.white,
  gradient: LinearGradient(colors: [Colors.orange.shade200 , Colors.white],begin: Alignment.bottomCenter , end: Alignment.topCenter ,stops: [0, 1]  )
  ),
  
  
  child:Column(children: [
 Row(
mainAxisAlignment: MainAxisAlignment.spaceAround,
crossAxisAlignment: CrossAxisAlignment.center,
children: [
Container(
    width:size.width *(1/3) ,
    child: 
radio_diet('balanced', value1)),
 Container(
    width:size.width *(1/3) ,
    child: radio_diet('high-fiber', value2)),
    Container(
      width:size.width *(1/3) ,
      child: radio_diet('high-protein', value3))             
],
 )      ,     
 Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
crossAxisAlignment: CrossAxisAlignment.center,
children: [
Container(
      width:size.width *(1/3) ,
    child:   radio_diet('low-carb', value4),),
 Container(
    width:size.width *(1/3) ,
    child: radio_diet('low-fat', value5),),
    Container(
      width:size.width *(1/3) ,
    child:    radio_diet('low-sodium', value6))],)





],) ),




 SizedBox(height: 20,),
      Container(
                      margin: EdgeInsets.symmetric(horizontal: size.height / 18),
                      width: size.width * 1.2,
                      color: Colors.black,
                      height:1,
                    ), 
SizedBox(height: 20,),
               


    
Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
Row(
  children: [
        dishType(context),
         Stack(
          alignment: Alignment.center,
          children:[
Container(
    height: 25,
            width: 100,
             decoration: BoxDecoration(
              
  gradient: LinearGradient(colors: [Colors.orange.shade200 , Colors.white],begin: Alignment.bottomCenter , end: Alignment.topCenter ,stops: [0, 1]  ),
              shape: BoxShape.rectangle),),
          Container(
            height: 50,
            width: 50,
             decoration: BoxDecoration(
              
  gradient: LinearGradient(colors: [Colors.orange.shade200 , Colors.white],begin: Alignment.bottomCenter , end: Alignment.topCenter ,stops: [0, 1]  ),
              shape: BoxShape.circle),), 
          Text('dishType',style: TextStyle(fontSize: 25)),

         ])
  ],
),

Row(
    children: [
          cuisineType(context),


Stack(
    alignment: Alignment.center,
  children: [

    Container(
    height: 25,
    width: 125,
             decoration: BoxDecoration(
              
  gradient: LinearGradient(colors: [Colors.orange.shade200 , Colors.white],begin: Alignment.bottomCenter , end: Alignment.topCenter ,stops: [0, 1]  ),
              shape: BoxShape.rectangle),),

Container(
    height: 50,
            width: 50,
             decoration: BoxDecoration(
              
  gradient: LinearGradient(colors: [Colors.orange.shade200 , Colors.white],begin: Alignment.bottomCenter , end: Alignment.topCenter ,stops: [0, 1]  ),
              shape: BoxShape.circle),),



 Text('CuisineType',style: TextStyle(fontSize: 23))

],)

         
    ],
) 
]
),
Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
          health(context),
         Stack(
          
            alignment: Alignment.center,
          children: [
Container(
    height: 25,
            width: 100,
             decoration: BoxDecoration(
              
  gradient: LinearGradient(colors: [Colors.orange.shade200 , Colors.white],begin: Alignment.bottomCenter , end: Alignment.topCenter ,stops: [0, 1]  ),
              shape: BoxShape.rectangle),),

Container(
    height: 50,
            width: 50,
             decoration: BoxDecoration(
              
  gradient: LinearGradient(colors: [Colors.orange.shade200 , Colors.white],begin: Alignment.bottomCenter , end: Alignment.topCenter ,stops: [0, 1]  ),
              shape: BoxShape.circle),),



 Text('Health',style: TextStyle(fontSize: 25))

],)
    ],
), 
SizedBox(height: 20,),
               
	  Container(
                      margin: EdgeInsets.symmetric(horizontal: size.height / 18),
                      width: size.width * 1.2,
                      color: Colors.black,
                      height:1,
                    ),
                       Container(
                         alignment: Alignment.center,
  width: 200,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
  color: Colors.orange.shade300
  ),
                        
                        
                        child: Text("MealType", style:TextStyle(fontSize: 35),)),

Container(
  
  
  decoration: BoxDecoration(
    boxShadow: [BoxShadow(color: Colors.orange.shade100,offset: Offset(2,10))],
borderRadius: BorderRadius.all(Radius.circular(20)),
color: Colors.white,
  gradient: LinearGradient(colors: [Colors.orange.shade200 , Colors.white],begin: Alignment.bottomCenter , end: Alignment.topCenter ,stops: [0, 1]  )
  ),
  
  
  
  child: Column(children: [
Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
crossAxisAlignment: CrossAxisAlignment.center,
children: [
Container(

    width:size.width *(1/3) ,
    child: 
radio_mealType('Breakfast', value11)),
 Container(

    width:size.width *(1/3) ,
    child: radio_mealType('Dinner', value22)),
    Container(

      width:size.width *(1/3) ,
      child: radio_mealType('Lunch', value33))             
],
 )      ,     
 Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
crossAxisAlignment: CrossAxisAlignment.center,
children: [
Container(
    padding: EdgeInsets.symmetric(horizontal: size.width * 0.09),
      width:size.width *(1/2) ,
    child:   radio_mealType('Snack', value44),),
 Container(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.09),
    width:size.width *(1/2) ,
    child: radio_mealType('fatlow', value55),),
],) 



],),),


SizedBox(height: 20,),
Column(children: [
TextField( 
    keyboardType: TextInputType.number,
  
            
    decoration: new InputDecoration(
 border: OutlineInputBorder(
  borderRadius:BorderRadius.only(
    topRight:Radius.circular(50) ,bottomLeft:Radius.circular(75) ,bottomRight: Radius.circular(50))),

    
          labelText: "calories",       

         fillColor:Colors.orange.shade100,
          filled : true,         
          contentPadding: EdgeInsets.all(5)
          ),            
    controller: co1,            
            onChanged: (valuee){

                     Provider.of<Recipe>(context,listen: false).setcalories("&calories=${valuee.toString()}");
            },
  ),

TextField(
    
    keyboardType: TextInputType.number, 

             
    decoration: new InputDecoration(
 border: OutlineInputBorder(
  borderRadius:BorderRadius.only(topRight:Radius.circular(50) 
  ,topLeft:Radius.circular(75) ,bottomRight: Radius.circular(50))),
hoverColor: Colors.orange.shade100,

          labelText: "ingr",           
          fillColor:Colors.orange.shade100,
          filled : true,            
          contentPadding: EdgeInsets.all(5)
          ),            
    controller: co2,            
            onChanged: (valuee){

          Provider.of<Recipe>(context,listen: false).setingr("&ingr=${valuee.toString()}");
            },  
  ),

],)


          ],)
          
          
          ,),
  ),
 
    
    
    
    );
  }

  Widget radio_diet(String type , val){
    var size = MediaQuery.of(context).size;
return Column(
   mainAxisAlignment: MainAxisAlignment.center,
  crossAxisAlignment: CrossAxisAlignment.center, 

  children: [
RadioListTile(
  activeColor: Colors.orange,
   contentPadding: EdgeInsets.symmetric(horizontal: size.width *0.1),
  groupValue: groupValue_radio_diet,
  value: val, onChanged: (bo){

Provider.of<Recipe>(context,listen: false).dietMap.forEach((key, value) {
Provider.of<Recipe>(context,listen: false).dietMap[key]="";

     });
    Provider.of<Recipe>(context,listen: false).setdietMap(type);
    setState(() {
  groupValue_radio_diet=bo;
});},
),
Text(type ,textAlign: TextAlign.left,)

 ],);


  }
  Widget radio_mealType(String type , val){
    var size = MediaQuery.of(context).size;
return Column(
   mainAxisAlignment: MainAxisAlignment.center,
  crossAxisAlignment: CrossAxisAlignment.center, 
  children: [
RadioListTile(
  activeColor: Colors.orange,
   contentPadding: EdgeInsets.symmetric(horizontal: size.width *0.1),
  groupValue: groupValue_radio_mealType,
  value: val, onChanged: (bo){
Provider.of<Recipe>(context,listen: false).MealTypeMap.forEach((key, value) {
Provider.of<Recipe>(context,listen: false).MealTypeMap[key]="";

     });
    Provider.of<Recipe>(context,listen: false).setMealTypeMap(type);
    setState(() {
  groupValue_radio_mealType=bo;
});},
),
Text(type ,textAlign: TextAlign.left,)

 ],);


  }

Widget health(BuildContext context) { 
    return PopupMenuButton<healthpop>(itemBuilder: (context) { 
      return [
     
        PopupMenuItem<healthpop>(
          value: healthpop.alcohol_cocktail,
          child: Text('alcohol_cocktail'),

        ),
        PopupMenuItem<healthpop>(value: healthpop.alcohol_free, child: Text('alcohol_free') ,),
        PopupMenuItem<healthpop>(value: healthpop.celery_free, child: Text('celery_free')),
         PopupMenuItem<healthpop>(value: healthpop.crustacean_free, child: Text('crustacean_free')),
          PopupMenuItem<healthpop>(value: healthpop.dairy_free, child: Text('dairy_free')),
           PopupMenuItem<healthpop>(value: healthpop.DASHegg_free, child: Text('DASHegg_free')),
            PopupMenuItem<healthpop>(value: healthpop.fish_free, child: Text('fish_free')),
             PopupMenuItem<healthpop>(value: healthpop.fodmap_free, child: Text('fodmap_free')),
              PopupMenuItem<healthpop>(value: healthpop.gluten_free, child: Text('gluten_free')),
               PopupMenuItem<healthpop>(value: healthpop.immuno_supportive, child: Text('immuno_supportive')),
                PopupMenuItem<healthpop>(value: healthpop.keto_friendly, child: Text('keto_friendly')),

                 PopupMenuItem<healthpop>(value: healthpop.kidney_friendly, child: Text('kidney_friendly')),
                  PopupMenuItem<healthpop>(value: healthpop.kosher, child: Text('kosher')),
                   PopupMenuItem<healthpop>(value: healthpop.low_fat_abs, child: Text('low_fat_abs')),
                    PopupMenuItem<healthpop>(value: healthpop.low_sugar, child: Text('low_sugar')),
                     PopupMenuItem<healthpop>(value: healthpop.lupine_free, child: Text('lupine_free')),
                      PopupMenuItem<healthpop>(value: healthpop.Mediterranean, child: Text('Mediterranean')),
                         
                       PopupMenuItem<healthpop>(value: healthpop.mollusk_free, child: Text('mollusk_free')),
                        PopupMenuItem<healthpop>(value: healthpop.mustard_free, child: Text('mustard_free')),
                         PopupMenuItem<healthpop>(value: healthpop.no_oil_added, child: Text('no_oil_added')),
                          PopupMenuItem<healthpop>(value: healthpop.paleo, child: Text('paleo')),
                           PopupMenuItem<healthpop>(value: healthpop.peanut_free, child: Text('peanut_free')),
                            PopupMenuItem<healthpop>(value: healthpop.pescatarian, child: Text('pescatarian')),
                             PopupMenuItem<healthpop>(value: healthpop.pork_free, child: Text('pork_free')),
                              PopupMenuItem<healthpop>(value: healthpop.red_meat_free, child: Text('red_meat_free')),
                               PopupMenuItem<healthpop>(value: healthpop.sesame_free, child: Text('sesame_free')),
                                PopupMenuItem<healthpop>(value: healthpop.shellfish_free, child: Text('shellfish_free')),
                                 PopupMenuItem<healthpop>(value: healthpop.soy_free, child: Text('soy_free')),
                                  PopupMenuItem<healthpop>(value: healthpop.sugar_conscious, child: Text('sugar_conscious')),
                                   PopupMenuItem<healthpop>(value: healthpop.sulfite_free, child: Text('sulfite_free')),
                                    PopupMenuItem<healthpop>(value: healthpop.tree_nut_free, child: Text('tree_nut_free')),
                                     PopupMenuItem<healthpop>(value: healthpop.vegan, child: Text('vegan')),
                                      PopupMenuItem<healthpop>(value: healthpop.vegetarian, child: Text('vegetarian')),
                                       PopupMenuItem<healthpop>(value: healthpop.wheat_free, child: Text('wheat_free')),
      ];
    },
    color: Colors.orange.shade200,

    onSelected:(healthpop menu) 
    {
      
Provider.of<Recipe>(context,listen: false).healthMap.forEach((key, value) {
Provider.of<Recipe>(context,listen: false).healthMap[key]="";

     });

switch(menu)
{
  case healthpop.alcohol_cocktail:
        Provider.of<Recipe>(context,listen: false).sethealthMap("alcohol-cocktail");
    break;
  case healthpop.alcohol_free:
       Provider.of<Recipe>(context,listen: false).sethealthMap("alcohol-free");
    break;
  case healthpop.celery_free:
      Provider.of<Recipe>(context,listen: false).sethealthMap("celery-free");
    break;
  case healthpop.crustacean_free:
     Provider.of<Recipe>(context,listen: false).sethealthMap("crustacean-free");
    break;
  case healthpop.dairy_free:
     Provider.of<Recipe>(context,listen: false).sethealthMap("dairy-free");
    break;
  case healthpop.DASHegg_free:
       Provider.of<Recipe>(context,listen: false).sethealthMap("DASHegg-free");
    break;
  case healthpop.fish_free:
     Provider.of<Recipe>(context,listen: false).sethealthMap("fish-free");
    break;
  case healthpop.fodmap_free:
        Provider.of<Recipe>(context,listen: false).sethealthMap("fodmap-free");
    break;
  case healthpop.gluten_free:
       Provider.of<Recipe>(context,listen: false).sethealthMap("gluten-free");
    break;
  case healthpop.immuno_supportive:
       Provider.of<Recipe>(context,listen: false).sethealthMap("immuno-supportive");
    break;
  case healthpop.keto_friendly:
       Provider.of<Recipe>(context,listen: false).sethealthMap("keto-friendly");
    break;
  case healthpop.kidney_friendly:
     Provider.of<Recipe>(context,listen: false).sethealthMap("kidney-friendly");
    break;
  case healthpop.kosher:
       Provider.of<Recipe>(context,listen: false).sethealthMap("kosher");
    break;
  case healthpop.low_fat_abs:
      Provider.of<Recipe>(context,listen: false).sethealthMap("low-fat-abs");
    break;
  case healthpop.low_potassium:
     Provider.of<Recipe>(context,listen: false).sethealthMap("low-potassium");
    break;
  case healthpop.low_sugar:
        Provider.of<Recipe>(context,listen: false).sethealthMap("low-sugar");
    break;
  case healthpop.lupine_free:
       Provider.of<Recipe>(context,listen: false).sethealthMap("tlupine-freeype");
    break;
  case healthpop.Mediterranean:
       Provider.of<Recipe>(context,listen: false).sethealthMap("Mediterranean");
    break;
  case healthpop.mollusk_free:
       Provider.of<Recipe>(context,listen: false).sethealthMap("mollusk-free");
    break;
  case healthpop.mustard_free:
     Provider.of<Recipe>(context,listen: false).sethealthMap("mustard-free");
    break;
  case healthpop.no_oil_added:
       Provider.of<Recipe>(context,listen: false).sethealthMap("no-oil-added");
    break;
  case healthpop.paleo:
      Provider.of<Recipe>(context,listen: false).sethealthMap("paleo");
    break;
  case healthpop.peanut_free:
      Provider.of<Recipe>(context,listen: false).sethealthMap("typeanut-freepe");
    break;
  case healthpop.pescatarian:
        Provider.of<Recipe>(context,listen: false).sethealthMap("pescatarian");
    break;
  case healthpop.pork_free:
    Provider.of<Recipe>(context,listen: false).sethealthMap("pork-free");
    break;
  case healthpop.red_meat_free:
       Provider.of<Recipe>(context,listen: false).sethealthMap("red-meat-free");
    break;
  case healthpop.sesame_free:
      Provider.of<Recipe>(context,listen: false).sethealthMap("sesame-free");
    break;
  case healthpop.shellfish_free:
     Provider.of<Recipe>(context,listen: false).sethealthMap("shellfish-free");
    break;
  case healthpop.soy_free:
     Provider.of<Recipe>(context,listen: false).sethealthMap("soy-free");
    break;
  case healthpop.sugar_conscious:
      Provider.of<Recipe>(context,listen: false).sethealthMap("sugar-conscious");
    break;
  case healthpop.sulfite_free:
     Provider.of<Recipe>(context,listen: false).sethealthMap("sulfite-free");
    break;
  case healthpop.tree_nut_free:
       Provider.of<Recipe>(context,listen: false).sethealthMap("tree-nut-free");
    break;
  case healthpop.vegan:
       Provider.of<Recipe>(context,listen: false).sethealthMap("vegan");
    break;
  case healthpop.vegetarian:
     Provider.of<Recipe>(context,listen: false).sethealthMap("vegetarian");
    break;
  case healthpop.wheat_free:
    Provider.of<Recipe>(context,listen: false).sethealthMap("wheat-free");
    break;
} }  ); 

}

Widget cuisineType(BuildContext context) { 
    return PopupMenuButton<cuisineTypepop>(itemBuilder: (context) { 
      return [

        PopupMenuItem<cuisineTypepop>(
          value: cuisineTypepop.American,
          child: Text('American'),
        ),
        PopupMenuItem<cuisineTypepop>(value: cuisineTypepop.Asian, child: Text('Asian')),
        PopupMenuItem<cuisineTypepop>(value: cuisineTypepop.British, child: Text('British')),
         PopupMenuItem<cuisineTypepop>(value: cuisineTypepop.Central_Europe, child: Text('Central_Europe')),
          PopupMenuItem<cuisineTypepop>(value: cuisineTypepop.Chinese, child: Text('Chinese')),
           PopupMenuItem<cuisineTypepop>(value: cuisineTypepop.Eastern_Europe, child: Text('Eastern_Europe')),
            PopupMenuItem<cuisineTypepop>(value: cuisineTypepop.French, child: Text('French')),
             PopupMenuItem<cuisineTypepop>(value: cuisineTypepop.Indian, child: Text('Indian')),
              PopupMenuItem<cuisineTypepop>(value: cuisineTypepop.Italian, child: Text('glutenItalian_free')),
               PopupMenuItem<cuisineTypepop>(value: cuisineTypepop.Japanese, child: Text('Japanese')),
                PopupMenuItem<cuisineTypepop>(value: cuisineTypepop.Kosher, child: Text('Kosher')),

                 PopupMenuItem<cuisineTypepop>(value: cuisineTypepop.Mediterranean, child: Text('Mediterranean')),
                  PopupMenuItem<cuisineTypepop>(value: cuisineTypepop.Mexican, child: Text('Mexican')),
                   PopupMenuItem<cuisineTypepop>(value: cuisineTypepop.Middle_Eastern, child: Text('Middle_Eastern')),
                    PopupMenuItem<cuisineTypepop>(value: cuisineTypepop.Nordic, child: Text('Nordic')),
                     PopupMenuItem<cuisineTypepop>(value: cuisineTypepop.South_American, child: Text('South_American')),
                      PopupMenuItem<cuisineTypepop>(value: cuisineTypepop.South_East_Asian, child: Text('South_East_Asian')),
                     
      ];
    },
    color: Colors.orange.shade200,
    onSelected:(cuisineTypepop menu) 
    {
      Provider.of<Recipe>(context,listen: false).CuisineTypeMap.forEach((key, value) {
Provider.of<Recipe>(context,listen: false).CuisineTypeMap[key]="";

     });
switch(menu)
{ 
  case cuisineTypepop.American:
Provider.of<Recipe>(context,listen: false).setCuisineTypeMap("American");
    break;
  case cuisineTypepop.Asian:
Provider.of<Recipe>(context,listen: false).setCuisineTypeMap("Asian");
    break;
  case cuisineTypepop.British:
Provider.of<Recipe>(context,listen: false).setCuisineTypeMap("British");
    break;
  case cuisineTypepop.Caribbean:
Provider.of<Recipe>(context,listen: false).setCuisineTypeMap("Caribbean");
    break;
  case cuisineTypepop.Central_Europe:
Provider.of<Recipe>(context,listen: false).setCuisineTypeMap("Central-Europe");
    break;
  case cuisineTypepop.Chinese:
 Provider.of<Recipe>(context,listen: false).setCuisineTypeMap("Chinese");
    break;
  case cuisineTypepop.Eastern_Europe:
   Provider.of<Recipe>(context,listen: false).setCuisineTypeMap("Eastern-Europe");
    break;
  case cuisineTypepop.French:
  Provider.of<Recipe>(context,listen: false).setCuisineTypeMap("French");
    break;
  case cuisineTypepop.Indian:
Provider.of<Recipe>(context,listen: false).setCuisineTypeMap("Indian");
    break;
  case cuisineTypepop.Italian:
   Provider.of<Recipe>(context,listen: false).setCuisineTypeMap("Italian");
    break;
  case cuisineTypepop.Japanese:
Provider.of<Recipe>(context,listen: false).setCuisineTypeMap("Japanese");
    break;
  case cuisineTypepop.Kosher:
  Provider.of<Recipe>(context,listen: false).setCuisineTypeMap("Kosher");
    break;
  case cuisineTypepop.Mediterranean:
 Provider.of<Recipe>(context,listen: false).setCuisineTypeMap("Mediterranean");
    break;
  case cuisineTypepop.Mexican:
 Provider.of<Recipe>(context,listen: false).setCuisineTypeMap("Mexican");
    break;
  case cuisineTypepop.Middle_Eastern:
Provider.of<Recipe>(context,listen: false).setCuisineTypeMap("Middle-Eastern");
    break;
  case cuisineTypepop.Nordic:
Provider.of<Recipe>(context,listen: false).setCuisineTypeMap("Nordic");
    break;
  case cuisineTypepop.South_American:
Provider.of<Recipe>(context,listen: false).setCuisineTypeMap("South-American");
    break;
  case cuisineTypepop.South_East_Asian:
  Provider.of<Recipe>(context,listen: false).setCuisineTypeMap("South-East-Asian");
    break;
} }  ); 

}



Widget dishType(BuildContext context) { 
    return PopupMenuButton<dishTypepop>(itemBuilder: (context) { 
      return [

        PopupMenuItem<dishTypepop>(value: dishTypepop.Biscuits_and_cookies, child: Text('Biscuits_and_cookies')),
        PopupMenuItem<dishTypepop>(value: dishTypepop.Bread, child: Text('Bread')),
         PopupMenuItem<dishTypepop>(value: dishTypepop.Cereals, child: Text('Cereals')),
          PopupMenuItem<dishTypepop>(value: dishTypepop.Condiments_and_sauces, child: Text('Condiments_and_sauces')),
           PopupMenuItem<dishTypepop>(value: dishTypepop.Desserts, child: Text('Desserts')),
            PopupMenuItem<dishTypepop>(value: dishTypepop.Drinks, child: Text('Drinks')),
             PopupMenuItem<dishTypepop>(value: dishTypepop.Main_course, child: Text('Main_course')),
              PopupMenuItem<dishTypepop>(value: dishTypepop.Pancake, child: Text('Pancake')),
               PopupMenuItem<dishTypepop>(value: dishTypepop.Preps, child: Text('Preps')),
                PopupMenuItem<dishTypepop>(value: dishTypepop.Preserve, child: Text('Preserve')),

                 PopupMenuItem<dishTypepop>(value: dishTypepop.Salad, child: Text('Salad')),
                  PopupMenuItem<dishTypepop>(value: dishTypepop.Sandwiches, child: Text('Sandwiches')),
                   PopupMenuItem<dishTypepop>(value: dishTypepop.Side_dish, child: Text('Side_dish')),
                    PopupMenuItem<dishTypepop>(value: dishTypepop.Soup, child: Text('Soup')),
                     PopupMenuItem<dishTypepop>(value: dishTypepop.Starter, child: Text('Starter')),
                      PopupMenuItem<dishTypepop>(value: dishTypepop.Sweets, child: Text('Sweets')),
                         
                         
      ];
    },
    color: Colors.orange.shade200,
    onSelected:(dishTypepop menu) 
    {
Provider.of<Recipe>(context,listen: false).dishTypepopMap.forEach((key, value) {
Provider.of<Recipe>(context,listen: false).dishTypepopMap[key]="";

     });
switch(menu)
{
  
  case dishTypepop.Biscuits_and_cookies:
  Provider.of<Recipe>(context,listen: false).setdishTypepopMap("Biscuits-and-cookies");
    break;
  case dishTypepop.Bread:
   Provider.of<Recipe>(context,listen: false).setdishTypepopMap("Bread");
    break;
  case dishTypepop.Cereals:
   Provider.of<Recipe>(context,listen: false).setdishTypepopMap("Cereals");
    break;
  case dishTypepop.Condiments_and_sauces:
Provider.of<Recipe>(context,listen: false).setdishTypepopMap("Condiments-and-sauces");
    break;
  case dishTypepop.Desserts:
Provider.of<Recipe>(context,listen: false).setdishTypepopMap("Desserts");
    break;
  case dishTypepop.Drinks:
Provider.of<Recipe>(context,listen: false).setdishTypepopMap("Drinks");
    break;
  case dishTypepop.Main_course:
   Provider.of<Recipe>(context,listen: false).setdishTypepopMap("Main-course");
    break;
  case dishTypepop.Pancake:
Provider.of<Recipe>(context,listen: false).setdishTypepopMap("Pancake");
    break;
  case dishTypepop.Preps:
  Provider.of<Recipe>(context,listen: false).setdishTypepopMap("Preps");
    break;
  case dishTypepop.Preserve:
Provider.of<Recipe>(context,listen: false).setdishTypepopMap("Preserve");
    break;
  case dishTypepop.Salad:
  Provider.of<Recipe>(context,listen: false).setdishTypepopMap("Salad");
    break;
  case dishTypepop.Sandwiches:
Provider.of<Recipe>(context,listen: false).setdishTypepopMap("Sandwiches");
    break;
  case dishTypepop.Side_dish:
Provider.of<Recipe>(context,listen: false).setdishTypepopMap("Side-dish");
    break;
  case dishTypepop.Soup:
Provider.of<Recipe>(context,listen: false).setdishTypepopMap("Soup");
    break;
  case dishTypepop.Starter:
Provider.of<Recipe>(context,listen: false).setdishTypepopMap("Starter");
    break;
  case dishTypepop.Sweets:
 Provider.of<Recipe>(context,listen: false).setdishTypepopMap("Sweets");
    break;
} }  ); 

}

}







enum healthpop {alcohol_cocktail,alcohol_free,celery_free,crustacean_free,dairy_free,DASHegg_free,fish_free,fodmap_free,gluten_free,immuno_supportive,keto_friendly,kidney_friendly,kosher,low_fat_abs,low_potassium,low_sugar,lupine_free,Mediterranean,mollusk_free,mustard_free,no_oil_added,paleo,peanut_free,pescatarian,pork_free,red_meat_free,sesame_free,shellfish_free,soy_free,sugar_conscious,sulfite_free,tree_nut_free,vegan,vegetarian,wheat_free
 } 

enum cuisineTypepop {American,Asian,British,Caribbean,Central_Europe,Chinese,Eastern_Europe,French,Indian,Italian,Japanese,Kosher,Mediterranean,Mexican,Middle_Eastern,Nordic,South_American,South_East_Asian, } 
 
enum dishTypepop {Biscuits_and_cookies,Bread,Cereals,Condiments_and_sauces,Desserts,Drinks,Main_course,Pancake,Preps,Preserve,Salad,Sandwiches,Side_dish,Soup,Starter,Sweets, } 


	