import 'package:aishop/addons/popop_menu_consts.dart';
import 'package:aishop/icons/icons.dart';
import 'package:aishop/navigation/locator.dart';
import 'package:aishop/navigation/routing/route_names.dart';
import 'package:aishop/screens/cart/components/order_review.dart';
import 'package:aishop/services/navigation_service.dart';
import 'package:aishop/styles/theme.dart';
import 'package:aishop/utils/prod_num_badges.dart';
import 'package:aishop/widgets/appbar/appbar.dart';
import 'package:aishop/widgets/appbar/choice_action.dart';
import 'package:aishop/widgets/books/books.dart';
import 'package:aishop/widgets/category/category.dart';
import 'package:aishop/widgets/clothes/clothes.dart';
import 'package:aishop/widgets/kitchen/kitchen.dart';
import 'package:aishop/widgets/recommendations/recommendations.dart';
import 'package:aishop/widgets/shoes/shoes.dart';
import 'package:aishop/widgets/tech/tech.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isSearching = false;

  @override
  Widget build(BuildContext context) {
    contxt = context;
    updateCartTotal();
    return Scaffold(
        backgroundColor: lightestgrey,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60.0),
          child: AppBar(
              backgroundColor: lightblack,
              titleSpacing: 0.0,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    width: 8,
                  ),
                  Icon(
                    AIicons.chip,
                    color: Colors.white,
                    size: 30,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    "AI Shopping",
                    style: TextStyle(color: white, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  IconButton(
                    icon: Icon(
                      AIicons.search,
                      color: Colors.white,
                      size: 25,
                    ),
                    onPressed: () {
                      setState(() {
                        this.isSearching = true;
                        locator<NavigationService>()
                            .globalNavigateTo(SearchRoute, context);
                      });
                    },
                  ),
                ],
              ),
              automaticallyImplyLeading: false,
              actions: [
                IconButton(
                  icon: Badge(
                    badgeContent: Num_Of_Prod_in_Wishlist(),
                    toAnimate: true,
                    animationType: BadgeAnimationType.scale,
                    child: Icon(
                      AIicons.wishlist,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  onPressed: () {
                    locator<NavigationService>()
                        .globalNavigateTo(WishlistRoute, context);

                  },
                ),
                Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: IconButton(
                      icon: Badge(
                        toAnimate: true,
                        animationType: BadgeAnimationType.scale,
                        badgeContent: Num_Of_Prod_in_Cart(),
                        child: Icon(
                          AIicons.cart,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                      onPressed: () {
                        locator<NavigationService>()
                            .globalNavigateTo(CheckOutRoute, context);
                      },
                    )),
                Padding(
                  padding: EdgeInsets.fromLTRB(5, 0, 20, 0),
                  child: PopupMenuButton<String>(
                    child: Center(
                        child: Icon(
                      AIicons.profile,
                      size: 30,
                    )),
                    itemBuilder: (context) {
                      return Constants.choices.map((String choice) {
                        return PopupMenuItem<String>(
                          child: Text(choice),
                          value: choice,
                        );
                      }).toList();
                    },
                    onSelected: choiceAction,
                  ),
                ),
              ],
              iconTheme: IconThemeData(color: white)),
        ),

        //Body of the home page
        body: ListView(
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            //category
            Center(
              child: Text(
                "Categories",
                style: TextStyle(fontSize: 40),
              ),
            ),
            Category(),
            SizedBox(
              height: 10,
            ),

            //Products
            Center(
              child: Text(
                "Recommendations",
                style: TextStyle(fontSize: 40),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Recommendations(),
            SizedBox(
              height: 10,
            ),
            Center(
                child: Text(
              "Books",
              style: TextStyle(fontSize: 40),
            )),

            SizedBox(
              height: 10,
            ),
            Books(),

            SizedBox(
              height: 10,
            ),
            Center(
                child: Text(
              "Clothes",
              style: TextStyle(fontSize: 40),
            )),

            SizedBox(
              height: 10,
            ),
            Clothes(),

            SizedBox(
              height: 10,
            ),

            Center(
                child: Text(
              "Shoes",
              style: TextStyle(fontSize: 40),
            )),
            Shoes(),
            SizedBox(
              height: 10,
            ),

            Center(
                child: Text(
              "Kitchen",
              style: TextStyle(fontSize: 40),
            )),
            SizedBox(
              height: 10,
            ),
            Kitchen(),
            SizedBox(
              height: 10,
            ),
            Center(
                child: Text(
              "Tech",
              style: TextStyle(fontSize: 40),
            )),
            SizedBox(
              height: 10,
            ),
            Tech(),

            SizedBox(
              height: 10,
            ),
          ],
        ));
  }
}
