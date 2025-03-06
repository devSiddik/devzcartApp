import 'package:clickcart/components/charts/bar_chart.dart';
import 'package:clickcart/components/charts/line_chart.dart';
import 'package:clickcart/components/charts/pie_chart.dart';
import 'package:clickcart/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class Charts extends StatelessWidget {
  const Charts({ super.key });

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(IKSizes.container, IKSizes.headerHeight), 
        child: Container(
          alignment: Alignment.center,
          child: Container(
            constraints: const BoxConstraints(
              maxWidth: IKSizes.container
            ),
            child: AppBar(
              title: const Text('Charts'),
              titleSpacing: 5,
            ),
          ),
        )
      ),
      body: Container(
        alignment: Alignment.topCenter,
        child: Container(
          constraints: const BoxConstraints(
            maxWidth: IKSizes.container,
          ),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 15),
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(IKSizes.borderRadiusSm)
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border(bottom: BorderSide(width: 1,color: Theme.of(context).dividerColor))
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 15),
                        child: Text('Line Chart',style: Theme.of(context).textTheme.titleLarge),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: LineChartView(),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 15),
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(IKSizes.borderRadiusSm)
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border(bottom: BorderSide(width: 1,color: Theme.of(context).dividerColor))
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 15),
                        child: Text('Bar Chart',style: Theme.of(context).textTheme.titleLarge),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(15),
                        child: BarChartView(),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 15),
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(IKSizes.borderRadiusSm)
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border(bottom: BorderSide(width: 1,color: Theme.of(context).dividerColor))
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 15),
                        child: Text('Pie Chart',style: Theme.of(context).textTheme.titleLarge),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(15),
                        child: PieChartView(),
                      )
                    ],
                  ),
                ),
              ]
            ),
          ),
        ),
      ),
    );
  }
}