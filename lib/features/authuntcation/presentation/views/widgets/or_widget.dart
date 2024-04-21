import 'package:afro_app/core/theme/styles.dart';
import 'package:flutter/material.dart';

class ORWidget extends StatelessWidget {
  const ORWidget ({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const Expanded(
                      child: Divider(
                        thickness: .5,
                        color: Colors.grey,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        'or',
                        style: Styles.textStyle12.copyWith(fontSize: 16),
                      ),
                    ),
                    const Expanded(
                      child: Divider(
                        thickness: .5,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              );
  }
}