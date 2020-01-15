import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';

class InsertFilialScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  return DefaultTabController(
    length: 3,
    child: Scaffold(
      appBar: AppBar(
        title: Text("Filiais"),
        backgroundColor: Color.fromARGB(255, 66, 163, 177),
        centerTitle: true,
        bottom: TabBar(
          indicatorColor: Color(0xffD77E67),
          tabs: <Widget>[
            Tab(text: 'Geral'),
            Tab(text: 'Endereço'),
            Tab(text: 'Fiscal')
          ],
        ),
      ),
      body: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          Container(
            child: Stack(
              children: <Widget>[
                SingleChildScrollView(
                  child:  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
//              mainAxisAlignment: MainAxisAlignment.t,
                    children: <Widget>[
                     Padding(
                        padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                        child: TextFormField(
                          decoration: new InputDecoration(
                              labelText: "Razão Social",
                              fillColor: Colors.red,
                              border: new OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(2.0),
                                borderSide: new BorderSide(
                                    color: Colors.red
                                ),
                              )
                          ),
//                        controller: emailController,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: TextFormField(
                          decoration: new InputDecoration(
                              labelText: "Nome Fantasia",
                              fillColor: Colors.white,
                              border: new OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(2.0),
                                  borderSide: new BorderSide())),
//                        controller: emailController,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: TextFormField(
                          decoration: new InputDecoration(
                              labelText: "CNPJ",
                              fillColor: Colors.white,
                              border: new OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(2.0),
                                  borderSide: new BorderSide())),
//                        controller: emailController,
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                          child: TextFormField(
                            decoration: new InputDecoration(
                                labelText: "Inscrição Estadual",
                                fillColor: Colors.white,
                                border: new OutlineInputBorder(
                                    borderRadius: new BorderRadius.circular(2.0),
                                    borderSide: new BorderSide())),
//                        controller: emailController,
                          )
                      ),
                      Padding(
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                          child: TextFormField(
                            decoration: new InputDecoration(
                                labelText: "Inscrição Municipal",
                                fillColor: Colors.white,
                                border: new OutlineInputBorder(
                                    borderRadius: new BorderRadius.circular(2.0),
                                    borderSide: new BorderSide())),
//                        controller: emailController,
                          )
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(color: Colors.red),
          Container(color: Colors.blue)
        ],
      ),
    ),
  );
  }
}
