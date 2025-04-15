import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_fonts.dart';

class CustomMainSearchBar extends StatefulWidget {
  final Function(String) onSearchChanged;
  final VoidCallback onClearSearch;

  const CustomMainSearchBar({
    super.key,
    required this.onSearchChanged,
    required this.onClearSearch,
  });

  @override
  State<CustomMainSearchBar> createState() => _CustomMainSearchBarState();
}

class _CustomMainSearchBarState extends State<CustomMainSearchBar> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _clearSearch() {
    _searchController.clear();
    widget.onClearSearch();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 18.r, right: 8.r),
      margin: EdgeInsets.only(left: 18.r, right: 18.r, top: 18.r),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 1, color: Color(0xFFD7D7D7)),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: TextField(
        controller: _searchController,
        style: TextStyle(color: AppColors.kSecondaryTextColor, fontSize: 16.sp),
        onChanged: (value) {
          widget.onSearchChanged(value);
        },
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 12.r),
          border: InputBorder.none,
          icon: SvgPicture.asset(
            'assets/icons/search-normal.svg',
            colorFilter: const ColorFilter.mode(
              Color(0xff767676),
              BlendMode.srcIn,
            ),
          ),
          hintText: 'Search your dream car.....',
          hintStyle: AppFonts.font14GreyRegular,
          suffixIcon:
              _searchController.text.isNotEmpty
                  ? IconButton(
                    icon: const Icon(Icons.clear, color: Color(0xff767676)),
                    onPressed: _clearSearch,
                  )
                  : null,
        ),
      ),
    );
  }
}
