abstract class Abstract {
  String abstractMethod();
  String hookMethod() => "OMG I am a hook!";
  void templateMethod() {
    print(abstractMethod());
    print(hookMethod());
  }
}

class Concrete extends Abstract {
  @override
  String abstractMethod() => "This is a boring example...";
}

class ConcreteOverridingHook extends Abstract {
  @override
  String abstractMethod() => "So, so boring...";
  @override
  String hookMethod() => "I'm an overriden hook method!";
}

void main() {
  var con1 = Concrete();
  var con2 = ConcreteOverridingHook();
  con1.templateMethod();
  con2.templateMethod();

  /*
    This is a boring example...
    OMG I am a hook!
    So, so boring...
    I'm an overriden hook method!
  */
}
