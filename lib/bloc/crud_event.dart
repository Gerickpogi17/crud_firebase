part of 'crud_bloc.dart';

@immutable
abstract class CrudEvent {}

//display event
class PatientSetValues extends CrudEvent{
  PatientSetValues();
}
//add event
class PatientAddEvent extends CrudEvent {
  final String name;
  final String email;
  final double age;
  PatientAddEvent(this.age, this.email, this.name);
}
//update event
class PatientUpdateEvent extends CrudEvent {
  final String name;
  final String email;
  final double age;
  PatientUpdateEvent(this.age, this.email, this.name);
}
//delete event
class PatientDeleteEvent extends CrudEvent {
  final String id;
  PatientDeleteEvent(this.id);
}