import 'package:finfree_interview_app/models/price_entry.dart';
import 'package:finfree_interview_app/models/price_entry_list_of_period.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
enum PERIOD{
  l1G,
  l1H,
  l1A,
  l3A,
  l1Y,
  l5Y,
}
class HomePageManageModel extends ChangeNotifier{

  var _currentPeriod = PERIOD.l1G;
  var _currentValue;
  PriceEntryListOfPeriod priceEntryListOfPeriod;
  double _minX = 0;
  double _maxX = 0;
  double _minY = 0;
  double _maxY = 0;
  LineChartBarData _lineChartBarData;

  get currentValue => _currentValue;

  set currentValue(value) {
    _currentValue = value;
  }

  LineChartBarData get lineChartBarData => _lineChartBarData;

  set lineChartBarData(LineChartBarData value) {
    _lineChartBarData = value;
  }

  double get minX => _minX;

  set minX(double value) {
    _minX = value;
  }

  HomePageManageModel();


  get currentPeriod => _currentPeriod;

  set currentPeriod(value) {
    if(value != currentPeriod){
      _currentPeriod = value;
      fetchLineChartData(priceEntryListOfPeriod);
    }
  }
  fetchLineChartData(PriceEntryListOfPeriod value){
    priceEntryListOfPeriod = value;
    currentValue = priceEntryListOfPeriod.l1G.last.c;

    //We process and notify the incoming data according to the currentPeriod value.
    switch(currentPeriod){
      case PERIOD.l1G:
        maxX = priceEntryListOfPeriod.l1G.length.toDouble();
        List<PriceEntry> listMaxYSort =  priceEntryListOfPeriod.l1G.toList();
        listMaxYSort.sort((p1,p2) => p1.c.compareTo(p2.c));
        maxY = listMaxYSort.last.c;
        minY = listMaxYSort.first.c;
        Color lineColor = priceEntryListOfPeriod.l1G.first.c > priceEntryListOfPeriod.l1G.last.c ? Colors.red : Color(0xFF00E091);
        List<FlSpot> flSpotList = new List();
        for(int index = 0;index<priceEntryListOfPeriod.l1G.length;index++){
          flSpotList.add(FlSpot(index.toDouble(),priceEntryListOfPeriod.l1G[index].c));
        }
        lineChartBarData = LineChartBarData(
          colors: [lineColor],
          dotData: FlDotData(show: false),
          isCurved: true,
          spots: flSpotList,
        );
        break;

      case PERIOD.l1H:
        maxX = priceEntryListOfPeriod.l1H.length.toDouble();
        List<PriceEntry> listMaxYSort =  priceEntryListOfPeriod.l1H.toList();
        listMaxYSort.sort((p1,p2) => p1.c.compareTo(p2.c));
        maxY = listMaxYSort.last.c;
        minY = listMaxYSort.first.c;
        Color lineColor = priceEntryListOfPeriod.l1H.first.c > priceEntryListOfPeriod.l1H.last.c ? Colors.red : Color(0xFF00E091);
        List<FlSpot> flSpotList = new List();
        for(int index = 0;index<priceEntryListOfPeriod.l1H.length;index++){
          flSpotList.add(FlSpot(index.toDouble(),priceEntryListOfPeriod.l1H[index].c));
        }
        lineChartBarData = LineChartBarData(
          colors: [lineColor],
          dotData: FlDotData(show: false),
          isCurved: true,
          spots: flSpotList,
        );
        break;
      case PERIOD.l1A:
        maxX = priceEntryListOfPeriod.l1A.length.toDouble();
        List<PriceEntry> listMaxYSort =  priceEntryListOfPeriod.l1A.toList();
        listMaxYSort.sort((p1,p2) => p1.c.compareTo(p2.c));
        maxY = listMaxYSort.last.c;
        minY = listMaxYSort.first.c;
        Color lineColor = priceEntryListOfPeriod.l1A.first.c > priceEntryListOfPeriod.l1A.last.c ? Colors.red : Color(0xFF00E091);
        List<FlSpot> flSpotList = new List();
        for(int index = 0;index<priceEntryListOfPeriod.l1A.length;index++){
          flSpotList.add(FlSpot(index.toDouble(),priceEntryListOfPeriod.l1A[index].c));
        }
        lineChartBarData = LineChartBarData(
          colors: [lineColor],
          dotData: FlDotData(show: false),
          isCurved: true,
          spots: flSpotList,
        );
        break;
      case PERIOD.l3A:
        maxX = priceEntryListOfPeriod.l3A.length.toDouble();
        List<PriceEntry> listMaxYSort =  priceEntryListOfPeriod.l3A.toList();
        listMaxYSort.sort((p1,p2) => p1.c.compareTo(p2.c));
        maxY = listMaxYSort.last.c;
        minY = listMaxYSort.first.c;
        Color lineColor = priceEntryListOfPeriod.l1A.first.c > priceEntryListOfPeriod.l1A.last.c ? Colors.red : Color(0xFF00E091);
        List<FlSpot> flSpotList = new List();
        for(int index = 0;index<priceEntryListOfPeriod.l3A.length;index++){
          flSpotList.add(FlSpot(index.toDouble(),priceEntryListOfPeriod.l3A[index].c));
        }
        lineChartBarData = LineChartBarData(
          colors: [lineColor],
          dotData: FlDotData(show: false),
          isCurved: true,
          spots: flSpotList,
        );
        break;
      case PERIOD.l1Y:
        maxX = priceEntryListOfPeriod.l1Y.length.toDouble();
        List<PriceEntry> listMaxYSort =  priceEntryListOfPeriod.l1Y.toList();
        listMaxYSort.sort((p1,p2) => p1.c.compareTo(p2.c));
        maxY = listMaxYSort.last.c;
        minY = listMaxYSort.first.c;
        Color lineColor = priceEntryListOfPeriod.l1A.first.c > priceEntryListOfPeriod.l1A.last.c ? Colors.red : Color(0xFF00E091);
        List<FlSpot> flSpotList = new List();
        for(int index = 0;index<priceEntryListOfPeriod.l1Y.length;index++){
          flSpotList.add(FlSpot(index.toDouble(),priceEntryListOfPeriod.l1Y[index].c));
        }
        lineChartBarData = LineChartBarData(
          colors: [lineColor],
          dotData: FlDotData(show: false),
          isCurved: true,
          spots: flSpotList,
        );
        break;
      case PERIOD.l5Y:
        maxX = priceEntryListOfPeriod.l5Y.length.toDouble();
        List<PriceEntry> listMaxYSort =  priceEntryListOfPeriod.l5Y.toList();
        listMaxYSort.sort((p1,p2) => p1.c.compareTo(p2.c));
        maxY = listMaxYSort.last.c;
        minY = listMaxYSort.first.c;
        Color lineColor = priceEntryListOfPeriod.l5Y.first.c > priceEntryListOfPeriod.l5Y.last.c ? Colors.red : Color(0xFF00E091);
        List<FlSpot> flSpotList = new List();
        for(int index = 0;index<priceEntryListOfPeriod.l5Y.length;index++){
          flSpotList.add(FlSpot(index.toDouble(),priceEntryListOfPeriod.l5Y[index].c));
        }
        lineChartBarData = LineChartBarData(
          colors: [lineColor],
          dotData: FlDotData(show: false),
          isCurved: true,
          spots: flSpotList,
        );
        break;
    }
    notifyListeners();
  }

  double get maxX => _maxX;

  set maxX(double value) {
    _maxX = value;
  }

  double get minY => _minY;

  set minY(double value) {
    _minY = value;
  }

  double get maxY => _maxY;

  set maxY(double value) {
    _maxY = value;
  }
}