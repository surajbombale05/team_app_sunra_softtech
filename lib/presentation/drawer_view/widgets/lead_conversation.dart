import 'package:flutter/material.dart';
import 'package:team_app/utility/constants/app_colors.dart';
import 'package:team_app/utility/constants/app_images.dart';
import 'package:team_app/utility/widgets/sizedbox_widget.dart';
import 'package:team_app/utility/widgets/text_widget.dart';

class LeadConversationScreen extends StatefulWidget {
  const LeadConversationScreen({super.key});

  @override
  State<LeadConversationScreen> createState() => _LeadConversationScreenState();
}

class _LeadConversationScreenState extends State<LeadConversationScreen> {
  DateTime? _selectedDate;

  Future<void> _pickDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 10),
        child: Container(
            // height: 231,
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: SingleChildScrollView(
              child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const TextWidget(
                            text: "Lead Conversions",
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppColors.darkColor,
                          ),
                          InkWell(
                            onTap: () {
                              _pickDate(context);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: AppColors.lightGrayColor),
                                  color: AppColors.whiteColor,
                                  borderRadius: BorderRadius.circular(30)),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 3.0, vertical: 1),
                                child: Row(
                                  children: [
                                    Image.asset(AppImages.calendarIconImg),
                                    const SizedBoxWidget(
                                      width: 10,
                                    ),
                                    TextWidget(
                                      text: _selectedDate == null
                                          ? "Select Date"
                                          : "${_selectedDate!.day} ${_getMonthName(_selectedDate!.month)} ${_selectedDate!.year}",
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.semiDarkColor,
                                    ),
                                    const SizedBoxWidget(
                                      width: 10,
                                    ),
                                    const Icon(Icons.keyboard_arrow_down_outlined)
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBoxWidget(
                        height: 15,
                      ),
                      ListView.builder(
                        itemCount: 4,
                        // scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: AppColors.lightColor,
                                  borderRadius: BorderRadius.circular(7)),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 6.0, horizontal: 8),
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 30,
                                      backgroundImage:
                                          AssetImage(AppImages.profileIcon),
                                    ),
                                    SizedBoxWidget(
                                      width: 20,
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        TextWidget(
                                          text: "Client Name",
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.blackColor,
                                        ),
                                        SizedBoxWidget(
                                          height: 10,
                                        ),
                                        TextWidget(
                                          text: "Project Name",
                                          fontSize: 10,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.semiDarkColor,
                                        )
                                      ],
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          TextWidget(
                                            text: "+91 7853934532",
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                            color: AppColors.primarySkyColor,
                                          ),
                                          SizedBoxWidget(
                                            height: 10,
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                              Image.asset(AppImages.clockIcon),
                                              SizedBoxWidget(width: 5,),
                                              TextWidget(
                                                text: "Today at : 4:30 PM",
                                                fontSize: 10,
                                                fontWeight: FontWeight.w400,
                                                color: AppColors.greyColor,
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      )
                    ],
                  )),
            )));
  }

  String _getMonthName(int month) {
    const months = [
      "Jan",
      "Feb",
      "Mar",
      "Apr",
      "May",
      "Jun",
      "Jul",
      "Aug",
      "Sep",
      "Oct",
      "Nov",
      "Dec"
    ];
    return months[month - 1];
  }
}
