import 'package:flutter/material.dart';
import 'package:homey_pet/models/doctor_model.dart';
import 'package:homey_pet/screens/book_appointment.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:homey_pet/screens/home_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class ListDoctor extends StatelessWidget {
  final DoctorModel doctor;

  const ListDoctor({Key? key, required this.doctor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  _imageDoctor(context),
                  const SizedBox(
                    height: 6,
                  ),
                  _name(),
                  const SizedBox(
                    height: 6,
                  ),
                  _serviceAvailability(context),
                  const SizedBox(
                    height: 12,
                  ),
                  _biography(),
                  const SizedBox(
                    height: 30,
                  ),
                  _consult(),
                  const SizedBox(
                    height: 12,
                  ),
                  _appointment(context),
                  const SizedBox(
                    height: 12,
                  )
                ],
              ),
            ),
            const BottomNavigation(),
          ],
        ),
      ),
    );
  }

  Container _name() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                doctor.name,
                style: GoogleFonts.manrope(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF3F3E3F).withOpacity(.8)),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                doctor.jabatan,
                style: GoogleFonts.manrope(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF3F3E3F).withOpacity(.8)),
              ),
            ],
          ),
          const SizedBox(
            width: 65,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text("Experience: ${doctor.experience} years",
                  style: GoogleFonts.manrope(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF3F3E3F).withOpacity(.8))),
              const SizedBox(
                height: 10,
              ),
              Text("Distance: ${doctor.distance} km",
                  style: GoogleFonts.manrope(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF3F3E3F).withOpacity(.8)))
            ],
          )
        ],
      ),
    );
  }

  Container _serviceAvailability(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.all(1.0),
      child: Table(
        border: TableBorder.all(
            borderRadius: const BorderRadius.all(Radius.circular(8.0))),
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        children: [
          TableRow(
            children: [
              TableCell(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Services: ',
                      style: GoogleFonts.manrope(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF3F3E3F).withOpacity(.8),
                      ),
                    ),
                    Text(
                      doctor.services.join(', '),
                      style: GoogleFonts.manrope(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF3F3E3F).withOpacity(.8),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              TableCell(
                child: Column(
                  children: [
                    Text('Availability: ',
                        style: GoogleFonts.manrope(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF3F3E3F).withOpacity(.8),
                        )),
                    Text(
                      doctor.availability,
                      style: GoogleFonts.manrope(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF3F3E3F).withOpacity(.8),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Stack _imageDoctor(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(doctor.image),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  backgroundColor: const Color(0xFFCACACA).withOpacity(.7),
                  child: IconButton(
                    icon: const Icon(
                      LucideIcons.chevronLeft,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                const FavoriteButton(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Container _consult() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 50),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white, // warna background
          foregroundColor: Colors.black, // warna teks tombol
          elevation: 2, // tinggi bayangan tombol
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15), // Radius sudut tombol
            side: const BorderSide(color: Colors.black, width: 2),
          ),
        ),
        onPressed: () {
          print("Tombol Consult diklik");
        },
        child: Text(
          'Consult Online',
          style: GoogleFonts.manrope(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF3F3E3F).withOpacity(.8),
          ),
        ),
      ),
    );
  }

  Container _appointment(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 50),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF4BBDFE), // warna background
        ),
        onPressed: () {
          _navigateToAppointment(context);
        },
        child: Text(
          'Make an Appointment',
          style: GoogleFonts.manrope(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF3F3E3F).withOpacity(.8),
          ),
        ),
      ),
    );
  }

  Container _biography() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Biography',
              style: GoogleFonts.manrope(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF3F3E3F).withOpacity(.8),
              )),
          Text(
            doctor.biography,
            style: GoogleFonts.manrope(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF3F3E3F).withOpacity(.8),
            ),
          ),
        ],
      ),
    );
  }

  void _navigateToAppointment(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Appointment(),
      ),
    );
  }

  // void _navigateToConsult(BuildContext context) {
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(
  //       builder: (context) => Consult(),
  //     ),
  //   );
  // }
}

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({Key? key}) : super(key: key);

  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: Colors.red,
        size: 30,
      ),
      onPressed: () {
        setState(() {
          isFavorite = !isFavorite;
        });
      },
    );
  }
}
