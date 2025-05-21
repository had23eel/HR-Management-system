import 'package:employeee/Controller/UnpaiedLeaveController.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class UnpaiedLeave extends StatefulWidget {
  const UnpaiedLeave({Key? key}) : super(key: key);

  @override
  State<UnpaiedLeave> createState() => _UnpaiedLeaveState();
}

class _UnpaiedLeaveState extends State<UnpaiedLeave> {
  final reasoncontroller = TextEditingController();
  final _formfield = GlobalKey<FormState>();
  DateTime _dateTime = DateTime.now();
  DateTime _dateTimeE = DateTime.now();
  String? Sdate , Edate;
  _ontap(){
    UnpaidLeaveConteroller hcont = UnpaidLeaveConteroller();
    hcont.unpaiedLeaveConteroller(Sdate!.toString(),Edate!.toString(),reasoncontroller.text);
  }
  void _showDatePicker(){
    showDatePicker(
        context:context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2020),
        lastDate: DateTime(2025)).then((value) {
      setState(() {
        _dateTime = value!;
        Sdate = DateFormat('yyyy-MM-dd HH:mm').format(_dateTime);

      });
    });
  }
  void _showDatePickerE(){
    showDatePicker(
        context:context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2020),
        lastDate: DateTime(2025)).then((value) {
      setState(() {
        _dateTimeE = value!;
        Edate = DateFormat('yyyy-MM-dd HH:mm').format(_dateTimeE);

      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      appBar: AppBar(
        title: Text('Unpaied Leave'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formfield,
          child: Column(
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

                    child: Container(
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: Colors.grey,

                        ),
                        child: Center(child: Text('End date of vacation',style:TextStyle(color: Colors.white),))),
                    onTap: (){
                      _showDatePickerE();

                    },
                  ),
                ),
              ),),//Date End resrvation
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
                          _showDatePickerE();

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
                          child: Container(child: Text('${_dateTimeE.day}/${_dateTimeE.month}/${_dateTimeE.year}',style: TextStyle(color: Colors.white,fontSize: 18),))
                          ,onTap: (){
                          _showDatePickerE();
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

              SizedBox(height: 10,),
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
              ),//Submit----------------------------------------

            ],
          ),
        ),
      ),
    );

  }
}
