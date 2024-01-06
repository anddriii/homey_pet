import 'package:homey_pet/models/service_model.dart';

class DoctorModel {
  String name;
  String imageIcon;
  List<String> services;
  int distance;
  String jabatan;
  int experience;
  String biography;
  String availability;
  String image;

  DoctorModel({
    required this.name,
    required this.imageIcon,
    required this.services,
    required this.distance,
    required this.jabatan,
    required this.experience,
    required this.biography,
    required this.availability,
    required this.image
  });
}

var doctorsList = {

  DoctorModel(
    name: 'Dr. Bruin',
    imageIcon: 'assets/images/dr. bruin.jpg',
    services: [Service.vaccine, Service.surgery, Service.consultation, Service.spaTreatment],
    distance: 10,
    jabatan: 'Senior Veterinarian',
    experience: 15,
    availability: 'MON - SAT: 07:30 - 16:30',
    biography: 'Dr. Bruin is an experienced veterinarian with over 15 years of clinical practice, holding the position of clinic head at Harmony Animal Clinic. He is a nature enthusiast who frequently travels to national parks to support wildlife conservation efforts. Dr. Bruin earned his Doctor of Veterinary Medicine degree from the University of Indonesia after completing his Bachelors degree in Biology from the same university.',
    image: 'assets/images/dr. bruin landscape.jpg'
  ),
  DoctorModel(
    name: 'Dr. Elaina',
    imageIcon: 'assets/images/dr.elaina.jpg',
    services: [Service.spaTreatment, Service.consultation],
    distance: 5,
    jabatan: 'Junior Veterinarian',
    experience: 2,
    availability: 'MON - SAT: 09:00 - 18:00',
    biography: 'Dr. Elaina is an experienced veterinarian with over 2 years of clinic practice. She is deeply committed to animal welfare and consistently stays updated on the latest developments in veterinary medicine. She earned her Doctor of Veterinary Medicine degree from Padjadjaran University after completing her Bachelors degree in Animal Husbandry from the same university.',
    image: 'assets/images/dr.elaina landscape.jpg'
  ),
  DoctorModel(
      name: 'Dr. Sarah',
      imageIcon: 'assets/images/dr.siti.jpg',
      services: [Service.surgery, Service.vaccine,  Service.consultation, Service.spaTreatment,],
      distance: 13,
      jabatan: 'Senior Veterinarian',
      experience: 7,
      availability: 'MON - FRI: 09:00 - 17:00',
      biography: 'Dr. Sarah is an experienced veterinarian at the Vetnic Care Animal Clinic. In addition to her work as a veterinarian, she is an artist who enjoys drawing and painting, as well as a sports enthusiast, particularly in activities like yoga and hiking. Dr. Sarah earned her Doctor of Veterinary Medicine degree from the Bogor Agricultural Institute.',
      image: 'assets/images/dr. siti landscape.jpg',
  ),
  DoctorModel(
    name: 'Dr. Rahmat',
    imageIcon: 'assets/images/dr.rahmat.jpg',
    services: [
      Service.vaccine,
      Service.consultation,
      Service.surgery,
      Service.spaTreatment
    ],
    distance: 11,
    jabatan: 'Senior Veterinarian',
    experience: 10,
    availability: 'MON - SAT: 09:00 - 13:00',
    biography: 'Dr. Rahmat is an experienced veterinarian at Gloriouz Pet Animal Clinic, and he also volunteers at the local animal shelter. He has a keen interest in music, playing both the guitar and piano, and enjoys hobbies such as reading and continuous learning of new things. Dr. Rahmat obtained his Doctor of Veterinary Medicine degree from Airlangga University.',
    image: 'assets/images/dr. rahmat landscape.jpg',
  ),

};
