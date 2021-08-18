mixin Drinkable {
  void pour();
}

class Beer implements Drinkable {
  @override
  void pour() {
    print("Pouring a delicious beer!");
  }

  
}

class Coffee implements Drinkable {
  @override
  void pour() {
    print("Pouring a refreshing coffee!");
  }
}

mixin DrinkFactory {

  Drinkable createDrink();


}

class Pub implements DrinkFactory {
  @override
  Drinkable createDrink() {
    return Beer();
  }
}

class CoffeeShop implements DrinkFactory {
  @override
  Drinkable createDrink() {
    return Coffee();
  }
}


void main() {
  var mood = "sleepy";
  late DrinkFactory destination;

  switch (mood) {
    case "sleepy":
      destination = CoffeeShop();
      break;
    case "done":
      destination = Pub();
      break;
    default:
      print("I only have two moods...");
  }

  var myBeverage = destination.createDrink();
  myBeverage.pour();

  /*
     Pouring a refreshing coffee!
  */
}
