import 'package:cached_network_image/cached_network_image.dart';
import 'package:eshop_multivendor/Helper/Session.dart';
import 'package:eshop_multivendor/Model/Section_Model.dart';
import 'package:flutter/material.dart';
import 'package:eshop_multivendor/Helper/Color.dart';
import 'ProductList.dart';

class SubCategory extends StatelessWidget {
  final List<Product>? subList;
  final String title;
  final String? catId;
  final String? catImage;
  const SubCategory({Key? key,this.catImage,this.catId ,this.subList, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: getAppBar(title, context),
      body: ListView(
        shrinkWrap: true,
        children: [
       // catImage ==  null || catImage == "" ? SizedBox.shrink() :  Container(
       //      height: 150,
       //      margin: EdgeInsets.only(left: 10,right: 10,top: 10),
       //      width: MediaQuery.of(context).size.width,
       //      child:  ClipRRect(
       //        borderRadius: BorderRadius.circular(10.0),
       //          child: catImage == null || catImage == "" ? SizedBox.shrink() : Image.network("${catImage}",fit: BoxFit.fill,),
       //        // child: new FadeInImage(
       //        //   fadeInDuration: Duration(milliseconds: 150),
       //        //   image: CachedNetworkImageProvider(
       //        //     catImage.toString(),
       //        //   ),
       //        //   height: 60.0,
       //        //   width: 60.0,
       //        //   fit: BoxFit.fill,
       //        //   imageErrorBuilder:
       //        //       (context, error, stackTrace) =>
       //        //       erroWidget(50),
       //        //   placeholder: placeHolder(50),
       //        // ),
       //      ),
       //    ),
          GridView.count(
            physics: ScrollPhysics(),
              padding: EdgeInsets.all(20),
              crossAxisCount: 3,
              shrinkWrap: true,
              childAspectRatio: .75,
              children: List.generate(
                subList!.length,
                (index) {
                  return subCatItem(index, context);
                },
              )),
        ],
      ),
    );
  }

  subCatItem(int index, BuildContext context) {
    return GestureDetector(
      child: Column(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: FadeInImage(
                    image: CachedNetworkImageProvider(subList![index].image!),
                    fadeInDuration: Duration(milliseconds: 150),
                    imageErrorBuilder: (context, error, stackTrace) =>
                        erroWidget(50),
                    placeholder: placeHolder(50),
                  )),
            ),
          ),
          Text(
            subList![index].name! + "\n",
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context)
                .textTheme
                .caption!
                .copyWith(color: Theme.of(context).colorScheme.fontColor),
          )
        ],
      ),
      onTap: () {
        if (subList![index].subList == null ||
            subList![index].subList!.length == 0) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductList(
                  name: subList![index].name,
                  //Added value
                  id: "${int.parse(subList![index].id.toString())}",
                  tag: false,
                  fromSeller: false,
                  catId: "${catId.toString()}",
                ),
              ));
        } else {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SubCategory(
                  catId: catId,
                  subList: subList![index].subList,
                  title: subList![index].name ?? "",
                ),
              ));
        }
      },
    );
  }
}
