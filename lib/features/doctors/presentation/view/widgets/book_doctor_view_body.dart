import 'package:baby_care/core/constants.dart';
import 'package:baby_care/core/extensions/extensions.dart';
import 'package:baby_care/core/utils/app_colors.dart';
import 'package:baby_care/core/utils/app_text_styles.dart';
import 'package:baby_care/core/widgets/empty_home_app_bar.dart';
import 'package:baby_care/core/widgets/widget_linear_color.dart';
import 'package:baby_care/features/children/presentation/cubit/children_cubit.dart';
import 'package:baby_care/features/children/presentation/cubit/children_state.dart';
import 'package:baby_care/features/doctors/data/model/doctor_model.dart';
import 'package:baby_care/features/doctors/presentation/view/widgets/book_doctor_container.dart';
import 'package:baby_care/features/doctors/presentation/view/widgets/doctor_booking_button.dart';
import 'package:baby_care/features/home/presentation/view/widgets/custom_home_app_bar.dart';
import 'package:baby_care/generated/l10n.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDoctorViewBody extends StatelessWidget {
  const BookDoctorViewBody({super.key, required this.doctorModel});
  final DoctorModel doctorModel;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            24.height,
            BlocBuilder<ChildrenCubit, ChildrenState>(
              builder: (context, state) {
                if (state is ChildrenLoaded) {
                  return CustomHomeAppBar(child: state.children);
                }
                if (state is ChildrenEmpty) {
                  return EmptyHomeAppBar();
                }
                return SizedBox();
              },
            ),
            18.height,
            Padding(
              padding: Constants.khorizontalPadding.horizontal,
              child: Column(
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.arrow_back_ios_new_outlined),
                      ),
                      Spacer(),
                      Text(
                        S.of(context).bookAppointment,
                        style: AppTextStyles.headerBold,
                      ),
                      Spacer(),
                    ],
                  ),
                  24.height,
                  CircleAvatar(
                    radius: 65,
                    backgroundImage: CachedNetworkImageProvider(
                      doctorModel.imageUrl,
                    ),
                  ),
                  16.height,
                  Text(doctorModel.name, style: AppTextStyles.headerBold),
                  4.height,
                  Text(doctorModel.specialty, style: AppTextStyles.textStyle18),
                  30.height,
                  BookDoctorContainer(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'نبذة عن الطبيب',
                          style: AppTextStyles.textStyle18.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppColors.mText,
                          ),
                        ),
                        4.height,
                        Text(
                          doctorModel.bio,
                          style: AppTextStyles.body1Ragular.copyWith(
                            color: AppColors.dText,
                          ),
                        ),
                      ],
                    ),
                  ),
                  24.height,
                  BookDoctorContainer(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'تفاصيل الحجز',
                          style: AppTextStyles.textStyle18.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppColors.mText,
                          ),
                        ),
                        16.height,
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            WidgetLinearColor(
                              widget: Icon(Icons.access_time, size: 30),
                            ),
                            12.width,
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'المواعيد المتاحة ',
                                  style: AppTextStyles.btnsBold.copyWith(
                                    color: AppColors.mText,
                                  ),
                                ),
                                4.height,
                                Text(
                                  doctorModel.workingHours,
                                  style: AppTextStyles.body1Ragular.copyWith(
                                    color: AppColors.dText,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),

                        16.height,
                        Divider(color: Color(0xffF1F1F1)),
                        16.height,
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset('assets/image/buildings.png'),
                            12.width,
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "الاماكن المتاحة",
                                    style: AppTextStyles.btnsBold.copyWith(
                                      color: AppColors.mText,
                                    ),
                                  ),
                                  4.height,
                                  ListView.builder(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount: doctorModel.clinics.length,
                                    itemBuilder: (context, index) => Text(
                                      doctorModel.clinics[index],
                                      style: AppTextStyles.body1Ragular
                                          .copyWith(color: AppColors.dText),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  50.height,
                  DoctorBookingButton(doctorName: doctorModel.name),
                  Constants.kbottomPadding.height,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
