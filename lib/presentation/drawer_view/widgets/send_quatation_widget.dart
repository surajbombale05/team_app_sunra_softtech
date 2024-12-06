import 'package:flutter/material.dart';
import 'package:team_app/utility/constants/app_colors.dart';
import 'package:team_app/utility/constants/app_images.dart';
import 'package:team_app/utility/widgets/button_widget.dart';
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
          const SizedBoxWidget(
            height: 15,
          ),
          _sendQuatationButton(context),
        ],
      ),
    );
  }

  _sendQuatationButton(context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: ButtonWidget(
        onClick: () {},
        text: "Send Quotation",
        backgroundColor: AppColors.darkColor,
        textColor: AppColors.whiteColor,
        borderRadius: 30,
      ),
    );
  }

  _formWidget(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextWidget(
            text: "Enter Clients Name",
            color: AppColors.labelTextColor,
            fontWeight: FontWeight.w500,
            fontSize: 15,
          ),
          TextFormFieldWidget(
            hintText: "Select Client",
            hintTextColor: AppColors.hintTextColor,
            fontSize: 14,
            rounded: 10,
            suffixIcon: Icon(
              Icons.keyboard_arrow_down_outlined,
              color: AppColors.darkColor,
            ),
            enabled: false,
          ),
          SizedBoxWidget(
            height: 15,
          ),
          TextWidget(
            text: "Email",
            color: AppColors.labelTextColor,
            fontWeight: FontWeight.w500,
            fontSize: 15,
          ),
          SizedBoxWidget(height: 3,),
          TextFormFieldWidget(
            hintText: "user@gmail.com",
            hintTextColor: AppColors.hintTextColor,
            fontSize: 14,
            rounded: 10,
            enabled: true,
          ),
          SizedBoxWidget(
            height: 15,
          ),
          TextWidget(
            text: "Whatsapp",
            color: AppColors.labelTextColor,
            fontWeight: FontWeight.w500,
            fontSize: 15,
          ),
          SizedBoxWidget(height: 3,),
          TextFormFieldWidget(
            hintText: "+91 7639439437",
            hintTextColor: AppColors.hintTextColor,
            fontSize: 14,
            
            // validator: (value) {
            //   if (value == null || value.isEmpty) {
            //     return "e";
            //   }
            //   return null;
            // },
            rounded: 10,
            enabled: true,
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
          fontSize: 13,
          fontWeight: FontWeight.w400,
          color: AppColors.hintTextColor,
        ),
        const SizedBoxWidget(
          height: 15,
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.5, 
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppColors.lightGrayColor),
          ),
          child: Row(
            children: [
              Image.asset(AppImages.pdfImg),
              SizedBoxWidget(
                width: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextWidget(
                      text: "Proposal.pdf",
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.blackColor,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextWidget(
                          text: "1,5 MB",
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: AppColors.semiDarkColor,
                        ),
                        TextWidget(
                          text: "Download",
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: AppColors.semiDarkColor,
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
