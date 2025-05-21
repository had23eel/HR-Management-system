import 'dart:convert';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'package:intl/intl.dart';
import '../Controller/MeadicalLeaveController.dart';
class MedicalLeave extends StatefulWidget {
  const MedicalLeave({Key? key}) : super(key: key);

  @override
  State<MedicalLeave> createState() => _MedicalLeaveState();
}

class _MedicalLeaveState extends State<MedicalLeave> {
  DateTime _dateTime = DateTime.now();
  DateTime _dateTimeE = DateTime.now();
  XFile? XimageFile;
  File? imageFile;
  String? Sdate;
  String? Edate ;
  _ontap() {
MedicalLeaveController mcont = MedicalLeaveController();
    if(imageFile != null) {
     mcont.MedicalLeaves(Sdate, Edate, imageFile);
    }
    else if(imageFile == null) {
      mcont.MedicalLeavesNo(Sdate, Edate);
    }
  }


  void _showDatePicker() {
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2020),
        lastDate: DateTime(2025)).then((value) {
      setState(() {
        _dateTime = value!;
        Sdate = DateFormat('yyyy-MM-dd HH:mm').format(_dateTime);
        print(Sdate);
      });
    });
  }
  void _showDatePickerE() {
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2020),
        lastDate: DateTime(2025)).then((value) {
      setState(() {
        _dateTimeE = value!;
        Edate = DateFormat('yyyy-MM-dd HH:mm').format(_dateTimeE);
        print(Edate);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text('Medical Leave',),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
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
          const Center(child: Text('Please take a photo for your medical report',style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),)),
          SizedBox(height: 10,),
          if (imageFile != null)
            Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width / 2,
              height: MediaQuery
                  .of(context)
                  .size
                  .width / 2,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(12.0),
                  border: Border.all(width: 8, color: Colors.black12),
                  image :DecorationImage(image: Image.file(File(imageFile!.path)).image),
              ),
            ),
          if(imageFile == null)
            Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width /1.2,
              height: MediaQuery
                  .of(context)
                  .size
                  .width / 1.2,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(12.0),
                  border: Border.all(width: 8, color: Colors.black12)
              ),
              child: const Text(
                'image should appear here ', style: TextStyle(fontSize: 26),),
            ),


          Container(
            width: MediaQuery
        .of(context)
        .size
        .width / 1.2,
            child: Row(
              children: [
                Expanded(child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateColor.resolveWith((states) => Color(0xFFef7d00)
    )

                  ),
                  onPressed: () => getImage(source: ImageSource.camera),
                  child: const Text(
                    'Capture Image ', style: TextStyle(fontSize: 10),),
                )),
                Expanded(child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateColor.resolveWith((states) => Color(0xFFef7d00)
                    )

                ),
                  onPressed: () {
                    getImage(source: ImageSource.gallery);
                  },
                  child: const Text(
                    'Pick Image ', style: TextStyle(fontSize: 10),),
                ))
              ],
            ),
          ),
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
        ],
      ),

    );
  }

  void getImage({required ImageSource source}) async {
    final file = await ImagePicker().pickImage(source: source);
    if (file?.path != null) {
      setState(() {
        imageFile = File(file!.path);
        print(imageFile!.path);
      });
    }
  }


}