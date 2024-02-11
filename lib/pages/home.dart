
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:band_name_app/models/band.dart';
import 'package:flutter/services.dart';



class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();

}


class _HomePageState extends State<HomePage>{

  List<Band> band =[
     Band(id: '1', name: 'AC/DC', votes: 2),
     Band(id: '2', name: 'PINK FLOID', votes: 4),
     Band(id: '3', name: 'METALLICA', votes: 2),
     Band(id: '4', name: 'THE WHO', votes: 12),
     Band(id: '5', name: 'QUEEN', votes: 1),
  ];

 @override
 Widget build(BuildContext context) {
  return Scaffold(
      appBar: AppBar(
        title: Text('ROCK BANDS 2024' ,style: TextStyle(color: Colors.black54)
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
        elevation: 10,
      ),
      body: ListView.builder(
        itemCount: band.length,
        itemBuilder: (BuildContext context, int i) => _bandTitle(band[i]) 
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        elevation: 10,
        onPressed: (){
           addNewBand();
        },
        backgroundColor: Colors.blue[100],
      ),
    );
   }

 Widget _bandTitle(Band bandas) {
   return Dismissible(
     key: Key(bandas.id),
     direction: DismissDirection.startToEnd,
     onDismissed: (DismissDirection direccion){
      print('$direccion');
      print('id: ${bandas.id}');

      
      
     },
     background: Container(
      padding: EdgeInsets.only(left: 18.0),
      color: Colors.red,
      child: Align(
        alignment: Alignment.centerLeft,
        child:Text('Eliminar banda',style: TextStyle(color: Colors.white)),
      )
     ),
     child: ListTile(
            leading: CircleAvatar(
              child: Text(bandas.name.substring(0,2)),
              backgroundColor: Colors.blue[100],
            ),
            title: Text(bandas.name),
            trailing:Text('${bandas.votes}', style: TextStyle(fontSize: 20),) ,
            onTap: () {
              print(bandas.name);},
        ),
   );
 } 


addNewBand(){

final textController = new TextEditingController();

if (Platform.isAndroid || Platform.isWindows){

 return showDialog(
    context: context, 
    builder: (context) {
      return AlertDialog(
        title: Text('Nuevo banda:'),
        content: TextField(
          controller: textController,
        ),
        actions: <Widget>[
          MaterialButton(
            child: Text('Añadir'),
            elevation: 5,
            textColor: Colors.blue,
            onPressed:  () => AddBandToList(textController.text)
            
            )
            
        ],
      );
    }
   
   );

}

showCupertinoDialog(
  context: context, 
  builder: ( _ ) {
    return CupertinoAlertDialog(
        title: Text('Nuevo banda:'),
         content: CupertinoTextField(
          controller: textController,
         ),
         actions: <Widget>[
          CupertinoDialogAction(
            child: Text('Añadir'),
            
            onPressed:  () => AddBandToList(textController.text)
          
          )
         ],
    );
  }
  
  );
  
}

void AddBandToList(String name){
    print(name);
    
    if (name.length > 1){
        this.band.add( new Band(id:DateTime.now().toString(),name:name,votes:0));
        setState(() {});
    }

  Navigator.pop(context);
}


}







