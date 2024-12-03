import 'package:demo_app/screens/natural_language/components/natural_language_capability_window.dart';
import 'package:demo_app/screens/natural_language/natural_language_controller.dart';
import 'package:demo_app/values/inset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'dart:convert';

/// A "window" containing a text input field for collecting text for which named entity recognition will be performed
/// using Apple Intelligence.
///
/// This widget presents a "window" designed to look like it is from a 1980s computer interface. The window includes a
/// text input field for collecting text that will be processed by Apple Intelligence for named entity recognition.
/// Initially, the named entities are unknown (because no text has been submitted for processing). When the user submits
/// text for named entity recognition, the named entities are displayed in the window.
class NamedEntityRecognitionWindow extends StatelessWidget {
  /// Creates an instance of [NamedEntityRecognitionWindow].
  const NamedEntityRecognitionWindow({
    required this.state,
    super.key,
  });

  /// A controller for this view.
  final NaturalLanguageController state;

  @override
  Widget build(BuildContext context) {
    return NaturalLanguageCapabilityWindow(
      displayFormat: NaturalLanguageCapabilityWindowDisplayFormat.plain,
      title: AppLocalizations.of(context)!.naturalLanguageNamedEntityRecognition,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // A text field collecting text for language identification
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Inset.medium,
            ),
            child: TextField(
              controller: state.namedEntityRecognitionTextController,
              onSubmitted: state.onRecognizeNamedEntities,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).primaryColor,
                  ),
              decoration: InputDecoration(
                suffixIcon: GestureDetector(
                  onTap: state.onRecognizeNamedEntities,
                  child: Icon(
                    Icons.category_outlined,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ),
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              Divider(
                color: Theme.of(context).primaryColor,
                height: Inset.medium,
                thickness: Inset.xxxSmall,
                indent: Inset.small,
                endIndent: Inset.small,
              ),
              const ColoredBox(
                color: Colors.white,
                child: Icon(
                  Icons.arrow_downward_sharp,
                  size: 14,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(right: 28),
                child: ColoredBox(
                  color: Colors.white,
                  child: Icon(
                    Icons.arrow_downward_sharp,
                    size: 14,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 28),
                child: ColoredBox(
                  color: Colors.white,
                  child: Icon(
                    Icons.arrow_downward_sharp,
                    size: 14,
                  ),
                ),
              ),
            ],
          ),

          // A text representation of the identified sentiment
          Padding(
            padding: const EdgeInsets.only(
              left: Inset.medium,
              top: Inset.small,
              right: Inset.medium,
            ),
            child: Text(
              '${AppLocalizations.of(context)!.naturalLanguageNamedEntityText}:',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).primaryColor,
                  ),
            ),
          ),
          if (state.namedEntities != null)
            Padding(
              padding: const EdgeInsets.only(
                left: Inset.large,
                top: Inset.small,
                right: Inset.large,
              ),
              child: Text(
                const JsonEncoder.withIndent('  ').convert(state.namedEntities),
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).primaryColor,
                    ),
              ),
            ),
        ],
      ),
    );
  }
}