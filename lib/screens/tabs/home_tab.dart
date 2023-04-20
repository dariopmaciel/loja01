import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:transparent_image/transparent_image.dart';

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget _buildBodyBack() => Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  //o gradiente se dará da cor 1 até a cor 2
                  Color.fromARGB(255, 211, 118, 130),
                  Color.fromARGB(255, 210, 181, 168),
                ],
                //inicia em topLeft e terminara em bottomRight
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
          ),
        );
    //o stack deixa colocar uma coisa SOBRE a outra
    return Stack(
      children: <Widget>[
        _buildBodyBack(),
        CustomScrollView(
          slivers: <Widget>[
            const SliverAppBar(
              floating: true,
              snap: true,
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              flexibleSpace: FlexibleSpaceBar(
                title: Text("Novidades"),
                centerTitle: true,
              ),
            ),
            FutureBuilder<QuerySnapshot>(
              future: FirebaseFirestore.instance
                  .collection("home")
                  .orderBy("pos")
                  .get(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return SliverToBoxAdapter(
                    child: Container(
                      // height: 200,
                      alignment: Alignment.center,
                      child: const CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                    ),
                  );
                } else {
                  //return Container();
                  //
                  //USAR SliverGrid()---------------------
                  return SliverStaggeredGrid.count(
                    crossAxisCount: 2, //qtd blocos horizontal
                    mainAxisSpacing: 1.0, //qtd de pixels de Exp vertical
                    crossAxisSpacing: 1.0, //qtd de pixels de Exp horizontal
                    staggeredTiles: snapshot.data!.docs.map((doc) {
                      return StaggeredTile.count(doc.get("x"), doc.get("y"));
                    }).toList(),
                    children: snapshot.data!.docs.map((doc) {
                      return FadeInImage.memoryNetwork(
                        placeholder: kTransparentImage,
                        image: doc.get("image"),
                        fit: BoxFit.cover,
                      );
                    }).toList(),
                  );

                  //-----------------------
                  // SliverAlignedGrid.count(
                  //   crossAxisCount: 2,
                  //   crossAxisSpacing: 0,
                  //   mainAxisSpacing: 0,
                  //   itemBuilder: (context, index) => Padding(
                  //     padding: const EdgeInsets.all(8.0),
                  //     child: Container(
                  //       color: Colors.red,
                  //       width: 50,
                  //       height: 200,
                  //     ),
                  //   ),
                  // );

                  //TEXTE
                }
              },
            )
          ],
        ),
      ],
    );
  }
}
/*SliverStaggeredGrid.count(
                    crossAxisCount: 2, //qtd blocos horizontal
                    mainAxisSpacing: 1.0, //qtd de pixels de Exp vertical
                    crossAxisSpacing: 1.0, //qtd de pixels de Exp horizontal
                    staggeredTiles: snapshot.data?.docs.map((doc) {
                      return StaggeredTile.count(doc.get("x"), doc.get("y"));
                    }).toList(),
                    children: snapshot.data?.docs.map((doc) {
                      return FadeInImage.memoryNetwork(
                        placeholder: kTransparentImage,
                        image: doc.get("image"),
                        fit: BoxFit.cover,
                      );
                    }).toList(),
                  ); */
