abstract class Thing {
  late String name;
  void doSomething();
}

class CompositeThing implements Thing {
  @override
  String name;
  final Set<Thing> _childThings = {};

  CompositeThing(this.name);

  void addChild(Thing child) {
    _childThings.add(child);
  }

  @override
  void doSomething() {
    print("\r\n** $name is doing something! ** \r\n");
    for (var thing in _childThings) {
      thing.doSomething();
    }
    print("\r\n** $name is all done. ** \r\n");
  }
}

class LeafThing implements Thing {
  @override
  String name;

  LeafThing(this.name);

  @override
  void doSomething() {
    print("*  $name!");
  }
}

void main() {
  var compositeParent = CompositeThing("Cat in the Hat");
  var compositeChild1 = CompositeThing("Thing 1");
  var compositeChild2 = CompositeThing("Thing 2");

  var leaf1_1 = LeafThing("Frustrate fish");
  var leaf1_2 = LeafThing("Knock down vases");
  var leaf2_1 = LeafThing("Ruin mom's dress");
  var leaf2_2 = LeafThing("Clean up");

  compositeChild1.addChild(leaf1_1);
  compositeChild1.addChild(leaf1_2);

  compositeChild2.addChild(leaf2_1);
  compositeChild2.addChild(leaf2_2);

  compositeParent.addChild(compositeChild1);
  compositeParent.addChild(compositeChild2);

  compositeParent.doSomething();

  /*
   ** Cat in the Hat is doing something! **


    ** Thing 1 is doing something! **

    *  Frustrate fish!
    *  Knock down vases!

    ** Thing 1 is all done. **


    ** Thing 2 is doing something! **

    *  Ruin mom's dress!
    *  Clean up!

    ** Thing 2 is all done. **


    ** Cat in the Hat is all done. **
  */
}
