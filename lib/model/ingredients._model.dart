class ingredients {
  String text;
  double quantity;
  String measure;
  String food;
  double weight;
  String foodId;

  ingredients({
    this.text,
    this.quantity,
    this.measure,
    this.food,
    this.weight,
    this.foodId,
    
  });
factory ingredients.fromJson(Map<String, dynamic> data) {


    return new ingredients(
     text: data['text'],
quantity: data['quantity'],
measure: data['measure'],
food: data['food'],
weight: data['weight'],
foodId: data["foodId"],

    
    );
  }

  
}
