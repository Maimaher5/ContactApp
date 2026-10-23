import 'package:contact_app/ui/textFieldpart.dart';
import 'package:contact_app/utiles/app_colors.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, String>> contacts = [];

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBlue,
      body: Stack(
        children: [
          Image.asset(
            'assets/images/Home Screen.png',
            width: double.infinity,
            fit: BoxFit.cover,
          ),

          if (contacts.isEmpty)
            Center(
              child: Image.asset('assets/images/emptyscreen.png'),
            ),

          if (contacts.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(
                top: 80,
                left: 16,
                right: 16,
                bottom: 90,
              ),
              child: GridView.builder(
                itemCount: contacts.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.72,
                ),
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: AppColors.vdarkBlue,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      children: [
                        const CircleAvatar(
                          radius: 35,
                          backgroundImage:
                          AssetImage('assets/images/image1.png'),
                        ),
                        const SizedBox(height: 8),

                        Text(
                          contacts[index]['name']!,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: AppColors.whiteColor,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(height: 8),

                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: AppColors.gold,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  const Icon(Icons.email, size: 16),
                                  const SizedBox(width: 6),
                                  Expanded(
                                    child: Text(
                                      contacts[index]['email']!,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const Icon(Icons.phone, size: 16),
                                  const SizedBox(width: 6),
                                  Expanded(
                                    child: Text(
                                      contacts[index]['phone']!,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        const Spacer(),

                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                              foregroundColor: AppColors.whiteColor,
                              padding: const EdgeInsets.symmetric(vertical: 8),
                            ),
                            onPressed: () {
                              setState(() {
                                contacts.removeAt(index);
                              });
                            },
                            icon: const Icon(Icons.delete),
                            label: const Text('Delete'),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
        ],
      ),

      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (contacts.isNotEmpty)
            FloatingActionButton(
              heroTag: 'deleteLastContact',
              backgroundColor: Colors.red,
              onPressed: () {
                setState(() {
                  contacts.removeLast();
                });
              },
              child: const Icon(
                Icons.delete,
                color: AppColors.whiteColor,
              ),
            ),

          const SizedBox(height: 12),

          FloatingActionButton(
            heroTag: 'addContact',
            backgroundColor: AppColors.gold,
            onPressed: showAddContact,
            child: const Icon(
              Icons.add,
              color: AppColors.darkBlue,
            ),
          ),
        ],
      ),
    );
  }

  void showAddContact() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.darkBlue,
      builder: (sheetContext) {
        return StatefulBuilder(
          builder: (context, setSheetState) {
            return Padding(
              padding: EdgeInsets.only(
                left: 20,
                right: 20,
                top: 20,
                bottom: MediaQuery.of(context).viewInsets.bottom + 20,
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 35,
                          backgroundImage:
                          AssetImage('assets/images/image1.png'),
                        ),
                        const SizedBox(width: 12),

                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                nameController.text.isEmpty
                                    ? 'User Name'
                                    : nameController.text,
                                style: const TextStyle(
                                  color: AppColors.whiteColor,
                                ),
                              ),
                              const Divider(color: AppColors.gold),

                              Text(
                                emailController.text.isEmpty
                                    ? 'example@email.com'
                                    : emailController.text,
                                style: const TextStyle(
                                  color: AppColors.whiteColor,
                                ),
                              ),
                              const Divider(color: AppColors.gold),

                              Text(
                                phoneController.text.isEmpty
                                    ? '+200000000000'
                                    : phoneController.text,
                                style: const TextStyle(
                                  color: AppColors.whiteColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    Textfieldpart(
                      hintText: 'Enter User Name',
                      controller: nameController,
                      keyboardType: TextInputType.text,
                      onChanged: () => setSheetState(() {}),
                    ),
                    const SizedBox(height: 10),

                    Textfieldpart(
                      hintText: 'Enter User Email',
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      onChanged: () => setSheetState(() {}),
                    ),
                    const SizedBox(height: 10),

                    Textfieldpart(
                      hintText: 'Enter User Phone',
                      controller: phoneController,
                      keyboardType: TextInputType.phone,
                      onChanged: () => setSheetState(() {}),
                    ),
                    const SizedBox(height: 20),

                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(17),
                          backgroundColor: AppColors.gold,
                        ),
                        onPressed: () {
                          if (nameController.text.trim().isEmpty ||
                              emailController.text.trim().isEmpty ||
                              phoneController.text.trim().isEmpty) {
                            return;
                          }

                          setState(() {
                            contacts.add({
                              'name': nameController.text.trim(),
                              'email': emailController.text.trim(),
                              'phone': phoneController.text.trim(),
                            });
                          });

                          nameController.clear();
                          emailController.clear();
                          phoneController.clear();

                          Navigator.pop(sheetContext);
                        },
                        child: const Text(
                          'Enter user',
                          style: TextStyle(color: AppColors.darkBlue),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}