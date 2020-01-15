import 'package:flutter/material.dart';
import 'package:grupolenotre/tiles/menu_tile.dart';

class FilialTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget _buildBodyBack() => Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Colors.white,
              Colors.white,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )),
        );
    return Container(
      child: Column(
        children: <Widget>[
          Divider(
            height: 10.0,
          ),
          SizedBox(
            width: double.infinity,
            height: 50.0,
            child: ButtonTheme(
                minWidth: double.infinity,
                height: 50.0,
                child: RaisedButton(
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(0.0),
                    side: BorderSide(color: Color(0xffD77E67)),
                  ),
                  color: Color(0xffD77E67),
                  onPressed: () {},
                  textColor: Colors.white,
                  child: Text("Cadastrar Nova Filial",
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 12)),
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onTap: () {
                print("teste");
              },
//              onChanged: (){},
//              controller: editingController,
              decoration: InputDecoration(
                labelText: "Pesquise uma filial",
                hintText: "Filial",
                prefixIcon: Icon(Icons.search, color: Color(0xffD77E67)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(0.0)),
                ),
              ),
            ),
          ),
          Expanded(
              child: ListView.builder(
                  padding: EdgeInsets.only(top: 0.0),
                  itemCount: 1,
                  itemBuilder: (context, index) {
                      return MenuTile("fsadf");
                  })
          )
        ],
      ),
    );
  }
}
