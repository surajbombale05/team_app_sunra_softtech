import 'package:flutter/material.dart';
import 'package:team_app/utility/constants/app_colors.dart';
import 'package:team_app/utility/constants/app_images.dart';
import 'package:team_app/utility/widgets/custom_dropdown_widget.dart';
import 'package:team_app/utility/widgets/sizedbox_widget.dart';
import 'package:team_app/utility/widgets/text_widget.dart';

class SendQuatationWidget extends StatelessWidget {
  SendQuatationWidget({super.key});

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 17, horizontal: 17),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _formWidget(context),
          const SizedBoxWidget(
            height: 35,
          ),
          _quatationPdfWidget(context),
        ],
      ),
    );
  }

  _formWidget(BuildContext context) {
    return Form(
      key: _formKey,
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextWidget(
            text: "Enter Clients Name",
            color: AppColors.labelTextColor,
            fontWeight: FontWeight.w600,
            fontSize: 17,
          ),
          TextFormFieldWidget(
            hintText: "Select Client",
            hintTextColor: AppColors.hintTextColor,
            fontSize: 14,
            rounded: 10,
            suffixIcon: Icon(
              Icons.keyboard_arrow_down_outlined,
              color: AppColors.blackColor,
            ),
            enabled: false,
          ),
          SizedBoxWidget(
            height: 15,
          ),
          TextWidget(
            text: "Email",
            color: AppColors.labelTextColor,
            fontWeight: FontWeight.w600,
            fontSize: 17,
          ),
          TextFormFieldWidget(
            hintText: "user@gmail.com",
            hintTextColor: AppColors.hintTextColor,
            fontSize: 14,
            rounded: 10,
            enabled: false,
          ),
          SizedBoxWidget(
            height: 15,
          ),
          TextWidget(
            text: "Whatsapp",
            color: AppColors.labelTextColor,
            fontWeight: FontWeight.w600,
            fontSize: 17,
          ),
          TextFormFieldWidget(
            hintText: "+91 7639439437",
            hintTextColor: AppColors.hintTextColor,
            fontSize: 14,
            rounded: 10,
            enabled: false,
          ),
        ],
      ),
    );
  }

  _quatationPdfWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         TextWidget(
          text: "Attachment(2)",
          height: 1,
          fontSize: 17,
          fontWeight: FontWeight.w400,
          color: AppColors.hintTextColor,
        ),
        const SizedBoxWidget(
          height: 15,
        ),
        Container(
          height: 63,
          width: 182,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppColors.hintTextColor),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Image.asset(
                        AppImages.pdfImg,
                        height: 37,
                        width: 37,
                      ),
                    ],
                  ),
                  const Column(
                    children: [
                      TextWidget(
                          text: "Quotation.pdf",
                          fontWeight: FontWeight.w600,
                          fontSize: 14),
                      Row(
                        children: [
                          TextWidget(
                            text: "1,5 MB",
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                          ),
                          SizedBoxWidget(
                            width: 10,
                          ),
                          TextWidget(
                            text: "Download",
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
     ],
);
}
}