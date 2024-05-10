// import 'package:flutter/material.dart';

// class FavBody extends StatefulWidget {
//   const FavBody({super.key});

//   @override
//   State<FavBody> createState() => _FavBodyState();
// }

// class _FavBodyState extends State<FavBody> {
//   @override
//   Widget build(BuildContext context) {
//     return favList.isNotEmpty
//         ? ListView(
//             physics: BouncingScrollPhysics(),
//             children: [
//               SizedBox(
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: ListView.separated(
//                       shrinkWrap: true,
//                       physics: BouncingScrollPhysics(),
//                       separatorBuilder: (context, index) => Padding(
//                             padding: const EdgeInsets.symmetric(
//                                 horizontal: 50.0, vertical: 8),
//                             child: Divider(
//                               thickness: 2,
//                             ),
//                           ),
//                       itemCount: favList.length,
//                       scrollDirection: Axis.vertical,
//                       itemBuilder: (context, index) => GestureDetector(
//                             onTap: () => Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) => ItemScreen(
//                                       index: index,
//                                       desc: searchCubit
//                                           .searchModel?.datalIST[index].desc,
//                                       img: searchCubit
//                                           .searchModel?.datalIST[index].image,
//                                       text: searchCubit
//                                           .searchModel?.datalIST[index].name,
//                                       price: searchCubit
//                                           .searchModel?.datalIST[index].price),
//                                 )),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               children: [
//                                 FadeInImage.assetNetwork(
//                                   placeholder:
//                                       "assets/images/imgplaceholder.png",
//                                   image: favList.elementAt(index)['image'],
//                                   height: 100,
//                                   width: 100,
//                                 ),
//                                 Expanded(
//                                   child: Column(children: [
//                                     Text(
//                                       favList.elementAt(index)['name'],
//                                       maxLines: 2,
//                                       overflow: TextOverflow.ellipsis,
//                                       style: TextStyle(fontSize: 20),
//                                     ),
//                                     SizedBox(
//                                       height: 10,
//                                     ),
//                                     Padding(
//                                       padding: const EdgeInsets.all(8.0),
//                                       child: Row(children: [
//                                         Text(
//                                           "${favList.elementAt(index)['price']} LE",
//                                           style: TextStyle(
//                                               color: AppColors.MainColor),
//                                         ),
//                                         Spacer(),
//                                         IconButton(
//                                           icon: Icon(Icons.favorite,
//                                               color: AppColors.SecondaryColor),
//                                           onPressed: () {
//                                             favList.remove(
//                                                 favList.elementAt(index));
//                                             Fluttertoast.showToast(
//                                               msg: "Favourite removed",
//                                               toastLength: Toast.LENGTH_SHORT,
//                                               timeInSecForIosWeb: 1,
//                                               backgroundColor: AppColors
//                                                   .MainColor.withOpacity(0.7),
//                                               textColor: Colors.white,
//                                               fontSize: 16.0,
//                                               gravity: ToastGravity.CENTER,
//                                             );

//                                             setState(() {});
//                                           },
//                                         )
//                                       ]),
//                                     ),
//                                   ]),
//                                 )
//                               ],
//                             ),
//                           )),
//                 ),
//               ),
//             ],
//           )
//         : Center(
//             child: Text(
//               "Add items you love !",
//               style: TextStyle(
//                   fontSize: 30,
//                   fontWeight: FontWeight.w500,
//                   color: Colors.black.withOpacity(.5)),
//             ),
//           );
//   }
// }
