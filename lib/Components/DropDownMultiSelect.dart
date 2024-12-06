// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DropDownReceipientsMultiSelect extends StatefulWidget {
  final List<String> items;
  final List<String> selectedValues;
  final ValueChanged<List<String>> onChanged;
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

  const DropDownReceipientsMultiSelect({
    super.key,
    required this.items,
    required this.selectedValues,
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
  _DropDownReceipientsMultiSelectState createState() =>
      _DropDownReceipientsMultiSelectState();
}

class _DropDownReceipientsMultiSelectState
    extends State<DropDownReceipientsMultiSelect> {
  bool _isDropdownOpen = false;

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
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: widget.backgroundColor,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      widget.selectedValues.isEmpty
                          ? widget.hint
                          : widget.selectedValues.join(', '),
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
                    ),
                child: Column(
                  children: widget.items.map((item) {
                    bool isSelected = widget.selectedValues
                        .contains(item); // Check if this item is selected
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          // Toggle selection status for the item
                          if (isSelected) {
                            widget.selectedValues
                                .remove(item); // Deselect the item
                          } else {
                            widget.selectedValues.add(item); // Select the item
                          }
                          widget.onChanged(widget
                              .selectedValues); // Notify the parent widget
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: const Color(0xfffff5f0), // Default background
                        ),
                        child: Row(
                          children: [
                            Text(
                              item,
                              style: widget.itemTextStyle ??
                                  TextStyle(
                                    color: widget.dropdownTextColor,
                                    fontFamily: "Bree",
                                    fontSize: 12,
                                  ),
                            ),
                            const Spacer(),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (isSelected) {
                                    widget.selectedValues.remove(item);
                                  } else {
                                    widget.selectedValues.add(item);
                                  }
                                  widget.onChanged(widget.selectedValues);
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: isSelected ? 7 : 15,
                                  vertical: isSelected ? 8 : 5,
                                ),
                                decoration: BoxDecoration(
                                  color: const Color(0xfff4622e),
                                  borderRadius: BorderRadius.circular(100),
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
                                          fontSize: 12,
                                        ),
                                      ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
