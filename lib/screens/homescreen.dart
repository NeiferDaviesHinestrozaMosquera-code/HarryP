import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:harryapp/fecth/character_fetch.dart';
import 'package:harryapp/screens/datails.dart';
import 'package:provider/provider.dart';


class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final fetch = Provider.of<CharacterFetch>(context);
    return Scaffold(
     appBar: AppBar(
      backgroundColor: Color(0xff2c3e50),
      elevation: 0,
      title: Text(fetch.isLoading? 'Harry Potter' : 'Characters') ,
      centerTitle: true,
     ),
     body: Column(
      children: [
        fetch.isLoading? Center(
          child: CircularProgressIndicator(
            color: Color(0xff2c3e50),
           ),
        ) : Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            itemCount: fetch.characters.length,
            itemBuilder: (
              (context, index) { final character = fetch.characters[index];
                return GestureDetector(
                  onTap: () {
                     Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsScreen(characterModel: character,),
                      )
                     );
                    },
                  child: Card(
                    elevation: 0,
                    child: Padding(padding: EdgeInsets.all(10),
                    child: Row(children: [
                      Hero(
                        tag: character.name!,
                         child: ClipRRect(
                          borderRadius:BorderRadius.circular(10) ,
                          child: CachedNetworkImage(imageUrl: character.image!, height: 120,
                          placeholder: (context, url) => Center(
                            child: CircularProgressIndicator(color: Color(0xff2c3e50) ),
                          ),
                          errorWidget: (context, url, error) =>  Icon(Icons.error),
                        ),
                        )
                      ),
                      SizedBox(width: 20,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            character.name!,
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight:  FontWeight.w800
                            ),
                          ),
                          SizedBox(height: 8,),
                          Text(character.house.toString() , 
                          style: const TextStyle(
                            fontSize: 13,
                            color: Colors.redAccent,
                          ),
                          maxLines: 2,
                          )
                        ],
                      )
                    ],
                    ),
                  ),
                  ),
                  );  
                }
              )
            )
          )
      ],
     ),
   );
  }
}