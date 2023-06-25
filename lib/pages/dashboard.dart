import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'export_pages.dart';

class DashBoardPages extends StatefulWidget {
  const DashBoardPages({super.key});

  @override
  State<DashBoardPages> createState() => _DashBoardPagesState();
}

class _DashBoardPagesState extends State<DashBoardPages> {

  final CollectionReference _users = FirebaseFirestore.instance.collection('patient');
  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _age = TextEditingController();
  PatientController _patientController = PatientController();
  late CrudBloc _crudBloc;

   @override
  void initState() {
    super.initState();
  _crudBloc = BlocProvider.of<CrudBloc>(context);
  // _cashOutBloc.add(CashOutSetValuesForm());
  }

  Future<void> deletePatient (String id) async {
  await _users.doc(id).delete();
 }
  Future<void> createPatient ([DocumentSnapshot? documentSnapshot]) async {
  
  if (documentSnapshot !=null) {
      _name.text = documentSnapshot['name'];
      _email.text = documentSnapshot['email'];
      _age.text = documentSnapshot['age'].toString();
    }
    debugPrint("POTAAAA");

    await showModalBottomSheet(
    isScrollControlled: true,
    context: context, 
    builder: (BuildContext context) {
      return Padding(padding: EdgeInsets.all(
      30
      ),
      child: Column(
      children: [
        TextField(
          controller: _name,
          decoration: InputDecoration(labelText: 'Name'),
        ),
          TextField(
          controller: _email,
          decoration: InputDecoration(labelText: 'Email'),
        ),
          TextField(
          keyboardType: TextInputType.numberWithOptions(decimal: true),
          controller: _age,
          decoration: InputDecoration(labelText: 'Age'),
        ),
        const SizedBox(
          height: 20,
        ),
        ElevatedButton(
        onPressed: () async {
          final String name = _name.text;
          final String email = _email.text;
          final int? ages = int.tryParse(_age.text);
          if (ages !=null ) {
            await _users.add({
            'name' : name,
            'email' : email,
            'age' : ages
            });
            _name.text = '';
            _email.text = '';
            _age.text = '';
          Navigator.pop(context);
          }
        }, 
        child: const Text('Add')
        )
      ],
      ),
      );
    }
    );
 }
  Future<void> updatePatient ([DocumentSnapshot? documentSnapshot]) async {

    if (documentSnapshot !=null) {
      _name.text = documentSnapshot['name'];
      _email.text = documentSnapshot['email'];
      _age.text = documentSnapshot['age'].toString();
    }
  

    await showModalBottomSheet(
    isScrollControlled: true,
    context: context, 
    builder: (BuildContext context) {
      return Padding(padding: EdgeInsets.all(
      30
      ),
      child: Column(
      children: [
        TextField(
          controller: _name,
          decoration: InputDecoration(labelText: 'Name'),
        ),
          TextField(
          controller: _email,
          decoration: InputDecoration(labelText: 'Email'),
        ),
          TextField(
          keyboardType: TextInputType.numberWithOptions(decimal: true),
          controller: _age,
          decoration: InputDecoration(labelText: 'Age'),
        ),
        const SizedBox(
          height: 20,
        ),
        ElevatedButton(
        onPressed: () async {
          final String name = _name.text;
          final String email = _email.text;
          final int? ages = int.tryParse(_age.text);
          if (ages !=null ) {
            await _users.doc(documentSnapshot!.id)
            .update({
            'name' : name,
            'email' : email,
            'age' : ages
            });
            _name.text = '';
            _email.text = '';
            _age.text = '';
          Navigator.pop(context);
          }
        }, 
        child: const Text('Update')
        )
      ],
      ),
      );
    }
    );
  }
  @override
  Widget build(BuildContext context) {

    return BlocConsumer<CrudBloc,CrudState>(
      builder: _builder,
      listener: _listener
    );
  }
  Widget _builder( BuildContext context, CrudState state ) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
      backgroundColor: Colors.blueAccent,
      onPressed: (){
        _crudBloc.add(PatientSetValues());
      },
      child: const Icon(Icons.add),
      ),
      appBar: AppBar(
          backgroundColor: Colors.lightBlueAccent,
          title: const Center(
            child: TitleTextMain(
            mainText: 'Patient',
            textColor: Colors.white,
            titleSize: 28,
            titleWeight: FontWeight.w700,
          ))),
        body: SafeArea(
        child: StreamBuilder(
        stream: _users.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapShot) {
          
        if (streamSnapShot.hasData) {
        return ListView.builder(
          itemCount: streamSnapShot.data!.docs.length,
          itemBuilder: (context, index){
          final DocumentSnapshot documentSnapshot = streamSnapShot.data!.docs[index];
          return Card(
            margin: const  EdgeInsets.all(10),
            child: ListTile(
              title: Text(documentSnapshot['name']),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Age: ${documentSnapshot['age']}'),
                  Text('Email: ${documentSnapshot['email'].toString()}'),
                ],
              ),
              trailing: SizedBox(
                width: 100,
                child: Row(
                  children: [
                    IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () {
                    updatePatient(documentSnapshot);
                    },
                    ),
                    IconButton(
                    icon: const Icon(Icons.delete_forever_rounded),
                    onPressed: () {
                     deletePatient(documentSnapshot.id);
                    },
                    ),
                  ],
                ),
              ),
            ),
          );
          },
          );
        }
        return const Center(child: CircularProgressIndicator(),);
          },
          )
        ),
    );
  }
   void _listener( BuildContext context, CrudState state ) {
    //add notif msg or navigate
   }
}
