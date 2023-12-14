import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    String? _city;
    AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
    void _submit() {
      setState(() {
        autovalidateMode = AutovalidateMode.always;
      });

      final form = _formKey.currentState;

      if (form != null && form.validate()) {
        form.save();
        Navigator.pop(context, _city!.trim());
      }
    }

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'Search',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Form(
        key: _formKey,
        autovalidateMode: autovalidateMode,
        child: Stack(
          children: [
            // Background Image
            Image.asset(
              'assets/search_background.jpg',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            // Glassmorphic effect
            Container(
              color: Colors.black
                  .withOpacity(0.3), // Adjust opacity for the glass effect
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/app_icon.png',
                      width: 100,
                      height: 100,
                    ),
                    const SizedBox(height: 20.0),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/images/02n.png',
                            width: 24,
                            height: 24,
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: TextFormField(
                              autofocus: true,
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.white, // Text color
                              ),
                              decoration: InputDecoration(
                                labelText: 'City name',
                                hintText: 'more than 2 characters',
                                border: InputBorder.none,
                              ),
                              validator: (String? input) {
                                if (input == null || input.trim().length < 2) {
                                  return 'City name must be at least 2 characters long';
                                }
                                return null;
                              },
                              onSaved: (String? input) {
                                _city = input;
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    ElevatedButton(
                      onPressed: _submit,
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 12.0, horizontal: 24.0),
                        primary: Colors.blue, // Replace with your gradient
                        // Add gradient colors as needed
                        onPrimary: Colors.white,
                        elevation: 0,
                      ),
                      child: const Text(
                        "How's weather?",
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
