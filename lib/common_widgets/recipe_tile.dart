import 'package:flutter/material.dart';

class RecipeTile extends StatelessWidget {
   RecipeTile({
    Key key,
    @required this.imageUrl,
    @required this.recipeName,
    this.recipeSource,

    
  }) : super(key: key);

  final String imageUrl;
  final String recipeName;
  final String recipeSource;


  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(8.0),
      elevation: 2.0,
      child: Container(
        decoration: BoxDecoration(
          color:Colors.white,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8.0),
                  topRight: Radius.circular(8.0),
                ),
                child: FadeInImage(
placeholder: AssetImage("image/back.png"),
                  image : NetworkImage(

                    imageUrl,

                  
                  ),
                    fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    recipeName,
                    style: TextStyle(
                      fontSize: 16.0,
                      //color: Colors.black, This will be dynamic instead of hard coded
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 8.0),
         recipeSource==null?Container():Text(
                    'Source: $recipeSource',
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.grey[500], //made this little brighter
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 8.0),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
