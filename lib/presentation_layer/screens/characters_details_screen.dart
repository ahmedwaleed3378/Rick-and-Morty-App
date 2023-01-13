// import 'package:animated_text_kit/animated_text_kit.dart';
// import 'package:bb/Business_Logic_Layer/cubit/charcters_cubit.dart';
// import 'package:bb/Business_Logic_Layer/cubit/qoutes_cubit.dart';
// import 'package:bb/Data_layer/modles/Character.dart';
// import 'package:bb/Data_layer/modles/qoutes.dart';
// import 'package:bb/constants/colors.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'dart:math';

// class CharacterDetailsScreen extends StatefulWidget {
//   const CharacterDetailsScreen({super.key, required this.character});
//   final Character character;

//   @override
//   State<CharacterDetailsScreen> createState() => _CharacterDetailsScreenState();
// }

// class _CharacterDetailsScreenState extends State<CharacterDetailsScreen> {
//   List<Qoute> allQoutes = [];
//   @override
//   void initState() {
//     super.initState();
//     BlocProvider.of<QoutesCubit>(context).getQoutes(widget.character.name);
//   }

//   Widget buildSliverAppBar() {
//     return SliverAppBar(
//       expandedHeight: 600,
//       pinned: true,
//       stretch: true,
//       backgroundColor: MyColors.myGrey,
//       flexibleSpace: FlexibleSpaceBar(
//         centerTitle: true,
//         title: Text(
//           widget.character.nickname,
//           textAlign: TextAlign.start,
//           style: const TextStyle(color: MyColors.myWhite),
//         ),
//         background: Hero(
//             tag: widget.character.char_id,
//             child: Image.network(
//               widget.character.img,
//               fit: BoxFit.cover,
//             )),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: MyColors.myGrey,
//       body: CustomScrollView(
//         slivers: <Widget>[
//           buildSliverAppBar(),
//           SliverList(
//               delegate: SliverChildListDelegate([
//             Container(
//                 margin: const EdgeInsets.fromLTRB(14, 14, 14, 0),
//                 padding: const EdgeInsets.all(8),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     characterInfo(
//                         'Job : ', widget.character.occupation.join(' / ')),
//                     buildDivider(280),
//                     characterInfo('Appeared in : ', widget.character.category),
//                     buildDivider(215),
//                     characterInfo(
//                         'Seasons : ', widget.character.appearance.join(' / ')),
//                     buildDivider(245),
//                     characterInfo('Status : ', widget.character.status),
//                     buildDivider(255),
//                     (widget.character.appearanceInBCS.isEmpty)
//                         ? Container()
//                         : characterInfo('BTC Seasons : ',
//                             widget.character.appearanceInBCS.join(' / ')),
//                     (widget.character.appearanceInBCS.isEmpty)
//                         ? Container()
//                         : buildDivider(200),
//                     characterInfo(
//                         'Actor/Actress : ', widget.character.portrayed),
//                     buildDivider(200),
//                     const SizedBox(
//                       height: 20,
//                     ),
//                     BlocBuilder<QoutesCubit, QoutesState>(
//                       builder: (context, state) {
//                         return checkIfQuotesAreLoaded(state);
//                       },
//                     ),
//                   ],
//                 )),
//             const SizedBox(
//               height: 500,
//             )
//           ]))
//         ],
//       ),
//     );
//   }

//   Widget characterInfo(String title, String value) {
//     return RichText(
//       text: TextSpan(children: [
//         TextSpan(
//             text: title,
//             style: const TextStyle(
//                 fontWeight: FontWeight.bold,
//                 fontSize: 18,
//                 color: MyColors.myWhite)),
//         TextSpan(
//             text: value,
//             style: const TextStyle(fontSize: 16, color: MyColors.myWhite))
//       ]),
//       maxLines: 1,
//       overflow: TextOverflow.ellipsis,
//     );
//   }

//   Widget buildDivider(double end) {
//     return Divider(
//       color: MyColors.myYellow,
//       height: 30,
//       endIndent: end,
//       thickness: 2,
//     );
//   }

//   Widget checkIfQuotesAreLoaded(Qou state) {
//     if (state is QoutesLoaded) {
//       return displayAnimatedText(state);
//     } else {
//       return displayAnimatedText(state);
//     }
//   }

//   Widget displayAnimatedText(state) {
//     var quotes = (state).quotes;
//     if (quotes.length != 0) {
//       int randomQuoteIndex = Random().nextInt(quotes.length - 1);
//       return Center(
//         child: DefaultTextStyle(
//           textAlign: TextAlign.center,
//           style: const TextStyle(
//             fontSize: 20,
//             color: MyColors.myWhite,
//             shadows: [
//               Shadow(
//                 blurRadius: 7,
//                 color: MyColors.myYellow,
//                 offset: Offset(0, 0),
//               )
//             ],
//           ),
//           child: AnimatedTextKit(
//             repeatForever: true,
//             animatedTexts: [
//               FlickerAnimatedText(quotes[randomQuoteIndex].quote),
//             ],
//           ),
//         ),
//       );
//     } else {
//       return Container();
//     }
//   }
//   // Widget checkIfQuotesAreLoaded() {
//   //   if (allQoutes.isNotEmpty) {
//   //     return displayAnimatedText(allQoutes);
//   //   } else {
//   //     // return displayAnimatedText(state as QoutesLoaded);

//   //     return showProgressIndicator();
//   //   }
//   // }

//   // Widget checkIfQoutesAreLoaded(CharactersState state) {
//   // Widget displayAnimatedText(List<Qoute> qoutes) {
//   //   if (qoutes.isNotEmpty) {
//   //     int randomQouteIndex = Random().nextInt(qoutes.length - 1);
//   //     return Center(
//   //         child: DefaultTextStyle(
//   //             style: const TextStyle(
//   //                 fontSize: 20,
//   //                 color: MyColors.myWhite,
//   //                 shadows: [
//   //                   Shadow(
//   //                       blurRadius: 7,
//   //                       color: MyColors.myYellow,
//   //                       offset: Offset(0, 0))
//   //                 ]),
//   //             child: AnimatedTextKit(
//   //               repeatForever: true,
//   //               pause: const Duration(seconds: 3),
//   //               animatedTexts: [
//   //                 TypewriterAnimatedText(qoutes[randomQouteIndex].qoute),
//   //               ],
//   //             )));
//   //   } else {
//   //     return Container();
//   //   }
// //     SizedBox(
// //   width: 250.0,
// //   child: DefaultTextStyle(
// //     style: const TextStyle(
// //       fontSize: 30.0,
// //       fontFamily: 'Agne',
// //     ),
// //     child: AnimatedTextKit(
// //       animatedTexts: [
// //         TypewriterAnimatedText('Discipline is the best tool'),
// //         TypewriterAnimatedText('Design first, then code'),
// //         TypewriterAnimatedText('Do not patch bugs out, rewrite them'),
// //         TypewriterAnimatedText('Do not test bugs out, design them out'),
// //       ],
// //       onTap: () {
// //         print("Tap Event");
// //       },
// //     ),
// //   ),
// // );}

//   Widget showProgressIndicator() {
//     return const Center(
//         child: CircularProgressIndicator(
//       color: MyColors.myYellow,
//     ));
//   }
// }
import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:bb/Business_Logic_Layer/cubit/charcters_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Data_layer/modles/Character.dart';
import '../../constants/colors.dart';

class CharacterDetailsScreen extends StatelessWidget {
  final Character character;

  const CharacterDetailsScreen({Key? key, required this.character})
      : super(key: key);

  Widget buildSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 600,
      pinned: true,
      stretch: true,
      backgroundColor: MyColors.myGrey,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
          character.nickname,
          style: const TextStyle(color: MyColors.myWhite),
        ),
        background: Hero(
          tag: character.char_id,
          child: Image.network(
            character.img,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget characterInfo(String title, String value) {
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        children: [
          TextSpan(
            text: title,
            style:const TextStyle(
              color: MyColors.myWhite,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          TextSpan(
            text: value,
            style:const TextStyle(
              color: MyColors.myWhite,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDivider(double endIndent) {
    return Divider(
      height: 30,
      endIndent: endIndent,
      color: MyColors.myYellow,
      thickness: 2,
    );
  }

  Widget checkIfQuotesAreLoaded(CharactersState state) {
    if (state is QuotesLoaded) {
      return displayRandomQuoteOrEmptySpace(state);
    } else {
      // return displayRandomQuoteOrEmptySpace(state);

        return showProgressIndicator();
    }
  }

  Widget displayRandomQuoteOrEmptySpace(state) {
    var quotes = (state).quotes;
    if (quotes.length != 0) {
      int randomQuoteIndex = Random().nextInt(quotes.length - 1);
      return Center(
        child: DefaultTextStyle(
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 20,
            color: MyColors.myWhite,
            shadows: [
              Shadow(
                blurRadius: 7,
                color: MyColors.myYellow,
                offset: Offset(0, 0),
              )
            ],
          ),
          child: AnimatedTextKit(
            repeatForever: true,
            animatedTexts: [
              FlickerAnimatedText(quotes[randomQuoteIndex].quote),
            ],
          ),
        ),
      );
    } else {
      return Container();
    }
  }

  Widget showProgressIndicator() {
    return const Center(
      child: CircularProgressIndicator(
        color: MyColors.myYellow,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CharactersCubit>(context)
    .getQuotes(character.name);
    return Scaffold(
      backgroundColor: MyColors.myGrey,
      body: CustomScrollView(
        slivers: [
          buildSliverAppBar(),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  margin:const EdgeInsets.fromLTRB(14, 14, 14, 0),
                  padding:const EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      characterInfo('Job : ', character.occupation.join(' / ')),
                      buildDivider(315),
                      characterInfo('Appeared in : ', character.category),
                      buildDivider(250),
                      characterInfo(
                          'Seasons : ', character.appearance.join(' / ')),
                      buildDivider(280),
                      characterInfo('Status : ', character.status),
                      buildDivider(300),
                      character.appearanceInBCS.isEmpty
                          ? Container()
                          : characterInfo('Better Call Saul Seasons : ',
                              character.appearanceInBCS.join(" / ")),
                      character.appearanceInBCS.isEmpty
                          ? Container()
                          : buildDivider(150),
                      characterInfo('Actor/Actress : ', character.portrayed),
                      buildDivider(235),
                      const SizedBox(
                        height: 20,
                      ),
                      BlocBuilder<CharactersCubit, CharactersState>(
                        builder: (context, state) {
                          return checkIfQuotesAreLoaded(state);
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 500,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
