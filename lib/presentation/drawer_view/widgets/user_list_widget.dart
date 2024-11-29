import 'package:flutter/material.dart';
import 'package:team_app/presentation/drawer_view/widgets/client_detail_view_widget.dart';
import 'package:team_app/utility/constants/app_colors.dart';
import 'package:team_app/utility/constants/app_images.dart';
import 'package:team_app/utility/widgets/sizedbox_widget.dart';
import 'package:team_app/utility/widgets/text_widget.dart';

class UserListWidgetScreen extends StatefulWidget {
  const UserListWidgetScreen({super.key});

  @override
  State<UserListWidgetScreen> createState() => _UserListWidgetScreenState();
}

class _UserListWidgetScreenState extends State<UserListWidgetScreen> {
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
                  padding: const EdgeInsets.symmetric(
                      vertical: 15.0, horizontal: 15),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const TextWidget(
                            text: "Users",
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
                                  border: Border.all(
                                      color: AppColors.lightGrayColor),
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
                                    const Icon(
                                        Icons.keyboard_arrow_down_outlined)
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBoxWidget(
                        height: 15,
                      ),
                      ListView.builder(
                        itemCount: 14,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: AppColors.lightColor,
                                  borderRadius: BorderRadius.circular(7)),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(right: 10),
                                            child: InkWell(
                                              onTap: (){
                                                Navigator.push(context, MaterialPageRoute(builder: (context) => ClientDetailViewWidget(),));
                                              },
                                              child: TextWidget(
                                                text: "View Projects",
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600,
                                                color: AppColors.primarySkyColor,
                                              ),
                                            ),
                                          ),
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
