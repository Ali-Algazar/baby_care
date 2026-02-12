import 'package:baby_care/core/constants.dart';
import 'package:baby_care/core/extensions/extensions.dart';
import 'package:baby_care/core/utils/app_colors.dart';
import 'package:baby_care/core/utils/app_text_styles.dart';
import 'package:baby_care/core/widgets/custom_button.dart';
import 'package:baby_care/core/widgets/widget_linear_color.dart';
import 'package:baby_care/features/auth/presentation/view/widgets/labeled_text_field.dart';
import 'package:flutter/material.dart';

class AddPostView extends StatelessWidget {
  const AddPostView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: AddPostViewBody());
  }
}

class AddPostViewBody extends StatefulWidget {
  const AddPostViewBody({super.key});

  @override
  State<AddPostViewBody> createState() => _AddPostViewBodyState();
}

class _AddPostViewBodyState extends State<AddPostViewBody> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    titleController.dispose();
    contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: Constants.khorizontalPadding.horizontal,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Constants.ktopPadding.height,
                // --- Header ---
                Row(
                  children: [
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(Icons.arrow_back_ios_new_rounded),
                    ),
                    const Spacer(),
                    Text('انشاء منشور', style: AppTextStyles.headerBold),
                    const Spacer(),
                  ],
                ),
                40.height,

                // --- Title Input ---
                LabeledTextField(
                  label: 'العنوان',
                  controller: titleController,
                  hint: 'أدخل عنوان المنشور',
                  validator: (value) => value == null || value.isEmpty
                      ? 'لا يمكن ترك العنوان فارغ'
                      : null,
                ),
                16.height,

                // --- Content Input ---
                Row(
                  children: [
                    Text('الوصف', style: AppTextStyles.body1Bold),
                    const WidgetLinearColor(widget: Text('*')),
                  ],
                ),
                8.height,
                TextFormField(
                  maxLines: 8,
                  controller: contentController,
                  decoration: InputDecoration(
                    hintText: 'أدخل وصف المنشور',
                    hintStyle: AppTextStyles.body2Ragular.copyWith(
                      color: AppColors.dText,
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: AppColors.danger),
                    ),
                  ),
                  validator: (value) => value == null || value.isEmpty
                      ? 'لا يمكن ترك الوصف فارغ'
                      : null,
                ),
                16.height,

                // --- Add Image Button ---
                InkWell(
                  onTap: () => _showAddImageBottomSheet(context),
                  child: Container(
                    padding: 8.all,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(0, 4),
                          blurRadius: 4,
                          color: Colors.black.withOpacity(0.25),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: AppColors.border),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.add, color: AppColors.primary),
                        8.width,
                        Text(
                          'إضافة صورة ',
                          style: AppTextStyles.btnsRagular.copyWith(
                            color: AppColors.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                24.height,

                // --- Submit Button ---
                Align(
                  alignment: Alignment.centerLeft,
                  child: SizedBox(
                    width: 120,
                    child: CustomButton(
                      title: 'نشر',
                      widget: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          8.width,
                          const Icon(
                            Icons.arrow_forward_ios,
                            color: AppColors.bG,
                          ),
                        ],
                      ),
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          // TODO: Handle Post Creation Logic
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showAddImageBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: 16.horizontal,
        height: 180,
        child: Column(
          children: [
            13.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(width: 24), // For centering title
                Text(
                  'إضافة صورة',
                  style: AppTextStyles.btnsBold.copyWith(
                    color: AppColors.mText,
                  ),
                ),
                InkWell(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(Icons.close, color: AppColors.mText),
                ),
              ],
            ),
            24.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildImageOption(
                  icon: Icons.camera_alt_outlined,
                  label: 'ألتقط صورة',
                  onTap: () {},
                ),
                32.width,
                _buildImageOption(
                  icon: Icons.image_outlined,
                  label: 'اختار من الالبوم',
                  onTap: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImageOption({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
            height: 60,
            width: 60,
            padding: 12.all,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.gray4,
              border: Border.all(color: AppColors.bG1),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.06),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Icon(icon, color: AppColors.mText),
          ),
        ),
        4.height,
        Text(
          label,
          style: AppTextStyles.btnsRagular.copyWith(color: AppColors.mText),
        ),
      ],
    );
  }
}
