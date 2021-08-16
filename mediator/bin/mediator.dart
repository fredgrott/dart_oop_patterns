abstract class Stateful {
  late String _state;
  // ignore: unnecessary_getters_setters
  String get state => _state;
  // ignore: unnecessary_getters_setters
  set state(String newState) => _state = newState;
}

class Mediator {
  final List<Stateful> _parties;
  Mediator(this._parties);
  void update(String state) {
    for (var party in _parties) {
      party.state = state;
    }
  }
}

class Attendee extends Stateful {
  String name;
  Attendee(this.name);
}

void main() {
  var curly = Attendee("Curly");
  var larry = Attendee("Larry");
  var moe = Attendee("I prefer not to disclose my name");
  var mixer = List<Attendee>.from([curly, larry, moe]);
  var publicAnnouncementSystem = Mediator(mixer);

  publicAnnouncementSystem.update("Do NOT eat the shrimp tacos!");

  for (var person in mixer) {
    print("${person.name} heard \"${person.state}\".");
  }

  /*
    Curly heard "Do NOT eat the shrimp tacos!".
    Larry heard "Do NOT eat the shrimp tacos!".
    I prefer not to disclose my name heard "Do NOT eat the shrimp tacos!".
  */
}
