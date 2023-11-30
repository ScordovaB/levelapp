import 'package:flutter/material.dart';
import 'package:level_app/api/firestore_requests.dart';


class EditProfile extends StatefulWidget {
  const EditProfile(
      {super.key,
      required this.userId,
      required this.profile});
  
  final String userId;
  final String profile;
  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
        ),
        centerTitle: false,
        elevation: 0,
      ),
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          child: Column(
            children: [
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
                          'https://picsum.photos/id/${widget.profile}/100/100',
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
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
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              const Text(
                                "Edit Profile Background:",
                                style: TextStyle(fontSize: 20),
                              ),
                              const SizedBox(height: 32),
                              MyCircleAvatarButton(
                                isBackground: true,
                                userId: widget.userId,
                                newProfile: "1",
                                imageAsset: "https://picsum.photos/id/1/100/100",
                              ),
                              MyCircleAvatarButton(
                                isBackground: true,
                                userId: widget.userId,
                                newProfile: "96",
                                imageAsset: "https://picsum.photos/id/96/100/100",
                              ),
                              MyCircleAvatarButton(
                                isBackground: true,
                                userId: widget.userId,
                                newProfile: "103",
                                imageAsset: "https://picsum.photos/id/103/100/100",
                              ),
                              MyCircleAvatarButton(
                                isBackground: true,
                                userId: widget.userId,
                                newProfile: "146",
                                imageAsset: "https://picsum.photos/id/146/100/100",
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              const Text(
                                "Edit Profile Image:",
                                style: TextStyle(fontSize: 20),
                              ),
                              const SizedBox(height: 32),
                              MyCircleAvatarButton(
                                isBackground: false,
                                userId: widget.userId,
                                newProfile: "1",
                                imageAsset: "https://picsum.photos/id/1/100/100",
                              ),
                              MyCircleAvatarButton(
                                isBackground: false,
                                userId: widget.userId,
                                newProfile: "135",
                                imageAsset: "https://picsum.photos/id/135/100/100",
                              ),
                              MyCircleAvatarButton(
                                isBackground: false,
                                userId: widget.userId,
                                newProfile: "136",
                                imageAsset: "https://picsum.photos/id/136/100/100",
                              ),
                              MyCircleAvatarButton(
                                isBackground: false,
                                userId: widget.userId,
                                newProfile: "137",
                                imageAsset: "https://picsum.photos/id/137/100/100",
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {

                        Navigator.pop(context,true);
                        //Navigator.of(context, true).pop();
                      },
                      child: const Text('Save Changes'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyCircleAvatarButton extends StatelessWidget {
  final String imageAsset;
  final String newProfile;
  final String userId;
  final bool isBackground;

  MyCircleAvatarButton(
      {required this.imageAsset,
      required this.newProfile,
      required this.userId,
      required this.isBackground});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Your action when the button is clicked
        if (isBackground) {
          updateProfileToUser(userId, newProfile);
        } else {
          updateBackgroundToUser(userId, int.parse(newProfile));
        }

        Navigator.pop(context,true);
        // Add your logic here
      },
      child: CircleAvatar(
        radius: 50.0,
        backgroundImage: NetworkImage(imageAsset),

        backgroundColor: Colors.grey,
        // child: const Icon(
        //   Icons.add,
        //   size: 40.0,
        //   color: Colors.yellowAccent,
        // ), // Change the background color as needed
      ),
    );
  }
}
