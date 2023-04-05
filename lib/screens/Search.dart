
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutterrecipe/SQL/Sql1.dart';
import 'package:flutterrecipe/SQL/mySqdb.dart';
import 'package:flutterrecipe/common_widgets/recipe_tile.dart';
import 'package:flutterrecipe/helpers/recipe.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'details_screen.dart';


class Se extends SearchDelegate {


/* void gotoPost(List<Artic> item ,  int a , BuildContext context) {
    
                    

print( item[a].author);
Artic b = item[a];
    Navigator.push(context,
        new MaterialPageRoute(builder: (BuildContext context) =>  Sl(b)));
  } */


   @override
  List<Widget> buildActions(BuildContext context) {
   return[Icon(Icons.search)];
  }

  @override
  Widget buildLeading(BuildContext context) {
  
   return null;
   
  }

  @override
  Widget buildResults(BuildContext context) 
  {


Provider.of<Recipe>(context,listen: false).getRecipesSearch(query);
Provider.of<mySqdb>(context,listen: false).sett(query); 
  return _buildContent(query,context);


  }

  @override
  Widget buildSuggestions(BuildContext context) {
 

Provider.of<mySqdb>(context,listen: false).gett();

return  


 ListView.builder(
  itemCount: Provider.of<mySqdb>(context,listen: false).y.length == 0? 1: Provider.of<mySqdb>(context,listen: false).y.length ,

  itemBuilder: (context , i ){
    if(Provider.of<mySqdb>(context,listen: false).y.isEmpty)
    return Text("no Suggestions");
    else
return GestureDetector(
  onTap: (){
query=Provider.of<mySqdb>(context,listen: false).y[i];
showResults(context);
  }
  ,child: Text(Provider.of<mySqdb>(context,listen: false).y[i],style: TextStyle(fontSize: 30),));


  }




);
  }





_buildContent(String searchword, BuildContext ctx1) {
 





//getlist(searchword, ctx1);
 return
     Consumer<Recipe>(
      builder: (ctx1, currentitem, _)
      {
      
        
        return SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [




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
       
                    
                     StaggeredGridView.countBuilder(
                        physics: ScrollPhysics(
                          parent: BouncingScrollPhysics(),
                        ),
                        crossAxisCount: 4,
                        shrinkWrap: true,
                        itemCount: currentitem.recipesSearch.length,
                        itemBuilder: (context, index) {
                          return Consumer<mySqdb>(builder: (ctx , curt , _)
                            {return Column(
                              children:[ GestureDetector(

                                onTap: (){
Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=> DetailsScreen(currentitem.recipesSearch[index])));

                                },
                                child: RecipeTile(
                                  imageUrl: currentitem.recipesSearch[index].image,
                                  recipeName: currentitem.recipesSearch[index].label,
                                  recipeSource: currentitem.recipesSearch[index].source,
                                  
                        
                                ),
                              ),
                              Builder(builder: (BuildContext ctx){
                               return  Row(
                                 children: [

 IconButton(
                                      
                                      icon: Icon(Icons.share,
                                    color:Colors.red
                                    , 
                                     
                                     ), onPressed: (){

Share.share('check out my website https://example.com', subject: 'Look what I made!');



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


