// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_flutter/Components/PopupButton.dart';

class FriendsDropdownComp extends StatefulWidget {
  final List<String> items; // List of dropdown items
  final String hintText; // Hint text for dropdown
  final Color borderColor; // Color of the dashed border
  final Color textColor; // Color of the text
  final Color backgroundColor; // Background color of the dropdown
  final Color iconColor; // Color of the plus/minus icon
  final Function(List<String>)? onChanged; // Callback when items are selected
  final bool isMulti; // Whether multiple selections are allowed
  final int maxVisibleItems; // Max items to show before displaying "..."

  const FriendsDropdownComp({
    Key? key,
    required this.items,
    this.hintText = "Select an option",
    this.borderColor = Colors.grey,
    this.textColor = Colors.black,
    this.backgroundColor = Colors.white,
    this.iconColor = Colors.black,
    this.onChanged,
    this.isMulti = false,
    this.maxVisibleItems = 3, // Default to 3 visible items before showing "..."
  }) : super(key: key);

  @override
  _FriendsDropdownCompState createState() => _FriendsDropdownCompState();
}

class _FriendsDropdownCompState extends State<FriendsDropdownComp> {
  bool isOpen = false; // Tracks whether the dropdown is open or closed
  List<String> selectedValues = []; // Holds the selected dropdown values

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Dropdown Button with Dashed Bottom Border
        GestureDetector(
          onTap: () {
            setState(() {
              isOpen = !isOpen;
            });
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            color: widget.backgroundColor,
            child: Column(
              children: [
                // Hint Text or Selected Values
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      selectedValues.isEmpty
                          ? widget.hintText
                          : selectedValues.length > widget.maxVisibleItems
                              ? "${selectedValues.sublist(0, widget.maxVisibleItems).join(', ')}... "
                              : selectedValues.join(', '),
                      style: TextStyle(
                        color: widget.textColor,
                        fontFamily: "Bree",
                        fontSize: 16,
                      ),
                    ),
                    Icon(
                      isOpen ? Icons.remove : Icons.add,
                      color: widget.iconColor,
                      size: 20,
                    ),
                  ],
                ),
                SizedBox(height: 5),
                // Dashed Bottom Border for the button
                if (!isOpen)
                  CustomPaint(
                    size: Size(double.infinity, 1),
                    painter: _DashedBorderPainter(widget.borderColor),
                  ),
              ],
            ),
          ),
        ),

        // Dropdown Items (Menu) with Select All for Multi-Selection
        if (isOpen)
          Container(
            color: widget.backgroundColor,
            child: Column(
              children: [
                // Select All Button (only visible for multi-selection)
                if (widget.isMulti)
                  PopupButton(
                    buttonText: selectedValues.length == widget.items.length
                        ? "Deselect All"
                        : "Select All",
                    onPressed: () => {
                      setState(() {
                        if (selectedValues.length == widget.items.length) {
                          selectedValues.clear();
                        } else {
                          selectedValues = List.from(widget.items);
                        }
                      }),
                      if (widget.onChanged != null)
                        {widget.onChanged!(selectedValues)}
                    },
                    backgroundColor: Color(0xFFFFE8DB),
                    textColor: Color(0xFFE74C3C),
                  ),
                ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: widget.items.map((item) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          if (widget.isMulti) {
                            if (selectedValues.contains(item)) {
                              selectedValues.remove(item); // Deselect item
                            } else {
                              selectedValues.add(item); // Select item
                            }
                          } else {
                            selectedValues = [item]; // Single selection
                            isOpen = false;
                          }
                        });
                        if (widget.onChanged != null) {
                          widget.onChanged!(selectedValues);
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // Checkmark for selected items

                            Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    selectedValues.contains(item)
                                        ? "assets/Images/selected.svg"
                                        : "assets/Images/Deselected.svg",
                                    width: 10,
                                    height: 10,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    item,
                                    style: TextStyle(
                                        color: widget.textColor,
                                        fontFamily: "EthosNova",
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12),
                                  ),
                                ]),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: CustomPaint(
                    size: Size(double.infinity, 1),
                    painter: _DashedBorderPainter(widget.borderColor),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}

// Custom Painter for Dashed Border
class _DashedBorderPainter extends CustomPainter {
  final Color color;

  _DashedBorderPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    const dashWidth = 5.0;
    const dashSpace = 3.0;
    double startX = 0;
    while (startX < size.width) {
      canvas.drawLine(Offset(startX, 0), Offset(startX + dashWidth, 0), paint);
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
