import 'package:flutter/material.dart';
import 'package:prohub/constants/colors.dart';
import 'package:prohub/constants/size.dart';
import 'package:prohub/constants/sns_links.dart';
import 'package:prohub/widgets/custom_text_field.dart';
import 'dart:js' as js;

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
      width: double.maxFinite,
      color: CustomColor.bgLight1,
      child: Column(
        children: [
          // Title
          const Text(
            "Get in touch",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: CustomColor.whitePrimary,
            ),
          ),
          const SizedBox(height: 50),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 700),
            child: Column(
              children: [
                LayoutBuilder(
                  builder: (context, constraints) {
                    if (constraints.maxWidth >= kMinDesktopWidth) {
                      return buildNameEmailFieldDesktop();
                    } else {
                      return buildNameEmailFieldMobile();
                    }
                  },
                ),
                const SizedBox(height: 15),
                // Message
                ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: 700,
                  ),
                  child: CustomTextField(
                    hintText: "Your Message",
                    maxLines: 8,
                  ),
                ),
                const SizedBox(height: 20),
                // Send button
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 700),
                  child: SizedBox(
                    width: double.maxFinite,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 149, 109, 41),
                      ),
                      child: const Text("Get in touch"),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: 300,
                  ),
                  child: const Divider(),
                ),
                const SizedBox(height: 30),
                // SNS icon buttons
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  alignment: WrapAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        js.context.callMethod('open', [SnsLinks.linkedin]);
                      },
                      child: Image.asset(
                        'assets/linkedin.png',
                        width: 28,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        js.context.callMethod('open', [SnsLinks.github]);
                      },
                      child: Image.asset(
                        'assets/github.png',
                        width: 28,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        js.context.callMethod('open', [SnsLinks.medium]);
                      },
                      child: Image.asset(
                        'assets/medium.png',
                        width: 28,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        js.context.callMethod('open', [SnsLinks.instagram]);
                      },
                      child: Image.asset(
                        'assets/instagram.png',
                        width: 28,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        js.context.callMethod('open', [SnsLinks.twitter]);
                      },
                      child: Image.asset(
                        'assets/twitter.png',
                        width: 28,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Row buildNameEmailFieldDesktop() {
    return Row(
      children: [
        // Name
        Flexible(
          child: CustomTextField(
            hintText: "Your Name",
          ),
        ),
        const SizedBox(width: 15),
        // Email
        Flexible(
          child: CustomTextField(
            hintText: "Your Email",
          ),
        ),
      ],
    );
  }

  Column buildNameEmailFieldMobile() {
    return Column(
      children: [
        // Name
        CustomTextField(
          hintText: "Your Name",
        ),
        const SizedBox(height: 15),
        // Email
        CustomTextField(
          hintText: "Your Email",
        ),
      ],
    );
  }
}
