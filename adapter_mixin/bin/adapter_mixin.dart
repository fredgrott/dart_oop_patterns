const adapteeMessage = 'Adaptee#method was called';

class Adaptee {
  String method() {
    print('Adaptee#method is being called');

    return adapteeMessage;
  }
}

mixin Target {
  String call();


}

class Adapter implements Target {
  @override
  String call() {
    var adaptee = Adaptee();
    print('Adapter#call is being called');

    return adaptee.method();
  }
}



void main() {
  var adapter = Adapter();
  var result = adapter.call();

  assert(result == adapteeMessage);
}
