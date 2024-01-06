import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:homey_pet/models/utils.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:google_fonts/google_fonts.dart';



class Appointment extends StatefulWidget {
  const Appointment({Key? key}) : super(key: key);

  @override
  _AppointmentState createState() => _AppointmentState();
}

class _AppointmentState extends State<Appointment> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Book Appointment',
          style: GoogleFonts.manrope(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF3F3E3F),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  _buildTableBasicsExample(),
                  SizedBox(height: 25,),
                  _availableSlot(),
                  TimeTable(),
                  SizedBox(height: 12,),
                  _patient(),
                  SizedBox(height: 12),
                  _usernameinput(),
                  SizedBox(height: 12,),
                  _email(),
                  SizedBox(height: 12,),
                  _phonenumber(),
                  SizedBox(height: 12,),
                  _pet(),
                  SizedBox(height: 12,),
                  _healthissues(),
                  SizedBox(height: 12,),
                  MyDropDown(),
                ],
              ),
            ),
             _appointmentfinal(context),
          ],
        ),
      ),
    );
  }

  Widget _buildTableBasicsExample() {
    return TableCalendar(
      firstDay: kFirstDay,
      lastDay: kLastDay,
      focusedDay: _focusedDay,
      calendarFormat: _calendarFormat,
      selectedDayPredicate: (day) {
        return isSameDay(_selectedDay, day);
      },
      onDaySelected: (selectedDay, focusedDay) {
        if (!isSameDay(_selectedDay, selectedDay)) {
          setState(() {
            _selectedDay = selectedDay;
            _focusedDay = focusedDay;
          });
        }
      },
      onFormatChanged: (format) {
        if (_calendarFormat != format) {
          setState(() {
            _calendarFormat = format;
          });
        }
      },
      onPageChanged: (focusedDay) {
        _focusedDay = focusedDay;
      },
    );
  }

  Container _availableSlot() {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Icon(LucideIcons.clock4, size: 22, color: Color(0xFFACA3A3)),
            const SizedBox(width: 10),
            Text(
              'Available Slots',
              style: GoogleFonts.manrope(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF3F3E3F),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _patient() {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Icon(LucideIcons.user2, size: 22, color: Color(0xFFACA3A3)),
            const SizedBox(width: 10),
            Text(
              'Patient Details',
              style: GoogleFonts.manrope(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF3F3E3F),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _usernameinput(){
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("User Name", style: GoogleFonts.manrope(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF3F3E3F),
          ),),
          SizedBox(height: 8,),
          TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(LucideIcons.userCircle2),
              hintText: "Andri Setiawan",
              prefixStyle: TextStyle(color: const Color(0xffCACACA), fontWeight: FontWeight.bold),
              labelText: "User Name",
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))
            ),
          )
        ],
      )
    );
  }

  Widget _email(){
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Email Addres", style: GoogleFonts.manrope(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF3F3E3F),
            ),),
            SizedBox(height: 8,),
            TextField(
              decoration: InputDecoration(
                  prefixIcon: Icon(LucideIcons.mail),
                  hintText: "Kafka_lopyu_huhahuhahuha@gmail.com",
                  prefixStyle: TextStyle(color: const Color(0xffCACACA), fontWeight: FontWeight.bold),
                  labelText: "Email Addres",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))
              ),
            )
          ],
        )
    );
  }

  Widget _phonenumber(){
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Phone Number", style: GoogleFonts.manrope(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF3F3E3F),
            ),),
            SizedBox(height: 8,),
            TextField(
              decoration: InputDecoration(
                  prefixIcon: Icon(LucideIcons.contact2),
                  hintText: "08311111111",
                  prefixStyle: TextStyle(color: const Color(0xffCACACA), fontWeight: FontWeight.bold),
                  labelText: "Phone Number",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))
              ),
            )
          ],
        )
    );
  }

  Widget _pet(){
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Type of Pet", style: GoogleFonts.manrope(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF3F3E3F),
            ),),
            SizedBox(height: 8,),
            TextField(
              decoration: InputDecoration(
                  prefixIcon: Icon(LucideIcons.cat),
                  hintText: "Cat",
                  prefixStyle: TextStyle(color: const Color(0xffCACACA), fontWeight: FontWeight.bold),
                  labelText: "Type of Pet",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),

              ),
            )
          ],
        )
    );
  }

  Widget _healthissues(){
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Description of Symptoms or Health Issues", style: GoogleFonts.manrope(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF3F3E3F),
            ),),
            SizedBox(height: 8,),
            TextField(
              decoration: InputDecoration(
                  prefixIcon: Icon(LucideIcons.heartPulse),
                  hintText: "Meriang",
                  prefixStyle: TextStyle(color: const Color(0xffCACACA), fontWeight: FontWeight.bold),
                  labelText: "Health Issues",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))
              ),
            )
          ],
        )
    );
  }

  Container _appointmentfinal(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      height: 50,
      width: 300,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor:  Colors.indigo[300], // warna background
        ),
        onPressed: () {
          print("selesai");
        },
        child: Text(
          'Proceeds To Pay',
          style: GoogleFonts.manrope(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF3F3E3F).withOpacity(.8),
          ),
        ),
      ),
    );
  }
}

class TimeTable extends StatefulWidget {
  @override
  _TimeTableState createState() => _TimeTableState();
}

class _TimeTableState extends State<TimeTable> {
  String selectedTime = '';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0), // Menambahkan border radius pada seluruh tabel
          border: Border.all(),
        ),
        child: Table(
          children: [
            buildTableRow('Morning', 'Afternoon', isHeader: true),
            buildTableRow('09:00AM', '01:00PM'),
            buildTableRow('10:00AM', '02:00PM'),
            buildTableRow('11:00AM', '03:00PM'),
          ],
        ),
      ),
    );
  }

  TableRow buildTableRow(String morningTime, String afternoonTime, {bool isHeader = false}) {
    return TableRow(
      children: [
        buildTableCell(morningTime, isHeader: isHeader),
        buildTableCell(afternoonTime, isHeader: isHeader),
      ],
    );
  }

  Widget buildTableCell(String text, {bool isHeader = false}) {
    return InkWell(
      onTap: () {
        setState(() {
          selectedTime = text;
        });
      },
      child: Container(
        padding: EdgeInsets.all(12.0),
        margin: EdgeInsets.all(4.0),
        decoration: BoxDecoration(
          color: isHeader ? Colors.grey[300] : (text == selectedTime ? Colors.indigo[300] : null),
          borderRadius: BorderRadius.circular(12.0), // Menambahkan border radius
        ),
        // Menambahkan margin pada setiap sel

        child: Text(
          text,
          textAlign: TextAlign.center, // Mengatur posisi teks ke tengah
          style: TextStyle(
            fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}



class MyDropDown extends StatefulWidget {
  @override
  _MyDropDownState createState() => _MyDropDownState();
}

class _MyDropDownState extends State<MyDropDown> {
  String? selectedPayment;
  List<String> payments = ['Debit Card', 'E-Wallet', 'Pet Insurance'];

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Payment',
            style: GoogleFonts.manrope(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF3F3E3F),
            ),
          ),
          SizedBox(height: 8.0),
          DropdownButtonFormField<String>(
            value: selectedPayment,
            decoration: InputDecoration(
              prefixIcon: Icon(LucideIcons.creditCard),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              hintText: 'Choose Payment',
              contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
            ),
            onChanged: (String? value) {
              setState(() {
                selectedPayment = value;
              });
            },
            items: payments.map<DropdownMenuItem<String>>((String payment) {
              return DropdownMenuItem<String>(
                value: payment,
                child: Text(payment),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}