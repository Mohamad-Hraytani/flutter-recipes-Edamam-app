import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutterrecipe/helpers/recipe.dart';

import 'package:flutterrecipe/screens/home_screen.dart';
import 'package:provider/provider.dart';




import 'Sql1.dart';
import 'Sqlmodel.dart';


import 'mySqdb.dart';

class SqlFavorite extends StatefulWidget {
  @override
  _SqlFavoriteState createState() => _SqlFavoriteState();
}

class _SqlFavoriteState extends State<SqlFavorite> {
  

  @override
  Widget build(BuildContext context) {
    
    return Consumer<mySqdb>(builder: (ctx , cur , _){

      return Scaffold(
        floatingActionButton: FloatingActionButton(
backgroundColor: Colors.orange,
child: Icon(Icons.home),
          onPressed: (){


   

Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=> HomeScreen()));


 
          },
        ),
        body: Container(
          child: FutureBuilder(
              future: Provider.of<mySqdb>(context,listen: false).getAll('recipe', 'recipe_db'),
              builder:
                  (BuildContext context, AsyncSnapshot<List<Sqmodel>> snapshot) {
                print(snapshot.data);

                switch (snapshot.connectionState) {
              
                  case ConnectionState.active:
                  case ConnectionState.waiting:
                    return Center(child: CircularProgressIndicator());

                  case ConnectionState.none:
                    return Center(child: Text('eror'));

                  case ConnectionState.done: 
                    if (snapshot
                        .hasError) 
                      return Center(child: Text(snapshot.error.toString()));

                    if (!snapshot.hasData)
                      return Center(child: Text('no data'));
                    return n(context, snapshot.data.cast(), cur);
                    break;
                  default:
                    return Center(child: Text('no conn'));
                    break;
                }
              }),
        ),
      );}
    );
  }

  Widget n(BuildContext context, List<recipemodel> recipes ,mySqdb cur) {

    return Consumer<Recipe>(
      builder:  (ctx, currentitem, _){
      return ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (BuildContext context, int position) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

Dismissible(
 key: UniqueKey(),
                          onDismissed: (DismissDirection inm)async {
currentitem.setrecipelistbymodel(currentitem.recipes.where((element) => element.label==recipes[position].lable).first,"1");
await cur.delete(recipemodel(id: recipes[position].id, lable: recipes[position].lable,image: recipes[position].image), );

                           },
                             background: Container(
                            color: Colors.red,
                            alignment: Alignment.centerLeft,
                            child: Icon(Icons.delete),
                          ),
  child:
  Row(
    children: [
      Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(
                                    width: 3,
                                    color: Colors.orange,
                                    style: BorderStyle.solid)),
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: ClipRRect(
                              borderRadius: BorderRadius.all(Radius.circular(30)),
                              child: Image.network(recipes[position].image,alignment: Alignment.center,height: 200,fit: BoxFit.cover,scale: 1,)
                            
                            ),
                          ),

  Container(
                        width:MediaQuery.of(context).size.width * 0.5,
                        
                          child: ListTile(
                            title: Text('${recipes[position].lable}'),
                           
                      
                            ),
                          ),
                      

    ],
  ),

                      ),
            ],
          );

     
        },
      );}
    );
  }
}