abstract class BodyPart {
  late String name;
  void accept(BodyPartVisitor visitor) => visitor.visit(this);
}

abstract class BodyPartVisitor {
  void visit(BodyPart bodyPart);
}

class Face extends BodyPart {
  @override
  String name = "Face";
}

class Finger extends BodyPart {
  @override
  String name = "Finger";
  Finger(this.name);
}

class Foot extends BodyPart {
  @override
  String name = "Foot";
  Foot(this.name);
}

class Body implements BodyPart {
  @override
  String name = "Body";
  late List<BodyPart> bodyParts;

  Body() {
    bodyParts = List.from([
      Face(),
      Finger("Index Finger"),
      Finger("Thumb"),
      Foot("Left Foot"),
      Foot("Right Foot"),
      Foot("Third Foot?")
    ]);
  }

  @override
  void accept(BodyPartVisitor visitor) {
    for (var bodyPart in bodyParts) {
      bodyPart.accept(visitor);
    }
    visitor.visit(this);
  }
}

class BodyPartStitchVisitor implements BodyPartVisitor {
  void visit(BodyPart bodyPart) {
    if (bodyPart is Body) {
      print("Reanimating my ${bodyPart.name}.");
    }
    if (bodyPart is Face) {
      print("Stitching together my ${bodyPart.name}.");
    }
    if (bodyPart is Finger) {
      print("Stitching together my ${bodyPart.name}.");
    }
    if (bodyPart is Foot) {
      print("Gluing on my ${bodyPart.name}.");
    }
  }
}

class BodyPartProdVisitor implements BodyPartVisitor {
  @override
  void visit(BodyPart bodyPart) {
    if (bodyPart is Body) {
      print("Poking my ${bodyPart.name} with an electrode.");
    }
    if (bodyPart is Face) {
      print("Prodding ${bodyPart.name}.");
    }
    if (bodyPart is Finger) {
      print("Pricking ${bodyPart.name}.");
    }
    if (bodyPart is Foot) {
      print("Tickling ${bodyPart.name}.");
    }
  }
}

void main() {
  var body = Body();
  body.accept(BodyPartStitchVisitor());
  body.accept(BodyPartProdVisitor());

  /*
    Stitching together my Face.
    Stitching together my Index Finger.
    Stitching together my Thumb.
    Gluing on my Left Foot.
    Gluing on my Right Foot.
    Gluing on my Third Foot?.
    Reanimating my Body.
    Prodding Face.
    Pricking Index Finger.
    Pricking Thumb.
    Tickling Left Foot.
    Tickling Right Foot.
    Tickling Third Foot?.
    Poking my Body with an electrode.
  */
}
