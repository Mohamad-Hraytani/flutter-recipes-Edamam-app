//import '../Sqlmodel.dart';



import 'Sqlmodel.dart';

class recipemodel implements Sqmodel {
String lable;
String image;
int id;

  recipemodel({this.lable,this.image , this.id});

  @override
  Map<String, dynamic> tomap() {
    return {'lable': this.lable, 'image': this.image,'id':this.id };
  }

  recipemodel.fromMap(Map<String, dynamic> map) {
    this.lable = map['lable'];
    this.image = map['image'];
    this.id = map['id'];
  }

  @override
  String tabel() {
    return 'recipe';
  }

  @override
  int getid() {
    return this.id;
  }

String getlable(){

return this.lable;

}
  @override
  String getnamedb() {
    return 'recipe_db';
  }


}
