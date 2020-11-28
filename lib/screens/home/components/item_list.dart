import 'package:flutter/material.dart';
import 'package:food_app/provider/auth_service.dart';
import 'package:food_app/screens/details/details-screen.dart';
import 'package:food_app/screens/home/components/item_card.dart';
import 'package:provider/provider.dart';

class ItemList extends StatefulWidget {
  const ItemList({
    Key key,
  }) : super(key: key);

  @override
  _ItemListState createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  bool _isLoading = true;
  bool isLoading = false;

  int paging = 1;

  @override
  void initState() {
    super.initState();
    _initData();
  }

  _initData() async {
    await Provider.of<AuthService>(context, listen: false).getRestaurants();
    _isLoading = false;
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var list = Provider.of<AuthService>(context, listen: false).restaurantsList;
    return _isLoading
        ? Container(
            child: Center(child: Text('loading .....')),
          )
        : ListView.builder(
//                              controller: _scrollController,
//                 reverse: true,
            padding: EdgeInsets.only(top: 15.0),
            itemCount: list.length,
            itemBuilder: (BuildContext context, int index) {
              return ItemCard(
                svgSrc: list[index].image,
                title: list[index].name,
                shopName: '${list[index].city}   ${list[index].phone}',
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return DetailsScreen(list[index]);
                      },
                    ),
                  );
                },
              );
            },
          );
  }
}
