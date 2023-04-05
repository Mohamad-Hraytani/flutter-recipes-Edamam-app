
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'Sqlmodel.dart';
import 'Sql1.dart';
//we well add the fild image and urland source to CREATE TABLE

class mySqdb extends ChangeNotifier {

List y  =[]; 

  Future<Database> recipedata() async {
    return openDatabase(
      join(await getDatabasesPath(), 'recipe_db.db'),
      onCreate: (db, version) {
        
        return db.execute(
            'CREATE TABLE recipe (id INTEGER PRIMERY KEY, lable TEXT, image TEXT)');
            
      },
      version: 1,
    );
    
  }

  Future<void> clear() async {
    final Database db = await recipedata();
    await db.delete("recipe",);
    notifyListeners();
    db.close();
  }

  Future<void> insert(Sqmodel model) async {
    final Database db = await recipedata();
    await db.insert(model.tabel(), model.tomap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
        notifyListeners();
    db.close();
  }

  Future<void> delete(Sqmodel model) async {
    final Database db = await recipedata();
    await db.delete(model.tabel(), where: 'id = ?', whereArgs: [model.getid()]);
    notifyListeners();
    db.close();
  }

  Future<void> update(Sqmodel model) async {
    final Database db = await recipedata();
    await db.update(model.tabel(), model.tomap(),
        where: 'id = ?', whereArgs: [model.getid()]);
    db.close();
  }

  Future<List<Sqmodel>> getAll(String table, String dbname) async {
    //  اذا عندي اكثر من موديل
    final Database db = await recipedata();

    final List<Map<String, dynamic>> maps = await db.query(table);
    List<Sqmodel> models = [];
    for (var item in maps) models.add(recipemodel.fromMap(item));
    return models;
  }

sett(query)async{
SharedPreferences prefs2 =await SharedPreferences.getInstance();
       var it =prefs2.getStringList("Results")??[];
  if( it.any((element) => element==query))
    print("object");
  else
    {it.add(query);
    prefs2.setStringList("Results", it);
    y.add(query);}
notifyListeners();
}

 gett()async{
  
SharedPreferences prefs2 =await SharedPreferences.getInstance();
     y =prefs2.getStringList("Results")??[];
     notifyListeners();

}





}
