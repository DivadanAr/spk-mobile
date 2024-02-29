import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class FormFieldWidget extends StatefulWidget {
  final IconData? icons;
  final placeholder;
  final controller;
  final bool? password;
  const FormFieldWidget(
      {super.key,
      this.icons,
      this.placeholder,
      this.controller,
      this.password});

  @override
  State<FormFieldWidget> createState() => _FormFieldWidgetState();
}

class _FormFieldWidgetState extends State<FormFieldWidget> {
  bool passwordVisible = false;
  bool isFocused = false;

  void togglePasswordVisibility() {
    setState(() {
      passwordVisible = !passwordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, top: 2, bottom: 3, right: 3),
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: isFocused
                ? Color.fromARGB(255, 207, 143, 48).withOpacity(0.2)
                : Color(0xFF000000).withOpacity(0.10),
            offset: Offset(1, 2),
            blurRadius: 3,
            spreadRadius: 0,
          ),
        ],
      ),
      child: FocusScope(
        onFocusChange: (hasFocus) {
          setState(() {
            isFocused = hasFocus;
          });
        },
        child: Row(
          children: [
            this.widget.icons != null
                ? Icon(
                    this.widget.icons,
                    size: 20,
                    color: Color.fromARGB(255, 171, 171, 171),
                  )
                : Container(),
            SizedBox(
              width: 15,
            ),
            Expanded(
              child: TextFormField(
                style: GoogleFonts.nunito(fontWeight: FontWeight.w400),
                obscureText: this.widget.password != null || false
                    ? !passwordVisible
                    : false,
                controller: this.widget.controller,
                cursorColor: Color(0xffFBAE3C),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(top: 10, bottom: 11),
                  border: InputBorder.none,
                  hintText: widget.placeholder,
                  hintStyle: GoogleFonts.nunito(fontWeight: FontWeight.w400),
                ),
              ),
            ),
            this.widget.password != null || false
                ? IconButton(
                    onPressed: togglePasswordVisibility,
                    icon: Icon(
                      passwordVisible ? Icons.visibility_off : Icons.visibility,
                      color: Color.fromARGB(255, 198, 198, 198),
                      size: 20,
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}

class CustomField extends StatefulWidget {
  final label;
  final TextEditingController? controller;
  const CustomField({super.key, this.label, this.controller});

  @override
  State<CustomField> createState() => _CustomFieldState();
}

class _CustomFieldState extends State<CustomField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            this.widget.label.toString(),
            style: GoogleFonts.nunito(
                fontWeight: FontWeight.w800, fontSize: 18, letterSpacing: 0),
          ),
          FormFieldWidget(
            placeholder: "Masukan " + this.widget.label.toString(),
            controller: this.widget.controller,
          )
        ],
      ),
    );
  }
}

class CustomDropdown extends StatelessWidget {
  final String label;
  final List<String> items;
  final String? value;
  final ValueChanged<String?> onChanged;

  const CustomDropdown({
    Key? key,
    required this.label,
    required this.items,
    required this.onChanged,
    this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 18,
              letterSpacing: 0,
            ),
          ),
          SizedBox(height: 8.0),
          Container(
            padding: EdgeInsets.only(left: 20, top: 2, bottom: 3, right: 3),
            width: double.maxFinite,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Color(0xFF000000).withOpacity(0.10),
                  offset: Offset(1, 2),
                  blurRadius: 3,
                  spreadRadius: 0,
                ),
              ],
            ),
            child: DropdownButtonFormField<String>(
              value: value,
              onChanged: onChanged,
              items: items.map((String item) {
                return DropdownMenuItem<String>(
                  value: item,
                  child: Text(item),
                );
              }).toList(),
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              ),
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black,
              ),
              elevation: 8,
              icon: Icon(Icons.arrow_drop_down),
              isExpanded: true,
              dropdownColor: Colors.white,
              hint: Text(
                "Pilih " + label,
                style: TextStyle(fontWeight: FontWeight.w400),
              ),
              selectedItemBuilder: (BuildContext context) {
                return items.map<Widget>((String item) {
                  return Text(item,
                      style: TextStyle(fontWeight: FontWeight.w400));
                }).toList();
              },
            ),
          ),
          SizedBox(height: 16.0),
        ],
      ),
    );
  }
}

class CustomDateTime extends StatefulWidget {
  final String placeholder;
  final TextEditingController controller;

  const CustomDateTime(
      {super.key, required this.placeholder, required this.controller});

  @override
  State<CustomDateTime> createState() => _CustomDateTimeState();
}

class _CustomDateTimeState extends State<CustomDateTime> {
  late DateTime selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        widget.controller.text = DateFormat('yyyy-MM-dd').format(selectedDate);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, top: 2, bottom: 3, right: 3),
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Color(0xFF000000).withOpacity(0.10),
            offset: Offset(1, 2),
            blurRadius: 3,
            spreadRadius: 0,
          ),
        ],
      ),
      child: GestureDetector(
        onTap: () {
          _selectDate(context);
        },
        child: Row(
          children: [
            Icon(
              Icons.calendar_today,
              size: 20,
              color: Color.fromARGB(255, 171, 171, 171),
            ),
            SizedBox(
              width: 15,
            ),
            Expanded(
              child: TextFormField(
                style: TextStyle(fontWeight: FontWeight.w400),
                controller: widget.controller,
                cursorColor: Color(0xffFBAE3C),
                readOnly: true,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(top: 10, bottom: 11),
                  border: InputBorder.none,
                  hintText: widget.placeholder,
                  hintStyle: TextStyle(fontWeight: FontWeight.w400),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
