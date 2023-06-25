
import 'package:crud_gerick/pages/export_pages.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

//parts
part 'crud_event.dart';
part 'crud_state.dart';


class CrudBloc extends Bloc<CrudEvent, CrudState> {
  CrudBloc({
    required PatientController patientController,
  })  : _patientController = patientController,

  super(CrudState.empty()) {
  on<PatientAddEvent>(_patientAddEvent);
  on<PatientSetValues>(_setValues);
  }
  final PatientController _patientController;

  void _setValues (
  PatientSetValues event,
  Emitter<CrudState> emit
  ) async{
    
  List<User> users = await _patientController.get();
  debugPrint('yOWN' + users.toString());

  }

  void _patientAddEvent(
  PatientAddEvent event,
  Emitter<CrudState> emit
  ) async{

  }





}