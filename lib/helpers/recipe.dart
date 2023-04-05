import 'dart:convert';


import 'package:flutter/material.dart';

import 'package:flutterrecipe/model/recipe_model.dart';
import 'package:http/http.dart' as http;

class Recipe extends ChangeNotifier {

List<RecipeModel> recipes = [];

List<RecipeModel> recipesSearch = [];


String Fil="with_out_Filter";


String diet='';
String health='';
String cuisineType='';
String mealType='';
String dishType='';
String calories='';
String ingr ='';


setrecipelistbymodel(RecipeModel m, String va){
m.fav=va;
notifyListeners();
}

setrecipelist(int index,String k){
recipes[index].fav=k;
notifyListeners();
}


setStateFilter(String filter){
Fil=filter;
notifyListeners();

}

setcalories(String cal){
calories = cal;
notifyListeners();

}
setingr(String inr){

  ingr=inr;
  notifyListeners();
}

Map<String,String> dietMap={

"balancedhigh":"",
"fiberhigh":"",
"proteinlow":"",
"carblow":"",
"fatlow":"",
"sodium":"",
 } ;



 void setdietMap(String pa){
dietMap[pa]=pa;
notifyListeners();
 }

Map<String,String> dishTypepopMap={
"Biscuits_and_cookies":"",
"Bread":"",
"Cereals":"",
"Condiments_and_sauces":"",
"Desserts":"",
"Drinks":"",
"Main_course":"",
"Pancake":"",
"Preps":"",
"Preserve":"",
"Salad":"",
"Sandwiches":"",
"Side_dish":"",
"Soup":"",
"Starter":"",
"Sweets":"", 
} ;

 void setdishTypepopMap(String pa){
dishTypepopMap[pa]=pa;
notifyListeners();
 }


Map<String,String> CuisineTypeMap={
"American":"",
"Asian":"",
"British":"",
"Caribbean":"",
"Central_Europe":"",
"Chinese":"",
"Eastern_Europe":"",
"French":"",
"Indian":"",
"Italian":"",
"Japanese":"",
"Kosher":"",
"Mediterranean":"",
"Mexican":"",
"Middle_Eastern":"",
"Nordic":"",
"South_American":"",
"South_East_Asian":"",
 } ;


 void setCuisineTypeMap(String pa){
CuisineTypeMap[pa]=pa;
notifyListeners();
 }


Map<String,String> healthMap={
"alcohol_cocktail":"",
"alcohol_free":"",
"celery_free":"",
"crustacean_free":"",
"dairy_free":"",
"DASHegg_free":"",
"fish_free":"",
"fodmap_free":"",
"gluten_free":"",
"immuno_supportive":"",
"keto_friendly":"",
"kidney_friendly":"",
"kosher":"",
"low_fat_abs":"",
"low_potassium":"",
"low_sugar":"",
"lupine_free":"",
"Mediterranean":"",
"mollusk_free":"",
"mustard_free":"",
"no_oil_added":"",
"paleo":"",
"peanut_free":"",
"pescatarian":"",
"pork_free":"",
"red_meat_free":"",
"sesame_free":"",
"shellfish_free":"",
"soy_free":"",
"sugar_conscious":"",
"sulfite_free":"",
"tree_nut_free":"",
"vegan":"",
"vegetarian":"",
"wheat_free":""

 } ;


 void sethealthMap(String pa){
healthMap[pa]=pa;
notifyListeners();
 }

Map<String,String> MealTypeMap={
"Breakfast":"",
"Dinner":"",
"Lunch":"",
"Snack":"",
"fatlow":"",
 } ;


 void setMealTypeMap(String pa){
MealTypeMap[pa]=pa;
notifyListeners();
 }




initState(){
dietMap.forEach((key, value) {
if(value!="")
diet="&diet=$value";
notifyListeners();

 });
dishTypepopMap.forEach((key, value) {
if(value!="")
dishType="&dishType=$value";
notifyListeners();
 });

 CuisineTypeMap.forEach((key, value) {
if(value!="")
cuisineType="&cuisineType=$value";
notifyListeners();
 });
 healthMap.forEach((key, value) {
if(value!="")
health="&health=$value";
notifyListeners();
 });
 MealTypeMap.forEach((key, value) {
if(value!="")
mealType="&mealType=$value";
notifyListeners();
 });



}

  Future<void> getRecipes() async {
    String url =
'https://api.edamam.com/search?q=all&app_id=85903da9&app_key=8bf0ca05cd6cf6b80300662f4aebba2d&from=0&to=100';

    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    if (jsonData['more'] == true) {

      jsonData['hits'].forEach((element) {

        if (element['recipe']['url'] != null &&
            element['recipe']['image'] != null) {
          RecipeModel recipeModel = RecipeModel(
            label: element['recipe']['label'],
            image: element['recipe']['image'],
            source: element['recipe']['source'],
            shareAs: element['recipe']['shareAs'],
            ingredientLines: element['recipe']['ingredientLines'].cast<String>(),
            ingredients: element['recipe']['ingredients'].cast<Map<String,dynamic>>(),
            fav: "1"
          );
          recipes.add(recipeModel);

        }
      });
    }
  }



  Future<void> getRecipesSearch(String SearchWord) async {

recipesSearch.clear();

    String url =
        'https://api.edamam.com/search?q=$SearchWord&app_id=85903da9&app_key=8bf0ca05cd6cf6b80300662f4aebba2d';
        
    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    if (jsonData['more'] == true) {

      jsonData['hits'].forEach((element) {
        if (element['recipe']['url'] != null &&
            element['recipe']['image'] != null) {
          RecipeModel recipeModel = RecipeModel(
            label: element['recipe']['label'],
            image: element['recipe']['image'],
            source: element['recipe']['source'],
            shareAs: element['recipe']['shareAs'],
            ingredientLines: element['recipe']['ingredientLines'].cast<String>(),
            ingredients: element['recipe']['ingredients'].cast<Map<String,dynamic>>(),
            fav: "1"
          );

          recipesSearch.add(recipeModel);
   
        }

      });

    }
    notifyListeners();
  }

Future<void> getRecipesSearchwithfilter({String SearchWord=""}) async {
await initState();
if(mealType==''&&health==''&& cuisineType==''&& dishType==''&& diet==''&&calories==''&&ingr=='')
 SearchWord = "all";
    String url =
        'https://api.edamam.com/search?q=$SearchWord&app_id=85903da9&app_key=8bf0ca05cd6cf6b80300662f4aebba2d$mealType$health$cuisineType$dishType$diet$calories$ingr';
      
    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    if (jsonData['more'] == true) {

      jsonData['hits'].forEach((element) {
        if (element['recipe']['url'] != null &&
            element['recipe']['image'] != null) {
          RecipeModel recipeModel = RecipeModel(
            label: element['recipe']['label'],
            image: element['recipe']['image'],
            source: element['recipe']['source'],
            shareAs: element['recipe']['shareAs'],
            ingredientLines: element['recipe']['ingredientLines'].cast<String>(),
            ingredients: element['recipe']['ingredients'].cast<Map<String,dynamic>>(),
            fav: "1"
          );

          recipes.add(recipeModel);
       
        }
      });
    }
  }



}

