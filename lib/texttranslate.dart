import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:Translate/utils/Colors.dart';
import 'package:Translate/utils/languages.dart';
import 'package:translator/translator.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class TextTranslate extends StatefulWidget {
  const TextTranslate({Key? key}) : super(key: key);

  @override
  _TextTranslateState createState() => _TextTranslateState();
}

class _TextTranslateState extends State<TextTranslate> {
  String? selectedto = "English";
  bool isTranslate = true;
  var finaltext = "";

  TextEditingController textController = TextEditingController();
  int initialindex = 1;
  final translator = GoogleTranslator();
  final FlutterTts flutterTts = FlutterTts();
  var output;

  translate(String text, String lang) async {
    await translator.translate(text, to: lang).then((value) {
      setState(() {
        output = value;
        isTranslate = true;
      });
    });
    await flutterTts.setLanguage(lang);
    await flutterTts.setPitch(0.7);
    await flutterTts.speak(output.toString());
  }

  final stt.SpeechToText _speachtotext = stt.SpeechToText();
  bool isListening = false;

  listen() async {
    if (isListening == false) {
      bool available = await _speachtotext.initialize(
          onStatus: (v) => {}, onError: (v) => {});
      if (available) {
        setState(() {
          isListening = true;
        });
        _speachtotext.listen(onResult: (value) {
          output = value.recognizedWords;
        });
      }
    } else {
      setState(() {
        isListening = false;
      });
    }
  }

  var size;
  var height;
  var width;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      extendBody: true,
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: height / 15,
                ),
                Card(
                  color: Colors.white.withAlpha(210),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  elevation: 25,
                  child: SizedBox(
                    height: height / 12,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            "Translate to",
                            style: TextStyle(
                              fontFamily: 'PoppinsRegular',
                              color: colorsUsed.textcolor,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Container(
                            decoration: const BoxDecoration(
                                // color: Colors.white.withAlpha(210),
                                ),
                            width: width / 2,
                            child: DropdownButtonFormField<String>(
                              dropdownColor: Colors.white70,
                              decoration: InputDecoration(
                                hoverColor: Colors.white.withAlpha(210),
                                fillColor: Colors.white.withAlpha(210),
                                focusColor: Colors.white.withAlpha(210),
                              ),
                              value: selectedto,
                              items: Translation_languages.select_languages
                                  .map((language) => DropdownMenuItem<String>(
                                        value: language,
                                        child: Text(
                                          language,
                                          style: TextStyle(
                                              fontFamily: 'PoppinsRegular',
                                              color: colorsUsed.textcolor),
                                        ),
                                      ))
                                  .toList(),
                              onChanged: (language) => setState(() {
                                selectedto = language;
                                isTranslate = false;
                                finaltext = textController.text;
                                translate(
                                    finaltext,
                                    Translation_languages.getLanguageCode(
                                        selectedto!));
                              }),
                              icon: const Icon(
                                Icons.arrow_drop_down,
                                color: Colors.deepPurpleAccent,
                              ),
                              iconSize: 32,
                              // // underline: SizedBox(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: height / 25,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    controller: textController,
                    onChanged: (language) => setState(() {
                      isTranslate = false;
                      finaltext = textController.text;
                      translate(finaltext,
                          Translation_languages.getLanguageCode(selectedto!));
                    }),
                    style: const TextStyle(
                        fontFamily: 'PoppinsRegular',
                        color: Colors.white,
                        fontSize: 20.0),
                    decoration: const InputDecoration(
                      labelText: 'Enter Text to Translate',
                      labelStyle: TextStyle(
                          fontFamily: 'PoppinsRegular',
                          fontSize: 20.0,
                          color: Colors.white),
                      hintText: "Enter Text",
                      hintStyle: TextStyle(
                          fontFamily: 'PoppinsRegular',
                          fontSize: 13.0,
                          color: Colors.white),
                      enabledBorder: const OutlineInputBorder(
                        // width: 0.0 produces a thin "hairline" border
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: const BorderSide(
                          color: Colors.grey,
                          width: 4.0,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide(
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: height / 35,
                ),
                Center(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: const CircleBorder(),
                              primary: colorsUsed.iconcolor,
                            ),
                            onPressed: () => Clipboard.setData(
                                ClipboardData(text: textController.toString())),
                            child: Icon(
                              Icons.copy,
                              color: colorsUsed.buttoncolor,
                            ),
                          ),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: const CircleBorder(),
                                primary: colorsUsed.iconcolor,
                              ),
                              onPressed: () {
                                setState(() {
                                  isTranslate = false;
                                });
                                output = "";
                                setState(() {
                                  finaltext = textController.text;
                                });
                                translate(
                                    finaltext,
                                    Translation_languages.getLanguageCode(
                                        selectedto!));
                              },
                              child: isTranslate != null
                                  ? const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Icon(Icons.arrow_forward_ios,
                                          color: Colors.white),
                                    )
                                  : Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: CircularProgressIndicator(
                                        color: colorsUsed.textcolor,
                                      ),
                                    )),
                        ],
                      ),
                      SizedBox(
                        height: height / 45,
                      ),
                      output == null
                          ? const SizedBox()
                          : Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: SizedBox(
                                width: width,
                                child: Card(
                                    color: Colors.white.withAlpha(210),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8)),
                                    elevation: 25,
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Text(
                                        output == null ? "" : output.toString(),
                                        textAlign: selectedto == "Arabic"
                                            ? TextAlign.right
                                            : TextAlign.left,
                                        style: const TextStyle(
                                            fontFamily: 'PoppinsRegular',
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),
                                    )),
                              ),
                            ),
                      SizedBox(
                        height: height * 0.13,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: AvatarGlow(
        animate: isListening,
        glowColor: Colors.white,
        endRadius: 75,
        duration: const Duration(milliseconds: 2000),
        repeatPauseDuration: const Duration(milliseconds: 100),
        repeat: true,
        child: FloatingActionButton(
            backgroundColor: colorsUsed.iconcolor,
            onPressed: () {
              listen();
              translate(finaltext,
                  Translation_languages.getLanguageCode(selectedto!));
            },
            child: isListening
                ? const Icon(
                    Icons.mic,
                    color: Colors.white,
                  )
                : const Icon(Icons.mic_none, color: Colors.white)),
      ),
    );
  }

  String speechToText = "Press the button and start speaking";
}
