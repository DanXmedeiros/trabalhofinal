import 'package:flutter/foundation.dart';
import 'evento.dart';

class EventProvider with ChangeNotifier {
  final Map<DateTime, List<Evento>> _events = {};

  Map<DateTime, List<Evento>> get events => _events;

  void addEvent(Evento event) {
    if (_events[event.data] == null) {
      _events[event.data] = [];
    }
    _events[event.data]!.add(event);
    notifyListeners();
  }

  List<Evento> getEventsForDay(DateTime day) {
    return _events[day] ?? [];
  }
}
