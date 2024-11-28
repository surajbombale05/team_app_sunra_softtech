import 'package:flutter/material.dart';
import 'package:team_app/utility/constants/app_colors.dart';
import 'package:team_app/utility/constants/app_images.dart';
import 'package:team_app/utility/widgets/button_widget.dart';
import 'package:team_app/utility/widgets/sizedbox_widget.dart';
import 'package:team_app/utility/widgets/text_widget.dart';
import 'package:flutter/services.dart';

class RecieviewLinksWidgetScreen extends StatelessWidget {
  RecieviewLinksWidgetScreen({super.key});

  String textToCopy = "https://dribbble.com/search/pending-payments-ui-mobile";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 22,
        itemBuilder: (context, index) {
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
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 15.0, horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const TextWidget(
                        text: "Clients Name",
                        color: AppColors.darkColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                      const SizedBoxWidget(
                        height: 10,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextWidget(
                                text: "Category:",
                                color: AppColors.textGrey,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                              SizedBoxWidget(
                                height: 10,
                              ),
                              TextWidget(
                                text: "Mobile:",
                                color: AppColors.textGrey,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                              SizedBoxWidget(
                                height: 5,
                              ),
                              TextWidget(
                                text: "Email: ",
                                color: AppColors.textGrey,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ],
                          ),
                          const SizedBoxWidget(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  ButtonWidget(
                                    showPreIcon: true,
                                    onClick: () {},
                                    iconImg: AppImages.mobileIcon,
                                    text: "App",
                                    backgroundColor:
                                        const Color(0xFFF66001A).withOpacity(0.3),
                                    width: 5,
                                    height: 22,
                                  ),
                                  const SizedBoxWidget(
                                    width: 5,
                                  ),
                                  ButtonWidget(
                                    showPreIcon: true,
                                    iconImg: AppImages.airplaneSquare,
                                    onClick: () {},
                                    text: "Travel",
                                    backgroundColor:
                                        const Color(0xFF006AFF1A).withOpacity(0.3),
                                    width: 5,
                                    height: 22,
                                  ),
                                ],
                              ),
                              const SizedBoxWidget(
                                height: 5,
                              ),
                              const TextWidget(
                                text: "+91 874954033 ",
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: AppColors.blackColor,
                              ),
                              const SizedBoxWidget(
                                height: 5,
                              ),
                              const TextWidget(
                                text: "user@gmail.com",
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: AppColors.blackColor,
                              )
                            ],
                          )
                        ],
                      ),
                      const SizedBoxWidget(
                        height: 10,
                      ),
                      const TextWidget(
                        text: "Reference Link",
                        color: AppColors.textGrey,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                      const SizedBoxWidget(
                        height: 5,
                      ),
                      Container(
                        decoration: const BoxDecoration(color: AppColors.lightColor),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              Expanded(
                                  child: TextWidget(
                                      text: textToCopy,
                                      fontSize: 11,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.primarySkyColor)),
                              const SizedBoxWidget(
                                width: 13,
                              ),
                              InkWell(
                                  onTap: () {
                                    Clipboard.setData(
                                        ClipboardData(text: textToCopy));
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text(
                                              "Text copied to clipboard!")),
                                    );
                                  },
                                  child: Image.asset(AppImages.copyIcon)),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                )),
          );
        },
      ),
    );
  }
}
