import 'package:finfree_interview_app/models/price_entry_list_of_period.dart';
import 'package:finfree_interview_app/pages/home_page_items/home_page_bloc.dart';
import 'package:finfree_interview_app/pages/home_page_items/home_page_manage_model.dart';
import 'package:finfree_interview_app/shared/bloc/bloc_provider.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    HomePageBloc homePageBloc = BlocProvider.of<HomePageBloc>(context);
    HomePageManageModel homePageManageModel = Provider.of<HomePageManageModel>(context, listen: false);
    homePageBloc.fetchAllData();
    return Scaffold(
      backgroundColor: Color(0xFF1C1C2C),
      body: StreamBuilder(
          stream: homePageBloc.priceEntryListOfPeriodStream,
          builder: (context, AsyncSnapshot<PriceEntryListOfPeriod> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Container();
            }
            if (snapshot.data == null) {
              return Container();
            }

            //We fetch the data model to HomePageManageModel class for manage the business logic.
            homePageManageModel.fetchLineChartData(snapshot.data);
            return Consumer<HomePageManageModel>(builder: (context, data, _) {
              return Stack(
                children: <Widget>[
                  Positioned(
                    top: MediaQuery.of(context).size.height * 1 / 10,
                    left: 16,
                    right: 16,
                    child: Row(
                      children: <Widget>[
                        Text(
                          'AKBNK',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        Spacer(),
                        Text(
                          data.currentValue.toString() + '₺',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height * 1.5 / 10,
                    height: MediaQuery.of(context).size.height * 3 / 10,
                    left: 16,
                    right: 16,
                    child: LineChart(
                      LineChartData(
                        borderData: FlBorderData(
                          border: Border.all(color: Color(0xFF1F1CC), width: 2),
                        ),
                        gridData: FlGridData(show: false),
                        minX: data.minX,
                        maxX: data.maxX,
                        minY: data.minY - 0.01,
                        maxY: data.maxY + 0.01,
                        titlesData: FlTitlesData(show: false),
                        backgroundColor: Color(0xFF1C1C1C),
                        lineBarsData: [data.lineChartBarData],
                        // read about it in the below section
                      ),
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height * 5 / 10,
                    left: 16,
                    right: 16,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        //I recommend using Listview.builder instead of this.

                        GestureDetector(
                          onTap: () {
                            data.currentPeriod = PERIOD.l1G;
                          },
                          child: Container(
                            child: Text(
                              '1G',
                              style: TextStyle(
                                  color: data.currentPeriod == PERIOD.l1G ? Colors.amber : Colors.white, fontSize: 20),
                            ),
                            padding: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.white,
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            data.currentPeriod = PERIOD.l1H;
                          },
                          child: Container(
                            child: Text(
                              '1H',
                              style: TextStyle(
                                  color: data.currentPeriod == PERIOD.l1H ? Colors.amber : Colors.white, fontSize: 20),
                            ),
                            padding: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.white,
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            data.currentPeriod = PERIOD.l1A;
                          },
                          child: Container(
                            child: Text(
                              '1A',
                              style: TextStyle(
                                  color: data.currentPeriod == PERIOD.l1A ? Colors.amber : Colors.white, fontSize: 20),
                            ),
                            padding: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.white,
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            data.currentPeriod = PERIOD.l3A;
                          },
                          child: Container(
                            child: Text(
                              '3A',
                              style: TextStyle(
                                  color: data.currentPeriod == PERIOD.l3A ? Colors.amber : Colors.white, fontSize: 20),
                            ),
                            padding: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.white,
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            data.currentPeriod = PERIOD.l1Y;
                          },
                          child: Container(
                            child: Text(
                              '1Y',
                              style: TextStyle(
                                  color: data.currentPeriod == PERIOD.l1Y ? Colors.amber : Colors.white, fontSize: 20),
                            ),
                            padding: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.white,
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            data.currentPeriod = PERIOD.l5Y;
                          },
                          child: Container(
                            child: Text(
                              '5Y',
                              style: TextStyle(
                                  color: data.currentPeriod == PERIOD.l5Y ? Colors.amber : Colors.white, fontSize: 20),
                            ),
                            padding: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.white,
                              ),
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            });
          }),
    );
  }
}
