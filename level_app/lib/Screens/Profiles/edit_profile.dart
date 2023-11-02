import 'package:flutter/material.dart';

typedef OnSaveCallback = void Function(String publicName, String bio, String email);

class EditProfile extends StatefulWidget {
  const EditProfile({super.key, required this.onSave});
  final OnSaveCallback onSave;

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController _publicNameController = TextEditingController();
  TextEditingController _bioController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          //backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
              size: 30,
            ),
            onPressed: () async {
              Navigator.of(context).pop();
            },
          ),
          title: const Text(
            'Edit Profile',
            style: TextStyle(color: Colors.white),
            //style: Theme.of(context).textTheme.titleLarge,
          ),
          centerTitle: false,
          elevation: 0,
        ),
        body: SafeArea(
            top: true,
            child: SingleChildScrollView(
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.white,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.network(
                            'https://images.unsplash.com/photo-1536084006720-6c105926e135?w=1280&h=720',
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: IconButton(
                            icon: Icon(Icons.edit, color: Theme.of(context).primaryColor,),
                            onPressed: () {
                              // change picture here
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  thickness: 3,
                  color: Theme.of(context).colorScheme.primary,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      TextField(
                        controller: _publicNameController,
                        decoration: const InputDecoration(
                          labelText: 'Public Name',
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextField(
                        controller: _bioController,
                        decoration: const InputDecoration(
                          labelText: 'Bio',
                        ),
                        maxLines: 3,
                      ),
                      const SizedBox(height: 16),
                      TextField(
                        controller: _emailController,
                        decoration: const InputDecoration(
                          labelText: 'Email',
                        ),
                      ),
                      const SizedBox(height: 32),
                      ElevatedButton(
                        onPressed: () {
                          widget.onSave(
                            _publicNameController.text,
                            _bioController.text,
                            _emailController.text,
                          );
                          Navigator.of(context).pop();
                        },
                        child: const Text('Save Changes'),
                      ),
                    ],
                  ),
                ),
              ]),
            )));
  }
}
