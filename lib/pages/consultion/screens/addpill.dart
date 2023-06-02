import 'package:final_project/pages/consultion/screens/pill.dart';
import 'package:final_project/pages/consultion/screens/pill_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:intl/intl.dart';

import '../../../common/style/color.dart';
import '../../../common/widgets/Appbars/AppBar.dart';

import '../../../common/widgets/textformfeilds/defaultTextformfeild.dart';

class AddPill extends StatefulWidget {
  const AddPill({super.key});

  @override
  State<AddPill> createState() => _AddPillState();
}

class _AddPillState extends State<AddPill> {
  late final PillViewModel pillModel;
  late DateTime startDate = DateTime.now();
  late DateTime finishDate = DateTime.now();
  late final ValueChanged<PillViewModel> onChanged;
  String? selectedValue;

  final _formKey = GlobalKey<FormState>();
  TimeOfDay? _selectedTime;
  final TextEditingController _pillnameController = TextEditingController();
  final TextEditingController _startdateController = TextEditingController();
  final TextEditingController _enddateController = TextEditingController();
  final TextEditingController _pilltimecontroller = TextEditingController();
  //TextEditingController _howToUse = TextEditingController();

  late TimeOfDay? pickedTime = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      appBar: const myAppBar(
        title: 'Add Pill',
      ),
      key: _scaffoldKey,
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.all(10.w),
          child: Column(
            children: [
              defaultInputField(
                  inputController: _pillnameController,
                  field: 'Pill Name',
                  hint: 'Enter the name of the pill'),
              RowPicker(
                title: "Doses",
                defaultValue: 1,
                onChangeValue: (v) {},
              ),
              Row(
                children: [
                  Text(
                    'Duration',
                    style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                        color: const Color.fromRGBO(124, 135, 157, 1)),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                        height: 60.h,
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 1,
                                color:
                                    const Color.fromARGB(255, 202, 200, 220)),
                            borderRadius: BorderRadius.circular(7.w)),
                        child: Padding(
                          padding: EdgeInsets.all(8.w),
                          child: Row(
                            children: [
                              Container(
                                decoration: const BoxDecoration(
                                    border: Border(
                                        right: BorderSide(
                                            width: 0.3, color: Colors.grey))),
                                child: Container(
                                  width: 40.w,
                                  child: TextFormField(
                                    readOnly: true,
                                    validator: (val) {
                                      if (val!.isEmpty) {
                                        print('begin required');
                                      }
                                      return null;
                                    },
                                    controller: _startdateController,
                                    decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        labelText: 'begin',
                                        prefixIcon: Icon(
                                          Icons.calendar_today_outlined,
                                          color: AppColor.primaryColor,
                                        )),
                                    onTap: () async {
                                      DateTime? startDate =
                                          await showDatePicker(
                                              context: context,
                                              initialDate: DateTime.now(),
                                              firstDate: DateTime(2023),
                                              lastDate: DateTime(2024));
                                      if (startDate != null) {
                                        setState(() {
                                          _startdateController.text =
                                              DateFormat('MM, dd')
                                                  .format(startDate);
                                        });
                                      }
                                    },
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 15.w),
                                child: Column(
                                  children: [
                                    Text(
                                      'Begin',
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 13.sp),
                                    ),
                                    Text(_startdateController.text)
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )),
                  )),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Container(
                        height: 60.h,
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 1,
                                color:
                                    const Color.fromARGB(255, 202, 200, 220)),
                            borderRadius: BorderRadius.circular(7.w)),
                        child: Padding(
                          padding: EdgeInsets.all(8.w),
                          child: Row(
                            children: [
                              Container(
                                decoration: const BoxDecoration(
                                    border: Border(
                                        right: BorderSide(
                                            width: 0.3, color: Colors.grey))),
                                child: Container(
                                  width: 40,
                                  child: TextFormField(
                                    readOnly: true,
                                    validator: (val) {
                                      if (val!.isEmpty) {
                                        print('end required');
                                      }
                                      return null;
                                    },
                                    controller: _enddateController,
                                    decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        labelText: 'Finish',
                                        icon: Icon(
                                          Icons.calendar_today_outlined,
                                          color: AppColor.primaryColor,
                                        )),
                                    onTap: () async {
                                      DateTime? finishDate =
                                          await showDatePicker(
                                              context: context,
                                              initialDate: DateTime.now(),
                                              firstDate: DateTime(2023),
                                              lastDate: DateTime(2024));
                                      if (finishDate != null) {
                                        setState(() {
                                          _enddateController.text =
                                              DateFormat('MM, dd')
                                                  .format(finishDate);
                                        });
                                      }
                                    },
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 15.w),
                                child: Column(
                                  children: [
                                    Text(
                                      'Finish',
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 13.sp),
                                    ),
                                    SizedBox(
                                      height: 3.h,
                                    ),
                                    Text(_enddateController.text)
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )),
                  )),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 10.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Set the time',
                      style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500,
                          color: const Color.fromRGBO(124, 135, 157, 1)),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.watch_later_rounded,
                        color: AppColor.primaryColor,
                        size: 24.sp,
                      ),
                      onPressed: () async {
                        final TimeOfDay? picked = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        );
                        setState(() {});
                        if (picked != null && picked != _selectedTime) {
                          setState(() {
                            _pilltimecontroller.text =
                                ' ${DateFormat.Hm().format(DateTime(0, 0, 0, picked.hour, picked.minute))} ${picked.hour < 12 ? 'AM' : 'PM'} ';
                          });
                        }
                      },
                    ),
                  ],
                ),
              ),
              //todo
              // TimeFormFelid(inputController: _pilltimecontroller),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 10.h),
                child: Row(
                  children: [
                    Text(
                      'How to Use',
                      style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w500,
                          color: const Color.fromRGBO(124, 135, 157, 1)),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 7.h),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7.w),
                      border: Border.all(
                          width: 1,
                          color: const Color.fromARGB(255, 209, 209, 209))),
                  child: Row(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                            border: Border(
                                right: BorderSide(
                                    width: 0.6, color: Colors.grey))),
                        child: Padding(
                          padding: EdgeInsets.all(10.w),
                          child: Icon(
                            Icons.health_and_safety_outlined,
                            color: AppColor.primaryColor,
                            size: 24.sp,
                          ),
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12.w),
                        child: Container(
                          width: 250.w,
                          child: DropdownButton(
                            isExpanded: true,
                            value: selectedValue,
                            hint: const Text('How to Use'),
                            icon: const Icon(Icons.keyboard_arrow_down),
                            items: genderItems.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(items),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedValue = newValue!;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Spacer(),
              Container(
                width: 500.w,
                child: MaterialButton(
                  elevation: 0,
                  color: AppColor.primaryColor,
                  onPressed: () {
                    Pill pill = Pill(
                        pillName: _pillnameController.text,
                        dose: 3,
                        startDate: startDate,
                        finishDate: finishDate,
                        pillTime: pickedTime,
                        howToUse: 'Diaa');
                    print(pill.startDate);
                    if (_formKey.currentState!.validate()) {
                      Navigator.pop(context);
                    }
                  },
                  child: const Text(
                    'ADD',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

final List<String> genderItems = ['After eat', 'Before eat', 'Every 12h'];

class RowPicker extends StatefulWidget {
  final String title;
  final int defaultValue;
  final Function(int) onChangeValue;

  const RowPicker(
      {required this.title,
      required this.onChangeValue,
      this.defaultValue = 2,
      Key? key})
      : assert(defaultValue >= 0),
        super(key: key);

  @override
  State<RowPicker> createState() => _RowPickerState();
}

class _RowPickerState extends State<RowPicker> {
  late int _count;
  @override
  void initState() {
    super.initState();
    _count = widget.defaultValue;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(2.w),
      child: Row(
        children: [
          Text(
            widget.title,
            style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w500,
                color: const Color.fromRGBO(124, 135, 157, 1)),
          ),
          const Spacer(),
          Text(
            _count.toString(),
            style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            width: 15,
          ),
          Row(
            children: [
              OutlinedButton(
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(const Size(10, 10)),
                  ),
                  onPressed: () {
                    setState(() {
                      _count += 1;
                    });
                    widget.onChangeValue(_count);
                  },
                  child: const Text(
                    "+",
                    style:
                        TextStyle(fontSize: 22, color: AppColor.primaryColor),
                  )),
              OutlinedButton(
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(const Size(10, 10)),
                  ),
                  onPressed: () {
                    if (_count > 0) {
                      setState(() {
                        _count -= 1;
                      });
                      widget.onChangeValue(_count);
                    }
                  },
                  child: const Text(
                    "-",
                    style:
                        TextStyle(fontSize: 22, color: AppColor.primaryColor),
                  ))
            ],
          )
        ],
      ),
    );
  }
}

// Call when you want the date time range picker to be shown

