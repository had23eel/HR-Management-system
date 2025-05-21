import 'package:employeee/Controller/IslamPilgrimageLeaveController.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class IslamPilgrimageLeave extends StatefulWidget {
  const IslamPilgrimageLeave({Key? key}) : super(key: key);

  @override
  State<IslamPilgrimageLeave> createState() => _IslamPilgrimageLeaveState();
}

class _IslamPilgrimageLeaveState extends State<IslamPilgrimageLeave> {
  DateTime _dateTime = DateTime.now();
  DateTime _dateTimeE = DateTime.now().add(new Duration(days:30));
  String? Sdate,Edate;
  _ontap()
  {
    IslamPilgrimageLeaveConteroller ipcont = IslamPilgrimageLeaveConteroller();
    ipcont.islamPilgrimageLeaveConteroller(Sdate, Edate);
  }
  void _showDatePicker(){
    showDatePicker(
        context:context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2020),
        lastDate: DateTime(2025)).then((value) {
      setState(() {
        _dateTime = value!;
        _dateTimeE = _dateTime.add(Duration(days: 30));
        Sdate = DateFormat('yyyy-MM-dd HH:mm').format(_dateTime);
        Edate = DateFormat('yyyy-MM-dd HH:mm').format(_dateTimeE);

      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Islam Pilgrimage Leave'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          SizedBox(height: 25,),
          const Center(child: Text('Please fill the following questions',style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),)),
          Container(width: MediaQuery.of(context).size.width,child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: GestureDetector(

                child: Container(
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.grey,

                    ),
                    child: Center(child: Text('Start date of vacation',style:TextStyle(color: Colors.white),))),
                onTap: (){
                  _showDatePicker();

                },
              ),
            ),
          ),),//Date start resrvation
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(width: MediaQuery.of(context).size.width/2.5,child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: GestureDetector(

                    child: Container(
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: Color(0xFFef7d00),

                        ),
                        child: Text('Date :',style:TextStyle(color: Colors.white),)),
                    onTap: (){
                      _showDatePicker();

                    },
                  ),
                ),),
                SizedBox(width: 10,),
                Container(
                  height: 32,
                  decoration: BoxDecoration(
                      color: Color(0xFF014380),
                      borderRadius: BorderRadius.circular(5)
                  ),
                  width: MediaQuery.of(context).size.width/2,
                  child: Center(
                    child: GestureDetector(
                      child: Container(child: Text('${_dateTime.day}/${_dateTime.month}/${_dateTime.year}',style: TextStyle(color: Colors.white,fontSize: 18),))
                      ,onTap: (){
                      _showDatePicker();
                    },),
                  ),
                ),
                // Text('From : '),
                // SizedBox(width: 10,),
                //
                //   Center(
                //   child:DropdownButton(
                //     hint: Text('Select Please'),
                //     items: _salutations
                //         .map((String item) =>
                //         DropdownMenuItem<String>(child: Text(item), value: item))
                //         .toList(),
                //     onChanged: (String? value) {
                //       setState(() {
                //         print("previous ${this._salutation}");
                //         print("selected $value");
                //         this._salutation = value!;
                //       });
                //     },
                //     value: _salutation,
                //   ),
                //
                // ),
                //   SizedBox(width: 10,),
                //   Text('To : '),
                //   Center(
                //     child:DropdownButton(
                //       items: _salutations
                //           .map((String itemto) =>
                //           DropdownMenuItem<String>(child: Text(itemto), value: itemto))
                //           .toList(),
                //       onChanged: (String? tovalue) {
                //         setState(() {
                //           print("previous ${this._salutationto}");
                //           print("selected $tovalue");
                //           this._salutationto = tovalue!;
                //         });
                //       },
                //       value: _salutationto,
                //     ),
                //
                //   ),

              ],),
          ),// Date Picker ----------------------------------------
          Container(width: MediaQuery.of(context).size.width,child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: GestureDetector(
                onTap: (){
                  final text = 'you should choose start date only';
                  final snackBar = SnackBar(backgroundColor:Color(0xFFef7d00),content: Text(text));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                child: Container(
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.grey,

                    ),
                    child: Center(child: Text('End date of vacation',style:TextStyle(color: Colors.white),))),
              ),
            ),
          ),),//Date start resrvation
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(width: MediaQuery.of(context).size.width/2.5,child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: GestureDetector(
                    onTap: (){
                      final text = 'you should choose start date only';
                      final snackBar = SnackBar(backgroundColor:Color(0xFFef7d00),content: Text(text));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);

                    },
                    child: Container(
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: Color(0xFFef7d00),

                        ),
                        child: Text('leave expierd date',style:TextStyle(color: Colors.white),)),

                  ),
                ),),
                SizedBox(width: 10,),
                Container(
                  height: 32,
                  decoration: BoxDecoration(
                      color: Color(0xFF014380),
                      borderRadius: BorderRadius.circular(5)
                  ),
                  width: MediaQuery.of(context).size.width/2,
                  child: Center(
                    child: GestureDetector(
                        onTap: (){
                          final text = 'you should choose start date only';
                          final snackBar = SnackBar(backgroundColor:Color(0xFFef7d00),content: Text(text));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        },
                        child: Container(child: Text('${_dateTimeE.day}/${_dateTimeE.month}/${_dateTimeE.year}',style: TextStyle(color: Colors.white,fontSize: 18),))
                    ),
                  ),
                ),
                // Text('From : '),
                // SizedBox(width: 10,),
                //
                //   Center(
                //   child:DropdownButton(
                //     hint: Text('Select Please'),
                //     items: _salutations
                //         .map((String item) =>
                //         DropdownMenuItem<String>(child: Text(item), value: item))
                //         .toList(),
                //     onChanged: (String? value) {
                //       setState(() {
                //         print("previous ${this._salutation}");
                //         print("selected $value");
                //         this._salutation = value!;
                //       });
                //     },
                //     value: _salutation,
                //   ),
                //
                // ),
                //   SizedBox(width: 10,),
                //   Text('To : '),
                //   Center(
                //     child:DropdownButton(
                //       items: _salutations
                //           .map((String itemto) =>
                //           DropdownMenuItem<String>(child: Text(itemto), value: itemto))
                //           .toList(),
                //       onChanged: (String? tovalue) {
                //         setState(() {
                //           print("previous ${this._salutationto}");
                //           print("selected $tovalue");
                //           this._salutationto = tovalue!;
                //         });
                //       },
                //       value: _salutationto,
                //     ),
                //
                //   ),

              ],),
          ),// Date Picker ----------------------------------------
          SizedBox(height: 10,),
          Divider(height: 2,thickness: 1,),
          SizedBox(height: 10,),
          GestureDetector(
            child: Container(
                width: MediaQuery.of(context).size.width/2,
                decoration: BoxDecoration(
                    color: Color(0xFF014380),
                    borderRadius: BorderRadius.circular(5)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(child: Text('Submit',style: TextStyle(color: Colors.white,fontSize: 18),)),
                )),
            onTap: (){
_ontap();
            },
          ),


        ],
      ),
    );
  }
}
