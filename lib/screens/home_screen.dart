import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homey_pet/models/doctor_model.dart';
import 'package:homey_pet/models/service_model.dart';
import 'package:homey_pet/screens/list_doctor.dart';
import 'package:lucide_icons/lucide_icons.dart';

var selectedServices = 0;

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Mengatur tampilan icon jaringan dan batrei menjadi warna hitam
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Hello, User',
                    style: GoogleFonts.manrope(
                      fontSize: 24.0,
                      fontWeight: FontWeight.w800,
                      color: const Color(0xFF3F3E3F),
                    ),
                  ),
                  Stack(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          LucideIcons.bell,
                          color: Color(0xFF4BBDFE),
                        ),
                      ),
                      Positioned(
                        right: 9,
                        top: 8,
                        child: Container(
                          height: 15,
                          width: 15,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15 / 2),
                            color: const Color(0xFFEF6497),
                          ),
                          child: Center(
                            child: Text(
                              '2',
                              style: GoogleFonts.mPlus1p(
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
                                fontSize: 10,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  const SizedBox(height: 13),
                  _search(),
                  const SizedBox(height: 21),
                  _services(),
                  const SizedBox(height: 21),
                  _card(),
                  const SizedBox(height: 27),
                  _doctorsList(context),
                  const SizedBox(height: 27),
                ],
              ),
            ),
            const BottomNavigation(),
          ],
        ),
      ),
    );
  }

  Widget _doctorsList(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (var doctor in doctorsList)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: _doctor(context, doctor),
            ),
        ],
      ),
    );
  }

  Container _doctor(BuildContext context, DoctorModel doctorModel) {
    return Container(
      width: 220, // Mengatur lebar
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFCACACA).withOpacity(.19),
        borderRadius: BorderRadius.circular(14),
      ),

      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ListDoctor(
                doctor: doctorModel,
              ),
            ),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AspectRatio(
                aspectRatio: 1.1,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(14),
                    child: Image.asset(
                      doctorModel.imageIcon,
                      fit: BoxFit.cover,
                    ))),
            const SizedBox(
              height: 6,
            ),
            Text(
              doctorModel.name,
              style: GoogleFonts.manrope(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF3F3E3F),
              ),
            ),
            const SizedBox(
              height: 2,
            ),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: "Service: ${doctorModel.services.join(', ')}",
                style: GoogleFonts.manrope(
                    fontSize: 12, color: Color.fromARGB(255, 0, 0, 0)),
              ),
            ),
            const SizedBox(
              height: 7,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  LucideIcons.mapPin,
                  size: 14,
                  color: Color(0xFFACA3A3),
                ),
                const SizedBox(
                  width: 7,
                ),
                Text("${doctorModel.distance}km",
                    style: GoogleFonts.manrope(
                      fontSize: 12,
                      color: const Color(0xFFACA3A3),
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }

  SizedBox _services() {
    return SizedBox(
      height: 36,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          //jika dipencet akan mengubah warna background
          decoration: BoxDecoration(
            color: selectedServices == index
                ? const Color(0xff4BBDFE)
                : const Color(0xFFF6F6F6),
            border: selectedServices == index
                ? Border.all(
                    color: const Color(0xFFF1E5E5).withOpacity(.22), width: 2)
                : null,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              Service.all()[index],
              style: GoogleFonts.manrope(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: selectedServices == index
                    ? Colors.white
                    : const Color(0xFF3F3E3F).withOpacity(.3),
              ),
            ),
          ),
        ),
        separatorBuilder: (context, index) => const SizedBox(
          width: 10,
        ),
        itemCount: Service.all().length,
      ),
    );
  }

  Widget _search() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      decoration: BoxDecoration(
        color: const Color(0xFFF6F6F6),
        borderRadius: BorderRadius.circular(14),
      ),
      child: TextFormField(
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: const Icon(
            LucideIcons.search,
            color: Color(0xFFADACAD),
          ),
          hintText: 'Find best vaccinate, treatment...',
          hintStyle: GoogleFonts.manrope(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: const Color(0xffCACACA),

            //height 150%
            height: 150 / 100,
          ),
        ),
      ),
    );
  }

  AspectRatio _card() {
    return AspectRatio(
      aspectRatio: 336 / 184,
      child: Container(
        clipBehavior: Clip.hardEdge,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: const Color(0xFF4BBDFE),
        ),

        // membuat background card
        child: Stack(
          children: [
            Image.asset(
              'assets/images/background_card.png',
              height: double.maxFinite,
              fit: BoxFit.cover,
              width: double.maxFinite,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: Column(
                //membuat tata letak vertikal
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(
                        text: 'Your ',
                        style: GoogleFonts.manrope(
                            fontSize: 14,
                            color: Colors.white,
                            height: 150 / 100),
                        children: const [
                          TextSpan(
                              text: 'Catrine ',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
                              )),
                          TextSpan(
                            text: 'will get\nvaccination ',
                          ),
                          TextSpan(
                              text: 'tomorrow\nat 09.00 am!',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
                              )),
                        ]),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white.withOpacity(.75),
                    ),
                    child: const Text(
                      'See detail',
                      style: TextStyle(color: Color(0xFF3F3E3F)),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      height: 55,
      backgroundColor: Colors.white,
      animationCurve: Curves.easeInOutCubic,
      buttonBackgroundColor: Colors.white,
      color: const Color(0xFF4BBDFE),
      items: const [Icon(LucideIcons.home), Icon(LucideIcons.heart)],
      onTap: (index) {},
    );
  }
}
