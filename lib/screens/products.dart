import 'package:api_intregrations/Models/product.dart';
import 'package:api_intregrations/services/product_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ProductsData extends StatefulWidget {
  const ProductsData({Key? key}) : super(key: key);

  @override
  State<ProductsData> createState() => _ProductsDataState();
}

class _ProductsDataState extends State<ProductsData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<ProductsModel>(
                future: getProductsApi(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: snapshot.data.hashCode,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * .25,
                                width: MediaQuery.of(context).size.width * .25,
                                child: ListView.builder(
                                    itemBuilder: (context, position) {
                                  return Container(
                                    height:
                                        MediaQuery.of(context).size.height * .5,
                                    width:
                                        MediaQuery.of(context).size.width * .2,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(snapshot
                                              .data.hashCode.hashCode
                                              .toString())),
                                    ),
                                  );
                                }),
                              )
                            ],
                          );
                        });
                  } else {
                    return CircularProgressIndicator();
                  }
                }),
          )
        ],
      ),
    );
  }
}
