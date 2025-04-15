import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_fonts.dart';

class CustomMasterTextField extends StatefulWidget {
  const CustomMasterTextField({
    super.key,
    required this.title,
    required this.hint,
    this.isObscureText = false,
    this.controller,
    required this.validator,
  });

  final String title, hint;
  final bool isObscureText;
  final TextEditingController? controller;
  final String? Function(String?) validator;

  @override
  State<CustomMasterTextField> createState() => _CustomMasterTextFieldState();
}

class _CustomMasterTextFieldState extends State<CustomMasterTextField> {
  late bool _isObscureText;

  @override
  void initState() {
    super.initState();
    _isObscureText = widget.isObscureText;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: AppFonts.font12DarkMedium.copyWith(
            height: 0.5,
            letterSpacing: 1.89,
          ),
        ),
        verticalSpace(10),
        TextFormField(
          controller: widget.controller,
          obscureText: _isObscureText,
          validator: widget.validator,
          style: TextStyle(color: AppColors.kMainAppColor, fontSize: 14.sp),
          decoration: InputDecoration(
            hintText: widget.hint,
            hintStyle: const TextStyle(color: Color(0x7F4A628A)),
            filled: true,
            fillColor: Colors.white.withValues(alpha: 0.8),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide.none,
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: const BorderSide(color: Colors.red, width: 1.5),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: const BorderSide(color: Colors.redAccent, width: 2),
            ),
            suffixIcon:
                widget.isObscureText
                    ? IconButton(
                      onPressed: () {
                        setState(() {
                          _isObscureText = !_isObscureText;
                        });
                      },
                      icon: Icon(
                        _isObscureText
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: Colors.grey,
                      ),
                    )
                    : null,
          ),
        ),
      ],
    );
  }
}
