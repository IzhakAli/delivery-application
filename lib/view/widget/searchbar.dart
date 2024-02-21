import 'package:flutter/material.dart';

import '../../core/constant/color.dart';

class CustomAppBar extends StatelessWidget {
  final String barHintText;
  final VoidCallback? onPressedIconFavorite;
  final VoidCallback? onPressedSearch;
  final Function(String)? onChanged;
  final TextEditingController mycontroller;
  const CustomAppBar({
    Key? key,
    required this.onPressedIconFavorite,
    required this.onPressedSearch,
    required this.barHintText,
    required this.onChanged,
    required this.mycontroller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Define your color scheme
    const Color primaryColor = Colors.blue;
    const Color accentColor = AppColor.lightPrimary;
    const Color iconColor = Colors.white;
    const Color searchFieldColor = Colors.white;
    const Color hintTextColor = Colors.blueGrey;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      child: Row(
        children: <Widget>[
          _buildSearchField(searchFieldColor, hintTextColor, primaryColor),
          const SizedBox(width: 10),
          // _buildIconButton(
          //   icon: Icons.notifications_active_outlined,
          //   onPressed: onPressedIconNotifications,
          //   color: accentColor,
          //   iconColor: iconColor,
          // ),
          const SizedBox(width: 10),
          _buildIconButton(
            icon: Icons.favorite_outlined,
            onPressed: onPressedIconFavorite,
            color: accentColor,
            iconColor: iconColor,
          ),
        ],
      ),
    );
  }

  Widget _buildSearchField(
      Color fieldColor, Color hintColor, Color primaryColor) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          border: Border.all(color: AppColor.primary),
          color: fieldColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: TextFormField(
          controller: mycontroller,
          onChanged: onChanged,
          decoration: InputDecoration(
            icon: IconButton(
              icon: const Icon(Icons.search),
              color: primaryColor,
              onPressed: onPressedSearch,
            ),
            hintText: barHintText,
            hintStyle: TextStyle(color: hintColor),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }

  Widget _buildIconButton({
    required IconData icon,
    VoidCallback? onPressed,
    required Color color,
    required Color iconColor,
  }) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15),
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          icon,
          color: iconColor,
        ),
      ),
    );
  }
}
