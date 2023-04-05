//import 'package:dynamic_theme/dynamic_theme.dart';
import 'dart:math';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutterrecipe/SQL/Sql1.dart';
import 'package:flutterrecipe/SQL/Sqlmodel.dart';
import 'package:flutterrecipe/SQL/mySqdb.dart';
import 'package:flutterrecipe/common_widgets/appbar_tiitle.dart';
import 'package:flutterrecipe/common_widgets/recipe_tile.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutterrecipe/helpers/recipe.dart';

import 'package:flutterrecipe/model/recipe_model.dart';
import 'package:provider/provider.dart';
import 'package:flutterrecipe/SQL/Sqltest.dart';
import 'Search.dart';
import 'details_screen.dart';
import 'filters.dart';
import 'package:share_plus/share_plus.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

List<RecipeModel> recipeList ;
List<Sqmodel> t;
  bool _loading = true;
 var id_item ;

  @override
  void initState() {
    super.initState();
  
    getRecipes();

  }

  getRecipes() async {
    mySqdb mo=new mySqdb();

var t= await mo.getAll("recipe", "recipe_db");


   if(Provider.of<Recipe>(context,listen: false).Fil=="with_out_Filter")
 { await Provider.of<Recipe>(context,listen: false).getRecipes();

//Provider.of<Recipe>(context,listen: false).recipesSearch = Provider.of<Recipe>(context,listen: false).recipes;
if(t.isNotEmpty)
{
var bol = Provider.of<Recipe>(context,listen: false).recipes.any((element) 
 => element.label== t.where((element1) => element1.getlable() == element.label).first.getlable());


if(bol){
 var q= Provider.of<Recipe>(context,listen: false).recipes.where((element) 
 => element.label== t.where((element1) => element1.getlable() == element.label).first.getlable()).first;

Provider.of<Recipe>(context,listen: false).setrecipelistbymodel(q, "2");
}}
    recipeList = Provider.of<Recipe>(context,listen: false).recipes;
       setState(() {
      _loading = false;
    }); 
   }
else
 {await Provider.of<Recipe>(context,listen: false).getRecipesSearchwithfilter();
    recipeList = Provider.of<Recipe>(context,listen: false).recipes;
     setState(() {
      _loading = false;
    }); }


  }

  Widget _buildInputField() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: GestureDetector(
        onTap: () => showSearch(context: context, delegate: Se()),
        child: Container(
          height: 45.0,
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            border: Border.all(color: Colors.grey[500], width: 1.5),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.search, color: Colors.grey[500]),
              SizedBox(width: 8.0),
              Text(
                'Search by food ingredient',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 16.0,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

 

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      //backgroundColor: Colors.white, ~dynamic
      appBar: AppBar(
      //  centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: AppBarTitle(),
        leadingWidth: 30,
     leading: IconButton(
      
      icon: Icon(Icons.favorite ,color: Colors.red,size: 40,), onPressed: (){

Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=> Sqltest()));


     }),
       
      ),
      body:_buildContent()
                  ,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        child: Icon(Icons.filter_alt_outlined),
      
      onPressed: (){
     Provider.of<Recipe>(context,listen: false).setStateFilter("withFilter");
        Provider.of<Recipe>(context,listen: false).recipes.clear();
Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=> Filters()));



      },
      ),
    );
  }







   _buildContent() {


    return Consumer<Recipe>(
      builder: (ctx, currentitem, _)
      {return SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

ElevatedButton(onPressed: (){

int y = Random().nextInt(99);

List randomList = Provider.of<Recipe>(context,listen: false).recipes;

Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=> DetailsScreen(randomList[y])));

}, child: Text("Choose a Random recipe")),

            _buildInputField(),

            SizedBox(height: 16.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.0),
              child: Text(
                "Today's Special Dishes",
                style: TextStyle(
                  fontSize: 18.0,
                  //color: Colors.black, ~dynamic
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            _loading == true
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : 
                  
                    
                    
                    
                    
                     StaggeredGridView.countBuilder(
                        physics: ScrollPhysics(
                          parent: BouncingScrollPhysics(),
                        ),
                        crossAxisCount: 4,
                        shrinkWrap: true,
                        itemCount: currentitem.recipes.length,
                        itemBuilder: (context, index) {
                          return Consumer<mySqdb>(builder: (ctx , curt , _)
                            {return Column(
                              children:[ GestureDetector(

                                onTap: (){
Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=> DetailsScreen(currentitem.recipes[index])));

                                },
                                child: RecipeTile(
                                  imageUrl: currentitem.recipes[index].image,
                                  recipeName: currentitem.recipes[index].label,
                                  recipeSource: currentitem.recipes[index].source,
                                  
                        
                                ),
                              ),
                              Builder(builder: (BuildContext ctx){
                               return  Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                 children: [

 IconButton(
                                      
                                      icon: Icon(Icons.share,
                                    color:Colors.orange
                                    , 
                                     
                                     ), onPressed: (){

Share.share('check out my website ${currentitem.recipes[index].shareAs}', subject: '${currentitem.recipes[index].label}');



                                     }),

                                   IconButton(
                                      
                                      icon: Icon( currentitem.recipes[index].fav == "1"?Icons.favorite_border  :Icons.favorite,
                                    color: currentitem.recipes[index].fav == "1"? Colors.black :Colors.red
                                    , 
                                     
                                     ), onPressed: ()async{



if (currentitem.recipes[index].fav == "1")
  { 
    SharedPreferences prefs =await SharedPreferences.getInstance();
       int id =int.parse(prefs.getString("id")??"0");
       int newid = id+1;
       prefs.setString('id', newid.toString());


    currentitem.setrecipelist(index, "2");
   await curt.insert(recipemodel( id: id, lable: currentitem.recipes[index].label,image: currentitem.recipes[index].image), );
   
   }
else {
mySqdb mo1=new mySqdb();
var t1= await mo1.getAll("recipe", "recipe_db");
id_item = t1.where((element) => currentitem.recipes[index].label==element.getlable()).first.getid();
currentitem.setrecipelist(index, "1");
curt.delete(recipemodel(id:id_item, lable: currentitem.recipes[index].label,image: currentitem.recipes[index].image), );
}

                                     }),
                                 ],
                               );}
                              )
                              
                              ]
                            );}
                          );
                        },
                        staggeredTileBuilder: (int index) =>
                            new StaggeredTile.fit(2),
                        mainAxisSpacing: 16.0,
                        crossAxisSpacing: 16.0,
                     )
                        ]),
                      );
                      
            
          
        
      
  
  
      }
      );
      }
}