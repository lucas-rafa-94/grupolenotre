import 'package:flutter/material.dart';
import 'package:grupolenotre/screens/filial/insert_filial_screen.dart';

class MenuTile extends StatelessWidget {
  final String desc;

  MenuTile(this.desc);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context)=> InsertFilialScreen())
        );
      },
      child: Card(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 20.0),
                child: Text('Quinta-Feira'),
              ),
              Container(
                padding: EdgeInsets.only(top: 10.0),
                child: Text('Janeiro',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0)),
              ),
              Container(
                padding: EdgeInsets.only(top: 10.0),
                child: Text('09',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40.0)),
              ),
              Container(
                padding: EdgeInsets.only(top: 10.0),
                child: Text('2020',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0)),
              ),
            ],
          )
      )
    );
  }
}
