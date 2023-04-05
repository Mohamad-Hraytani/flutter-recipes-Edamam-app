
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

                                   IconButton(
                                      
                                      icon: Icon(Icons.favorite,
                                    color: currentitem.recipesSearch[index].fav == "1"? Colors.white :Colors.red
                                    , 
                                     
                                     ), onPressed: ()async{



if (currentitem.recipesSearch[index].fav == "1")
  { 
    SharedPreferences prefs =await SharedPreferences.getInstance();
       int id =int.parse(prefs.getString("id")??"0");
       int newid = id+1;
       prefs.setString('id', newid.toString());


    currentitem.setrecipelist(index, "2");
   await curt.insert(recipemodel( id: id, lable: currentitem.recipesSearch[index].label,image: currentitem.recipesSearch[index].image), );
   
   }
else {
mySqdb mo1=new mySqdb();
var t1= await mo1.getAll("recipe", "recipe_db");
var id_item = t1.where((element) => currentitem.recipesSearch[index].label==element.getlable()).first.getid();
currentitem.setrecipelist(index, "1");
curt.delete(recipemodel(id:id_item, lable: currentitem.recipesSearch[index].label,image: currentitem.recipesSearch[index].image), );
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



  /* {

  }

  @override
  Widget buildSuggestions(BuildContext context1) {


var items =  ListPost.where((element) => 
element.content ==null?false:element.content.allMatches(query).isNotEmpty?true:false ||
element.description ==null?false:element.description.contains(query)||
element.title == null?false:element.title.allMatches(query).isNotEmpty?true:false||
element.author == null?false :element.author.contains(query)).toList() ;




 return ListView.separated(
  itemCount:  query == ""? 1: items.length ,
  separatorBuilder: (context, index) => Divider(color: Colors.black,thickness: 1,),
  itemBuilder: (context , i ){

if (query == "")
 return Center(child: Text('Enter word')); 
else {
return GestureDetector(
  onTap: (){
query=items[i].author;
    showResults(context);
  },
  child: i ==  items.length?
                                // اذا وصل لقبل الاخير حط دائرة انتظار
                                 Center(child: CircularProgressIndicator())
                             
                            :
                                Container(
                                  height: 400,
                                  width: 400,
                                  decoration: BoxDecoration(

                                      /*  gradient: LinearGradient(
                                        colors: [Colors.purple, Colors.white]), */
                                      borderRadius: BorderRadius.circular(2)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                        children: [
                                          IconButton(
                                            onPressed: () {},
                                            icon: Icon(
                                              Icons.save,
                                              size: 25,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              PostHeaderSearchclass(Position: i,ListPostResult:items,),
                                              Container(
                                                height: 60,
                                                width: 60,
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Colors.blue, width: 4),
                                                    shape: BoxShape.circle,
                                                    image: DecorationImage(
                                                        image: NetworkImage(
                                                            items[i].urlToImage),
                                                        fit: BoxFit.cover)),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                      InkWell(
                                        onTap: () => {},
                                        child: Column(
                                          children: [
                                            Text(
                                              items[i].title,
                                              textAlign: TextAlign.left,
                                            ),
                                            // n
                                          ],
                                        ),
                                      ),
                                      if (items[i].urlToImage != null)
                                        InkWell(
                                          onTap: () => {

                                            gotoPost( items,i, context)
                                            },
                                          child: Container(
                                            decoration: BoxDecoration(
                                                gradient: LinearGradient(colors: [
                                                  Colors.yellow,
                                                  Colors.green
                                                ]),
                                                borderRadius:
                                                    BorderRadius.circular(2)),
                                            height: 200,
                                            width: 500,
                                            child: Image.network(
                                              items[i].urlToImage,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        )
                                      else
                                        SizedBox(
                                          height: 10,
                                        ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Row(
                                            children: [
                                              Text('Comment'),
                                              IconButton(
                                                onPressed: () {},
                                                icon: Icon(Icons.comment),
                                              ),
                                            ],
                                          ),
                                          IconButton(
                                              onPressed: () async {},
                                              icon: Icon(
                                                Icons.favorite,
                                                color: Colors.red,
                                                size: 35,
                                              )),
                                        ],
                                      ),
                                      Divider(color: Colors.black,thickness: 1,)
                                      /*  InkWell(
                                      onTap: () {},
                                      child: Container(
                                          height: 50,
                                          width: 100,
                                          decoration: BoxDecoration(
                                              color: Colors.green,
                                              borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(25),
                                                bottomRight: Radius.circular(25),
                                              ))),
                                    ) */
                                    ],
                                  )
                                 
)


);
}}

 );


} */
  

}

/* Text(items[i].author ==null? "****" : items[i].author,style: TextStyle(color:items[i].author==null?Colors.black:   items[i].author.contains(query)?  Colors.yellow :Colors.black), ),
   Text(items[i].title ==null? "****" :items[i].title,style: TextStyle(color:items[i].title==null?Colors.black:   items[i].title.contains(query)?  Colors.yellow :Colors.black),  ),
          Text(items[i].description==null? "*****" :items[i].description,style: TextStyle(color:items[i].description==null?Colors.black:   items[i].description.contains(query)?  Colors.yellow :Colors.black), ),
           Text(items[i].content ==null? "****" :items[i].content,style: TextStyle(color:items[i].content==null?Colors.black:   items[i].content.contains(query)?  Colors.yellow :Colors.black),  ), */
