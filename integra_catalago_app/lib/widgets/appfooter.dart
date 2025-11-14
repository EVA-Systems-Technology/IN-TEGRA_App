import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class IntegraFooter extends StatelessWidget {
  const IntegraFooter({super.key});

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color(0xff151B55);

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 32, 16, 16),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 24.0,
            ),
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Fale Conosco',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Alexandria',
                        ),
                      ),
                      Gap(12),
                      Text(
                        'contato@integra.com',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontFamily: 'Alexandria',
                        ),
                      ),
                      Gap(4),
                      Text(
                        '(11) 3282-2362',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontFamily: 'Alexandria',
                        ),
                      ),
                    ],
                  ),
                ),

                Row(
                  children: [
                    IconButton(
                      icon: Image.asset(
                        'assets/icons/instagram.png',
                        width: 40,
                      ),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Image.asset('assets/icons/facebook.png', width: 40),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Image.asset('assets/icons/whatsapp.png', width: 40),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Gap(16),
          Text(
            'Todos os direitos reservados Copyright@2025',
            style: TextStyle(color: Colors.grey[700], fontSize: 12),
          ),
        ],
      ),
    );
  }
}
