import 'package:employeee/Controller/HourlyLeaveController.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HourlyLeave extends StatefulWidget {
  const HourlyLeave({Key? key}) : super(key: key);

  @override
  State<HourlyLeave> createState() => _HourlyLeaveState();
}

class _HourlyLeaveState extends State<HourlyLeave> {
  final reasoncontroller = TextEditingController();
  final _formfield = GlobalKey<FormState>();
  TimeOfDay _timeOfDayS = TimeOfDay.now();
  TimeOfDay _timeOfDayE = TimeOfDay.now();
  DateTime _dateofday = DateTime.now();
  DateTime _dateTime = DateTime.now();
  String? Sdate ;
  String? Edate;
  late DateTime dateTimeS,dateTimeE;
  _ontap() {
    print("sadfl;kasjdf;lkasjdflkjas;dlfkjsad;lkfjas;ldkfjaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
    HourlyLeaveConteroller hcont = HourlyLeaveConteroller();
//mcont.MeadicalLeave(Sdate!, Edate!, imageFile!);
    hcont.hourlyLeaveConteroller(Sdate!.toString(),Edate!.toString(),reasoncontroller.text);
  }

  void _showDatePicker() {
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2020),
        lastDate: DateTime(2025)).then((value) {
      setState(() {
        _dateTime = value!;
        print('$value');
      });
    });
  }
  void _showTimePickerS(){
    showTimePicker(
      context:context,
      initialTime: TimeOfDay.now(),
    ).then((value) {
      setState(() {
        _timeOfDayS = value!;
        dateTimeS = DateTime(_dateTime.year,_dateTime.month,_dateTime.day,_timeOfDayS.hour,_timeOfDayS.minute);
        Sdate = DateFormat('yyyy-MM-dd HH:mm').format(dateTimeS);
      });
    });
  }
  void _showTimePickerE(){
    showTimePicker(
      context:context,
      initialTime: TimeOfDay.now(),
    ).then((value) {
      setState(() {
        _timeOfDayE = value!;
        dateTimeE = DateTime(_dateTime.year,_dateTime.month,_dateTime.day,_timeOfDayE.hour,_timeOfDayE.minute);
        Edate = DateFormat('yyyy-MM-dd HH:mm').format(dateTimeE);
        print(Edate);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hourly Leave'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formfield,
          child: Column(
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

                    child: Container(
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: Colors.grey,

                        ),
                        child: Center(child: Text('Time to start leave  ',style:TextStyle(color: Colors.white),))),
                    onTap: (){
                      _showTimePickerS();

                    },
                  ),
                ),
              ),),//Time start resrvation
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [

                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: GestureDetector(
                        child: Container(
                            width:MediaQuery.of(context).size.width/2.5 ,
                            padding: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                                color: Color(0xFFef7d00)
                            ),
                            child: Text('chosen time :', style:  TextStyle(color: Colors.white),)),
                        onTap: (){
                          _showTimePickerS();
                        },
                      ),
                    ),
                    SizedBox(width: 20,),
                    Container(
                      height: 32,
                      decoration: BoxDecoration(
                          color: Color(0xFF014380),
                          borderRadius: BorderRadius.circular(5)
                      ),
                      width: MediaQuery.of(context).size.width/2,
                      child: Center(
                          child: GestureDetector(
                            child: Text('${_timeOfDayS.hour} : ${_timeOfDayS.minute}',style: TextStyle(fontSize: 18,color: Colors.white),)
                            ,onTap: (){
                            _showTimePickerS();
                          },)
                      ),
                    ),

                  ],
                ),
              ),//start Time------------------------------
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
                        child: Center(child: Text('Time to end the leave  ',style:TextStyle(color: Colors.white),))),
                    onTap: (){
                      _showTimePickerE();

                    },
                  ),
                ),
              ),),//Time end reservation
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [

                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: GestureDetector(
                        child: Container(
                            width:MediaQuery.of(context).size.width/2.5 ,
                            padding: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                                color: Color(0xFFef7d00)
                            ),
                            child: Text('chosen time :', style:  TextStyle(color: Colors.white),)),
                        onTap: (){
                          _showTimePickerE();
                        },
                      ),
                    ),
                    SizedBox(width: 20,),
                    Container(
                      height: 32,
                      decoration: BoxDecoration(
                          color: Color(0xFF014380),
                          borderRadius: BorderRadius.circular(5)
                      ),
                      width: MediaQuery.of(context).size.width/2,
                      child: Center(
                          child: GestureDetector(
                            child: Text('${_timeOfDayE.hour} : ${_timeOfDayE.minute}',style: TextStyle(fontSize: 18,color: Colors.white),)
                            ,onTap: (){
                            _showTimePickerE();
                          },)
                      ),
                    ),

                  ],
                ),
              ),//end time ------------------------------------------Text('Please enter the reason for the leave : ')   ,
              Container(
                width: MediaQuery.of(context).size.width/1.05,
                child: TextFormField(
                  maxLines:4 ,
                  keyboardType: TextInputType.emailAddress,
                  controller: reasoncontroller,
                  decoration: InputDecoration(
                      labelText: "Enter The Reason",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.label)
                  ),
                  validator: (value)
                  {
                    if(value!.isEmpty)
                    {
                      return"Enter the reason please";
                    }

                  },
                ),
              ),
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
              )//Submit----------------------------------------

            ]
    ),
        ),
      )
    );
  }
}
