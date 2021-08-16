abstract class Beverage {
  double get cost;
  String get ingredients;
}

class Ingredient {
  double cost;
  String name;

  Ingredient(this.name, this.cost);

  @override
  // ignore: unnecessary_this
  String toString() => this.name;
}

var coffee = Ingredient("coffee", .25);
var milk = Ingredient("milk", .5);
var sugar = Ingredient("sugar", .1);

class Coffee implements Beverage {
  final Set<Ingredient> _ingredients = {coffee, milk, sugar};
  @override
  double get cost => _ingredients.fold(0, (total, i) => total + i.cost);
  @override
  String get ingredients {
    var stringIngredients =
        _ingredients.fold("", (str, i) => "${i.name}, $str");
    var trimmedString =
        stringIngredients.substring(0, stringIngredients.length - 2);
    var lastComma = trimmedString.lastIndexOf(",");
    var replacement =
        ",".allMatches(trimmedString).length > 1 ? ", and" : " and";

    return trimmedString.replaceRange(lastComma, lastComma + 1, replacement);
  }
}

class StarbucksCoffeeDecorator implements Beverage {
  final Beverage _coffee = Coffee();
  @override
  double get cost => _coffee.cost * 5;
  @override
  String get ingredients => _coffee.ingredients;
}

void main() {
  var coffee = Coffee();
  var starbucksCoffee = StarbucksCoffeeDecorator();

  print("Coffee contains ${coffee.ingredients}. It costs \$${coffee.cost}");
  print(
      "Starbucks coffee contains ${starbucksCoffee.ingredients}. It costs \$${starbucksCoffee.cost}");

  // Coffee contains coffee, milk, and sugar. It costs $0.85
  // Starbucks coffee contains coffee, milk, and sugar. It costs $4.25
}
