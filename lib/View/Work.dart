import 'package:employeee/Controller/Theme_service.dart';
import 'package:employeee/View/SideBarWidget.dart';
import 'package:flutter/material.dart';
import 'package:sidebarx/sidebarx.dart';

import '../Controller/RequestController.dart';
class Work extends StatefulWidget {
  const Work({Key? key}) : super(key: key);

  @override
  State<Work> createState() => _WorkState();
}

class _WorkState extends State<Work> {
  final _controller = SidebarXController(selectedIndex: 0,extended: false);
  final checkInOutData = [
    {'employee': 'John Doe', 'status': '1'},
    {'employee': 'Jane Smith', 'status': 'true'},
    {'employee': 'Bob Johnson', 'status': '1'},
    {'employee': 'Alice Brown', 'status': 'false'},
  ];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    final isSmallScreen = width < 600 ;

    return Row(
      children: [
        if (!isSmallScreen)SideBarWidget(controller: _controller),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20,),
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Daily Work Present',style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width<430? 30:50
                      ),),
                    ),
                  ),
                ),
                SizedBox(height: 10.5,),

                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    border: BorderDirectional()
                  ),
                    child: CheckInOutTable(checkInOutData: checkInOutData)),


              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget datatable(text){
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(),
        child: Text(text,style: TextStyle(
            fontWeight: FontWeight.bold,color: ThemeService().isSavedDarkMode()?Colors.white:Colors.black
        ),) ,
      ),
    );
  }
  Widget tableHeader(text){
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(),
        child: Text(text,style: TextStyle(
          fontWeight: FontWeight.bold,color: ThemeService().isSavedDarkMode()?Colors.white54:Colors.grey.shade500
        ),) ,
      ),
    );
  }
}
class CheckInOutTable extends StatelessWidget {
  final List<Map<String, dynamic>> checkInOutData;

  const CheckInOutTable({Key? key, required this.checkInOutData}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    String userid = "asdf";

    return FutureBuilder(
        future: RequestController(),
    builder:(BuildContext context, AsyncSnapshot snapshot) {
    if(snapshot.hasData){
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: DataTable(
          decoration: BoxDecoration(



          ),
          columnSpacing: MediaQuery.of(context).size.width/3.8,
          dataRowHeight: 50,
          columns: const [
            DataColumn(label: Text('Employee')),
            DataColumn(label: Text('Today Status')),

          ],
          rows: List<DataRow>.generate(
            checkInOutData.length,
                (index) => DataRow(cells: [
              DataCell(GestureDetector(child: Text(snapshot.data[index]),onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {return SingleLeave(Userid: userid,); }));

              },)),
              DataCell(GestureDetector(child: Center(child: status(snapshot.data[index])),onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {return SingleLeave(Userid: userid,); }));


              },)),
            ]),
          ),
        ),
      );
    }else if(snapshot.hasError){
      return Container(
        child: Center(child: Text("NO Data Found"),),
      );
    }else {
      return Container(
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
        }
    );
    }

  Widget status(text){
    return Center(
      child: Container(
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color:text=='1'? Colors.green:Colors.red
        ),
        height: 10,
        width: 10,
      ),
    );
  }
}

class SingleLeave extends StatelessWidget {
  
  final String Userid;
  const SingleLeave({Key? key, required this.Userid}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Single Work'),centerTitle: true,),
      body: FutureBuilder(
          future: RequestController(),
          builder:(BuildContext context, AsyncSnapshot snapshot) {
            if(snapshot.hasData){
              return SingleChildScrollView(
                child: ListView.builder(
                    itemCount: snapshot.data,
                    itemBuilder: (BuildContext context ,int index){

                      return SingleChildScrollView(
                        child: DataTable(
                          columns: const [
                            DataColumn(label: Text('Date')),
                            DataColumn(label: Text('Check-In')),
                            DataColumn(label: Text('Check-Out')),
                          ],
                          rows: List<DataRow>.generate(
                            snapshot.data.length,
                                (index) => DataRow(cells: [
                                  DataCell(Text(snapshot.data[index])),
                                  DataCell(Text(snapshot.data[index])),
                                  DataCell(Text(snapshot.data[index])),
                            ]),
                          ),
                        ),
                      );


                    }
                ),
              );}
             else if(snapshot.hasError){
               return Container(
                 child: Center(child: Text("NO Data Found"),),
               );
            }else {
              return Container(
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }

          }
      ),
    );
  }
}

/*Row(
      children: [
        if (!isSmallScreen)
          Flexible(
            child: SideBarWidget(controller:_controller)
          ,flex: 2,
          ),
        Flexible(
          flex: 6,
          child: Table(
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            children: [
              TableRow(

                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.grey,
                      width: 0.5
                    )
                  )
                ),
                children: [
                  tableHeader('text'),
                  tableHeader('text'),
                  tableHeader('text'),


                ]
              )
            ],
          ),
        ),
      ],
    );*/