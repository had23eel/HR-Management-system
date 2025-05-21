import 'package:employeee/Controller/RequestController.dart';
import 'package:employeee/View/edit/Request_Edit.dart';
import 'package:flutter/material.dart';
import 'package:sidebarx/sidebarx.dart';

import '../Model/RequestModel.dart';
import 'SideBarWidget.dart';
class Request extends StatefulWidget {
  const Request({Key? key}) : super(key: key);

  @override
  State<Request> createState() => _RequestState();
}

class _RequestState extends State<Request> {
  final _controller = SidebarXController(selectedIndex: 0,extended: false);
  Requests requests = new Requests();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    final isSmallScreen = width < 600 ;

    return Row(
      children: [
        if (!isSmallScreen)
          Flexible(child: SideBarWidget(controller:_controller)
            ,flex: 2,
          )
        ,
        Flexible(
          flex: 6,
          child:  FutureBuilder(
              future: RequestController(),
              builder:(BuildContext context, AsyncSnapshot snapshot) {
                if(snapshot.hasData){
                  requests = snapshot.data;
                  return ListView.builder(
                      itemCount: requests.results!.length,
                      itemBuilder: (BuildContext context ,int index){
    if(requests.results![index].from=="leave") {
      return SingleChildScrollView(
        child: InboxItem(
          snapshot: requests.results![index],
          senderName: 'Leave Request',
          subject: '${requests.results![index].typeOfLeave?.leaveName}',
          message:
          '${requests.results![index].leaveStatus}',
          time: '12:30 PM',
          unread: true,
        ),
      );
    }else{
      return SingleChildScrollView(
        child: InboxItem(
          snapshot: requests.results![index],
          senderName: 'Car Request',
          subject: 'From : ${requests.results![index].from}        To : ${requests.results![index].destination}',
          message:
          '${requests.results![index].orderStatus}',
          time: '12:30 PM',
          unread: true,
        ),
      );
    }

                      }
                  );

                      }
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
        ),
      ],
    );
  }



}

class InboxItem extends StatelessWidget {
  final Results snapshot;
  final String senderName;
  final String subject;
  final String message;
  final String time;
  final bool unread;

  InboxItem({
    required this.snapshot,
    required this.senderName,
    required this.subject,
    required this.message,
    required this.time,
    required this.unread,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(

      leading: CircleAvatar(
        backgroundColor: Color(0xFFef7d00),
        child: Text(senderName[0]),
      ),
      title: Text(senderName , style: TextStyle(color: Color(0xFFef7d00))),
      subtitle: Text(subject),
      trailing: message=="pending"? Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [

          GestureDetector(
            onTap: (){

            },
            child: Icon(Icons.delete,shadows: [BoxShadow(
                blurRadius: 25.0,
                color: Colors.black54
            )],),
          ),
          GestureDetector(
            onTap: (){
                if(snapshot.from!=null)
                {
                  Navigator.push(context,MaterialPageRoute(builder: (BuildContext context) {
                    return CarRequestEdit(snapshot: snapshot,);

                  }

                  ));

                }
            },
            child: Icon(Icons.edit,shadows: [BoxShadow(
                blurRadius: 25.0,
                color: Colors.black54
            )],),
          ),
        ],
      ):null,
      onTap: () {
        Navigator.push(context,MaterialPageRoute(builder: (BuildContext context) {
          return Request_Details(snapshot: snapshot,);

        }

        ));

      },
      contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      selected: unread,
      selectedTileColor: Colors.grey[200],
    );
  }
}
class Request_Details extends StatelessWidget {
  final Results snapshot;


  Request_Details({
    required this.snapshot,
  });
  @override
  Widget build(BuildContext context) {
    final _key = GlobalKey<ScaffoldState>();

    return  Scaffold(
      appBar: AppBar(
        key: _key,
        title: Text('kajsdfh'),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Center(child: Text('Here are the deatails of your request')),
            if(snapshot.from!=null)Text('your outcome location is : ${snapshot.from}'),
            if(snapshot.typeOfLeave!=null)Text('your type of leave is : ${snapshot.typeOfLeave?.leaveName}'),
            if(snapshot.destination!=null)Text('your destination is : ${snapshot.destination}'),
            if(snapshot.start!=null)Text('your leave starts at : ${snapshot.start}'),
            if(snapshot.end!=null)Text('your leave ends at : ${snapshot.end}'),
            if(snapshot.leaveStatus!=null)Text('your Request status is : ${snapshot.leaveStatus}'),
            if(snapshot.orderStatus!=null)Text('your Request status is : ${snapshot.orderStatus}'),
            if(snapshot.reason!=null)Text('the reason of Car Request is : ${snapshot.reason}'),
            if(snapshot.dateOfLeave!=null)Text('the date of leave is : ${snapshot.dateOfLeave}'),
            if(snapshot.endingDateOfLeave!=null)Text('the date of leave is : ${snapshot.endingDateOfLeave}'),
            if(snapshot.reasonForLeave!=null)Text('reason of leave is : ${snapshot.reasonForLeave}'),
            if(snapshot.medicalReportPath!=null)Image(image: NetworkImage('${snapshot.medicalReportPath}')),




          ],
        ),
      ),
    );
  }
}