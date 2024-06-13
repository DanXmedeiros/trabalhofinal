import 'package:flutter/material.dart';
import 'DBhelper.dart';
import 'evento.dart';

class EventProvider with ChangeNotifier {
  List<Evento> _events = [];

  List<Evento> get events => _events;

  Future<void> loadEvents() async {
    final dataList = await DBHelper.getEvents();
    _events = dataList.map((event) => Evento.fromMap(event)).toList();
    notifyListeners();
  }

  Future<void> addEvent(Evento event) async {
    await DBHelper.insertEvent(event.toMap());
    await loadEvents();
  }

  Future<void> updateEvent(Evento event) async {
    await DBHelper.updateEvent(event.toMap());
    await loadEvents();
  }

  Future<void> deleteEvent(int id) async {
    await DBHelper.deleteEvent(id);
    await loadEvents();
  }
}
