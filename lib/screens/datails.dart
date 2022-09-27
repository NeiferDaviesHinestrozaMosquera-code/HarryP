import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:harryapp/models/character_models.dart';


class DetailsScreen extends StatelessWidget {
  
  DetailsScreen({Key? key, required this.characterModel}) : super(key: key);
  CharacterModel characterModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      backgroundColor: Color(0xff2c3e50),
      elevation: 0,
      title: Text(characterModel.name!) ,
      centerTitle: true,
        ),
        body:SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20,),
                 Hero(
                        tag: characterModel.name!,
                         child: Center(
                           child: Container(
                            decoration: BoxDecoration(
                              borderRadius:  BorderRadius.circular(10),
                              boxShadow: [BoxShadow(color:Color(0xff2c3e50).withOpacity(0.2),
                              blurRadius: 10,
                              spreadRadius: 5,
                              )
                              ]),
                             child: ClipRRect(
                              borderRadius:BorderRadius.circular(10) ,
                              child: CachedNetworkImage(imageUrl: characterModel.image!, height: 250,
                              placeholder: (context, url) => Center(
                                child: CircularProgressIndicator(color: Color(0xff2c3e50) ),
                              ),
                              errorWidget: (context, url, error) =>  Icon(Icons.error),
                      ),
                    ),
                  ),
                )
              ),

              SizedBox(
                height: 20,
              ),
              Text(characterModel.name!,
              style: TextStyle(
                color: Colors.black54,
                fontSize: 20,
                fontWeight: FontWeight.bold
                ),
              ),

              SizedBox(height: 18,),
              Text (characterModel.actor!,
             style: TextStyle(
                color: Colors.black54,
                fontSize: 15,
                fontWeight: FontWeight.bold)
              ),

               SizedBox(height: 9,),
              Text (characterModel.house.toString(),
             style: TextStyle(
                color: Colors.black54,
                fontSize: 15,
                )
              ),

              SizedBox(height: 9,),
              Text (characterModel.gender.toString(),
             style: TextStyle(
                color: Colors.black54,
                fontSize: 15,
                )
              ),

              SizedBox(height: 9,),
              Text (characterModel.patronus.toString(),
             style: TextStyle(
                color: Colors.black54,
                fontSize: 15,
                )
              ),

              SizedBox(height: 9,),
              Text (characterModel.species.toString(),
             style: TextStyle(
                color: Colors.black54,
                fontSize: 15,
                )
              ),

              SizedBox(height: 9,),
              Text (characterModel.ancestry.toString(),
             style: TextStyle(
                color: Colors.black54,
                fontSize: 15,
                )
              ),
            ],
          ),
        ) ,
     );
  }
}