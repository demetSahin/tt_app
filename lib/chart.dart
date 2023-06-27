import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Chart extends StatefulWidget {
  const Chart({
    Key? key,
    required this.visits,
    required this.name,
    required this.imagePath,
  }) : super(key: key);

  final List visits;
  final String name, imagePath;

  @override
  _ChartState createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  late Set<int> years;
  late List<int> months;
  late List<List<double>> all;
  late List<int> yearsList;
  late List<List<ChartData>> data;

  @override
  void initState() {
    super.initState();
    years = Set();
    yearsList = [];
    all = [];
    data = [];

    debugPrint("widget.visits: " + widget.visits.toString());
    for (int i = 0; i < widget.visits.length; ++i) {
      years.add(widget.visits[i]["visitTime"].toDate().year);
      debugPrint("years: " + years.toString());
    }

    yearsList = years.toList();
    yearsList.sort();
    debugPrint("yearsList: " + yearsList.toString());
    for (int i = 0; i < yearsList.length; ++i) {
      debugPrint("yearsList[$i]: " + yearsList[i].toString());
      double jan = 0,
          feb = 0,
          mar = 0,
          apr = 0,
          may = 0,
          jun = 0,
          jul = 0,
          aug = 0,
          sep = 0,
          oct = 0,
          nov = 0,
          dec = 0;
      for (int j = 0; j < widget.visits.length; ++j) {
        if (yearsList[i] == widget.visits[j]["visitTime"].toDate().year) {
          if (widget.visits[j]["visitTime"].toDate().month == 1) {
            jan = jan + 1;
          } else if (widget.visits[j]["visitTime"].toDate().month == 2) {
            feb = feb + 1;
          } else if (widget.visits[j]["visitTime"].toDate().month == 3) {
            mar = mar + 1;
          } else if (widget.visits[j]["visitTime"].toDate().month == 4) {
            apr = apr + 1;
          } else if (widget.visits[j]["visitTime"].toDate().month == 5) {
            may = may + 1;
          } else if (widget.visits[j]["visitTime"].toDate().month == 6) {
            jun = jun + 1;
          } else if (widget.visits[j]["visitTime"].toDate().month == 7) {
            jul = jul + 1;
          } else if (widget.visits[j]["visitTime"].toDate().month == 8) {
            aug = aug + 1;
          } else if (widget.visits[j]["visitTime"].toDate().month == 9) {
            sep = sep + 1;
          } else if (widget.visits[j]["visitTime"].toDate().month == 10) {
            oct = oct + 1;
          } else if (widget.visits[j]["visitTime"].toDate().month == 11) {
            nov = nov + 1;
          } else if (widget.visits[j]["visitTime"].toDate().month == 12) {
            dec = dec + 1;
          }
        }
      }
      all.add([jan, feb, mar, apr, may, jun, jul, aug, sep, oct, nov, dec]);
    }
    debugPrint("all: " + all.toString());

    for (int i = 0; i < all.length; ++i) {
      List<ChartData> inner = [];
      for (int j = 0; j < all[i].length; ++j) {
        if (all[i][j] != 0) {
          String month = "";
          if (j == 0)
            month = "Ocak";
          else if (j == 1)
            month = "Şubat";
          else if (j == 2)
            month = "Mart";
          else if (j == 3)
            month = "Nisan";
          else if (j == 4)
            month = "Mayıs";
          else if (j == 5)
            month = "Haziran";
          else if (j == 6)
            month = "Temmuz";
          else if (j == 7)
            month = "Ağustos";
          else if (j == 8)
            month = "Eylül";
          else if (j == 9)
            month = "Ekim";
          else if (j == 10)
            month = "Kasım";
          else if (j == 11) month = "Aralık";
          inner.add(
            ChartData(month, all[i][j]),
          );
        }
      }
      data.add(inner);
    }
  }

  @override
  Widget build(BuildContext context) {
    //yearsList = yearsList.reversed;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(190, 232, 246, 1),
          leading: Padding(
            padding: const EdgeInsets.all(6.0),
            child: Hero(
              tag: widget.name,
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(252, 215, 157, 1),
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                  border: Border.all(),
                ),
                padding: const EdgeInsets.all(4.0),
                child: Image.asset(
                  widget.imagePath,
                ),
              ),
            ),
          ),
          title: Text('${widget.name} Ziyaretçi İstatistikleri'),
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            //Initialize the chart widget
            for (int i = 0; i < /*years*/ yearsList.length; ++i)
              SfCartesianChart(
                primaryXAxis: CategoryAxis(),
                primaryYAxis: NumericAxis(interval: 1.0),
                title: ChartTitle(text: yearsList[i].toString()),
                legend: Legend(isVisible: true),
                tooltipBehavior: TooltipBehavior(enable: true),
                series: <ChartSeries<ChartData, String>>[
                  LineSeries<ChartData, String>(
                    dataSource: data[i],
                    xValueMapper: (ChartData visit, _) => visit.month,
                    yValueMapper: (ChartData visit, _) => visit.visits,
                    name: 'Ziyaretçi\nSayısı',
                    dataLabelSettings: DataLabelSettings(isVisible: true),
                  )
                ],
              ),
          ]),
        ));
  }
}

class ChartData {
  ChartData(this.month, this.visits);

  final String month;
  final double visits;
}
