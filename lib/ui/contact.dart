import 'package:image_picker/image_picker.dart';

class Contact {
  String name;
  String email;
  String phone;
  XFile? image;

  Contact({
    required this.name,
    required this.email,
    required this.phone,
    this.image,
  });
}