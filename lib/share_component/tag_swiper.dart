import 'package:clickcart/features/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TagSwiper extends StatelessWidget {

  TagSwiper({ super.key });

  final List<String> tagItems = [
    "Deal of the day",
    "🔥Hot Deals",
    "Best Sellers",
    "New Arrivals",
    "Deal of the day",
    "🔥Hot Deals",
    "Best Sellers",
    "New Arrivals",
    "Deal of the day",
  ];

  @override
  Widget build(BuildContext context){
    return GetBuilder<HomeController>(
      initState: (state) {

      },
      builder: (_) {
        int length=_.topMenuBar.data!.menuBars!.length??0;


        return Container(
          // margin: const EdgeInsets.only(bottom: 10),
          color: Theme.of(context).cardColor,
          height: 40,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child:  length==0?SizedBox(): Row(
              children: _.topMenuBar.data!.menuBars!.map((item) {
                return
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(item.name??'',style: Theme.of(context).textTheme.titleSmall),
                  );
              }).toList(),
            )
          ),
        );
      }
    );
  }
}