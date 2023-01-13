import '../../Data_layer/modles/Character.dart';
import '../../constants/colors.dart';
import 'package:flutter/material.dart';

import '../../constants/constants.dart';

class ChracterItem extends StatelessWidget {
  const ChracterItem({super.key, required this.character});
  final Character character;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
          color: MyColors.myWhite, borderRadius: BorderRadius.circular(8)),
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, charactersDetails,arguments: character),
        child: GridTile(
          footer: Hero(
            tag: character.char_id,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              color: Colors.black54,
              alignment: Alignment.bottomCenter,
              child: Text(
                character.name,
                style: const TextStyle(
                  
                  height: 1.3,
                  fontSize: 16,
                  color: MyColors.myWhite,
                  fontWeight: FontWeight.bold,
                  
                ),overflow: TextOverflow.ellipsis,maxLines: 2,
                textAlign: TextAlign.center ,
              ),
            ),
          ),
          child: Container(
            color: MyColors.myGrey,
            child: character.img.isNotEmpty
                ? FadeInImage.assetNetwork(
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                    placeholder: 'assets/images/loading.gif',
                    image: character.img)
                : Image.asset('assets/images/placeholder.gif'),
          ),
        ),
      ),
    );
  }
}
