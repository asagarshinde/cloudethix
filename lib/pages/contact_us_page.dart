import 'package:cloudethix/Responsive.dart';
import 'package:cloudethix/widgets/app_bar.dart';
import 'package:cloudethix/widgets/bottom_bar.dart';
import 'package:flutter/material.dart';

class ContactUsPage extends StatelessWidget {
  const ContactUsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const EnquiryForm();
  }
}

class EnquiryForm extends StatefulWidget {
  const EnquiryForm({Key? key}) : super(key: key);

  @override
  State<EnquiryForm> createState() => _EnquiryFormState();
}

class _EnquiryFormState extends State<EnquiryForm> {
  // create global key that uniquely identifies the form widget
  // and allows form validation
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? firstName;
  String? lastName;
  String? email;
  String? phoneNumber;
  String? companyName;
  String? url;
  String? message;
  String? numberOfEmployees;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final mobilePadding = width * 0.02;
    final desktopPadding = width * 0.2;
    final horizontalPadding =
        Responsive.isDesktop(context) ? desktopPadding : mobilePadding;
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size(MediaQuery.of(context).size.width, 100),
            child: Header()),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(
                    horizontalPadding, 60, horizontalPadding, 300),
                child: Card(
                  elevation: 1.0,
                  color: const Color.fromRGBO(234, 234, 244, 1),
                  child: Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    CustomTextField(
                                      labelText: 'First Name*',
                                      onSaved: (value) {
                                        setState(() {
                                          firstName = value.toString();
                                        });
                                      },
                                      validator: (value) {},
                                    ),
                                    CustomTextField(
                                      labelText: 'Email*',
                                      keyboardType: TextInputType.emailAddress,
                                      onSaved: (value) {},
                                      validator: (value) {},
                                    ),
                                    CustomTextField(
                                      labelText: 'Company Name*',
                                      onSaved: (value) {},
                                      validator: (value) {},
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    CustomTextField(
                                      labelText: 'Last Name*',
                                      onSaved: (value) {},
                                      validator: (value) {},
                                    ),
                                    CustomTextField(
                                      labelText: 'Phone Number*',
                                      keyboardType: TextInputType.phone,
                                      onSaved: (value) {},
                                      validator: (value) {},
                                    ),
                                    CustomTextField(
                                      labelText: 'Website URL*',
                                      onSaved: (value) {},
                                      validator: (value) {},
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          CustomTextField(
                            labelText: 'Number Of Employees*',
                            keyboardType: TextInputType.number,
                            onSaved: (value) {},
                            validator: (value) {},
                          ),
                          CustomTextField(
                            labelText: 'Enter a message*',
                            // for multiline use maxlines and keyborad type is TextInputType.multiline
                            maxLines: 10,
                            keyboardType: TextInputType.multiline,
                            onSaved: (value) {},
                            validator: (value) {},
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          ElevatedButton(
                              onPressed: () async {
                                _formKey.currentState!.save();
                              },
                              child: const Text('Submit')),
                          const SizedBox(
                            height: 30,
                          ),
                          const Text(
                            "We're committed to your privacy. HubSpot uses the information "
                            "you provide to us to contact you about our relevant "
                            "content, products, and services.",
                            style: TextStyle(fontSize: 20),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Bottom()
            ],
          ),
        ));
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {Key? key,
      // this.hintText,
      required this.labelText,
      required this.onSaved,
      required this.validator,
      this.maxLines = 1,
      this.keyboardType})
      : super(key: key);

  // final hintText;
  final String labelText;
  final FormFieldSetter<String> onSaved;
  final FormFieldValidator<String> validator;
  final TextInputType? keyboardType;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        keyboardType: keyboardType ?? TextInputType.text,
        onSaved: onSaved,
        maxLines: maxLines,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.0),
          ),
          hintStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          labelText: labelText,
        ),
        // The validator receives the text that the user has entered.
        validator: validator,
      ),
    );
  }
}
