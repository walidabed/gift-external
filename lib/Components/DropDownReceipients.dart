// ignore_for_file: library_private_types_in_public_api, prefer_const_constructors

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DropDownReceipients extends StatefulWidget {
  final List<String> items;
  final String? selectedValue;
  final ValueChanged<String?> onChanged;
  final String hint;
  final double width;
  final Color backgroundColor;
  final Color textColor;
  final Color dropdownBackgroundColor;
  final Color dropdownTextColor;
  final IconData arrowIcon;
  final double itemHeight;
  final double iconSize;
  final EdgeInsetsGeometry dropdownPadding;
  final BoxDecoration? dropdownBoxDecoration;
  final TextStyle? itemTextStyle;
  final Border? dropdownBorder;

  const DropDownReceipients({
    super.key,
    required this.items,
    required this.selectedValue,
    required this.onChanged,
    required this.hint,
    this.width = double.infinity,
    this.backgroundColor = const Color(0xFFFFE8DB),
    this.textColor = Colors.black,
    this.dropdownBackgroundColor = Colors.white,
    this.dropdownTextColor = Colors.black,
    this.arrowIcon = Icons.arrow_drop_down,
    this.itemHeight = 50.0, // Default item height
    this.iconSize = 24.0, // Default icon size
    this.dropdownPadding =
        const EdgeInsets.all(8.0), // Padding for the dropdown menu
    this.dropdownBoxDecoration, // Custom BoxDecoration for the dropdown
    this.itemTextStyle, // Custom TextStyle for the items
    this.dropdownBorder, // Custom Border for the dropdown
  });

  @override
  _DropDownReceipientsState createState() => _DropDownReceipientsState();
}

class _DropDownReceipientsState extends State<DropDownReceipients> {
  bool _isDropdownOpen = false;
  String? _selectedItem;

  @override
  void initState() {
    super.initState();
    _selectedItem = widget.selectedValue ?? widget.hint;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isDropdownOpen = !_isDropdownOpen;
        });
      },
      child: Container(
        width: widget.width,
        decoration: BoxDecoration(
          color: widget.backgroundColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // The button part
            Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: widget.backgroundColor,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      _selectedItem ?? widget.hint,
                      style: TextStyle(
                        color: widget.textColor,
                        fontFamily: "EthosNova",
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SvgPicture.asset(
                    "assets/Images/downChevron.svg",
                    width: 13,
                  ),
                ],
              ),
            ),
            // The dropdown menu part
            if (_isDropdownOpen)
              Container(
                  padding: widget.dropdownPadding,
                  decoration: widget.dropdownBoxDecoration ??
                      BoxDecoration(
                        color: const Color(0xfffff5f0),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(8),
                          bottomRight: Radius.circular(8),
                        ),
                      ),
                  child: Column(
                    children: [
                      Column(
                        children: widget.items.map((item) {
                          bool isSelected = item ==
                              _selectedItem; // Check if this item is selected
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedItem =
                                    item; // Update selected item immediately
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: // Change background of selected item
                                    const Color(
                                        0xfffff5f0), // Default background
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    item,
                                    style: widget.itemTextStyle ??
                                        TextStyle(
                                            color: widget.dropdownTextColor,
                                            fontFamily: "Bree",
                                            fontSize: 12),
                                  ),
                                  const Spacer(),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _selectedItem =
                                            item; // Update selected item immediately
                                      });
                                    },
                                    child: Container(
                                      padding: isSelected
                                          ? EdgeInsets.symmetric(
                                              horizontal: 7, vertical: 8)
                                          : const EdgeInsets.symmetric(
                                              horizontal: 15, vertical: 5),
                                      decoration: BoxDecoration(
                                        color: const Color(0xfff4622e),
                                        borderRadius:
                                            BorderRadius.circular(100),
                                      ),
                                      child: isSelected
                                          ? SvgPicture.asset(
                                              'assets/Images/tick.svg',
                                              width: 5,
                                              height: 5,
                                            )
                                          : const Text(
                                              "Select",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: "Bree",
                                                  fontSize: 12),
                                            ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: const Color(0xfffff5f0),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(8),
                            bottomRight: Radius.circular(8),
                          ),
                        ),
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Choose one or more selections!",
                              style: TextStyle(
                                  color: const Color(0xfff4622e),
                                  fontFamily: "EthosNova",
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500),
                            )),
                      )
                    ],
                  )),
          ],
        ),
      ),
    );
  }
}
