


import 'package:flutter/cupertino.dart';
import 'package:harryapp/apis/remote.dart';
import 'package:harryapp/models/character_models.dart';

class CharacterFetch extends ChangeNotifier {
   bool isLoading = false;
   List<CharacterModel> characters = [];

  CharacterFetch(){
    fetchCharacter();
  }

  Future <void> fetchCharacter () async {
    isLoading = true;
    notifyListeners();

    characters = await RemoteServices.fetchCharacter();
    isLoading = false;
    notifyListeners();
  }
}