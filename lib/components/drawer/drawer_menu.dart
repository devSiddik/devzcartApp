import 'package:clickcart/utils/constants/colors.dart';
import 'package:clickcart/utils/constants/images.dart';
import 'package:clickcart/utils/constants/svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DrawerMenu extends StatefulWidget {
  const DrawerMenu({ super.key });

  @override
  State<DrawerMenu> createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  final List<Map<String, String>> menuItems = [
    {'name': 'Home', 'icon': IKSvg.home, 'navigate' : '/main_home'},
    {'name': 'Products', 'icon': IKSvg.bag, 'navigate' : '/products'},
    {'name': 'Components', 'icon': IKSvg.grid2, 'navigate' : '/components'},
    // {'name': 'Pages', 'icon': IKSvg.diamond, 'navigate' : '/main_home'},
    {'name': 'Featured', 'icon': IKSvg.star, 'navigate' : '/categories'},
    {'name': 'Wishlist', 'icon': IKSvg.wishlist, 'navigate' : '/wishlist'},
    {'name': 'Orders', 'icon': IKSvg.receipt, 'navigate' : '/my_orders'},
    {'name': 'My Cart', 'icon': IKSvg.cart, 'navigate' : '/cart'},
    {'name': 'Profile', 'icon': IKSvg.user, 'navigate' : '/profile'},
    {'name': 'Logout', 'icon': IKSvg.signout, 'navigate' : '/signin'},
  ];

  @override
  Widget build(BuildContext context){
    
    return Container(
      color: Theme.of(context).cardColor,
      child: Drawer(
        backgroundColor: Theme.of(context).cardColor,
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(width: 1,color: Theme.of(context).dividerColor))
                    ),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(IKImages.profile,height: 60,width: 60),
                        ),
                        const SizedBox(width: 15),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text('James Smith',style: Theme.of(context).textTheme.headlineMedium),
                              const SizedBox(height: 3),
                              Text('example@gmail.com',style: Theme.of(context).textTheme.bodyMedium?.merge(const TextStyle(color: IKColors.primary,fontSize: 15))),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      children: menuItems.map((item) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, item['navigate']!);
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Row(
                              children: [
                                Container(
                                  height: 40,
                                  width: 40,
                                  margin: const EdgeInsets.only(right: 15),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    border: Border.all(width: 1,color: Theme.of(context).dividerColor)
                                  ),
                                  alignment: Alignment.center,
                                  // ignore: deprecated_member_use
                                  child: SvgPicture.string(item['icon']!,height: 16,width: 16,color: IKColors.primary),
                                ),
                                Expanded(
                                  child: Text(item['name']!,style: Theme.of(context).textTheme.titleLarge?.merge(const TextStyle(fontWeight: FontWeight.w400))),
                                ),
                                Icon(Icons.chevron_right,color: Theme.of(context).textTheme.bodyMedium?.color)
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                border: Border(top: BorderSide(width: 1,color: Theme.of(context).dividerColor))
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: "ClickCart",
                            children: const <TextSpan>[
                                TextSpan(
                                  text: ' ecommerce store',
                                  style: TextStyle(fontWeight: FontWeight.w400)
                                )
                            ],
                            style: Theme.of(context).textTheme.titleMedium?.merge(const TextStyle(fontSize: 13))
                          ),
                        ),
                        Text('App Version 1.0',style: Theme.of(context).textTheme.titleMedium?.merge(const TextStyle(fontWeight: FontWeight.w400,fontSize: 13))),
                      ],
                    ),
                  ),
                ],
              )
            ),
          ]
        ),
      ),
    );
  }
}