import 'package:bitmap/user_page.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import 'constants.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String credential = '';
  VideoPlayerController? _controller;

  @override
  void initState() {
    super.initState();
    // Pointing the video controller to our local asset.
    _controller =
        VideoPlayerController.asset("assets/videos/neon-background.mp4")
          ..initialize().then((_) {
            _controller?.setVolume(0);
            _controller?.play();
            _controller?.setLooping(true);
            setState(() {});
          });
  }

  inputHandler(BuildContext context) {
    return (String value) {
      setState(() {
        credential = value;
      });
    };
  }

  void submitHandler() {
    // next time use credential
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => UserPage(
                video: _controller,
              )),
    );
  }

  //Build matrix login page
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   backgroundColor: kPrimaryColor,
        //   title: const Text('Login'),
        // ),
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Stack(
            children: <Widget>[
              SizedBox.expand(
                child: FittedBox(
                  fit: BoxFit.fill,
                  child: SizedBox(
                    width: _controller?.value.size.width ?? 0,
                    height: _controller?.value.size.height ?? 0,
                    child: VideoPlayer(_controller!),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(
                      onSubmitted: (_) => submitHandler(),
                      onChanged: inputHandler(context),
                      style: const TextStyle(color: Colors.white),
                      cursorColor: kPrimaryColor,
                      decoration: const InputDecoration(
                          hintText: '0x2388891',
                          hintStyle: TextStyle(color: Colors.white),
                          labelText: 'Click me',
                          labelStyle: TextStyle(color: Colors.white),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF4700a9)),
                          )),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: submitHandler,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: kPrimaryColor,
                          ),
                          child: const Text('Encode'),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
