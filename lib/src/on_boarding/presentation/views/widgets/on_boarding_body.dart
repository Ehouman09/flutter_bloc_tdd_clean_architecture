import 'package:educationapp/core/extensions/context_extention.dart';
import 'package:educationapp/core/res/colours.dart';
import 'package:educationapp/core/res/fonts.dart';
import 'package:educationapp/src/on_boarding/domain/entities/page_content.dart';
import 'package:educationapp/src/on_boarding/presentation/cubit/on_boarding_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnBoardingBody extends StatelessWidget {

  const OnBoardingBody({required this.pageContent, super.key});

  final PageContent pageContent;

  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        Image.asset(
          pageContent.image,
          height: context.height *.4,
        ),

        SizedBox(height: context.height * .03,),

        Padding(
            padding: const EdgeInsets.all(20).copyWith(bottom: 0),
            child: Column(
              children: [

                Text(
                  pageContent.title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontFamily: Fonts.aeonik,
                    fontSize: 40,
                  ),
                ),

                SizedBox(height: context.height * .02,),

                Text(
                  pageContent.description,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 14,
                  ),
                ),

                SizedBox(height: context.height * .05,),
                
                ElevatedButton(
                    onPressed: () async {

                      //TODO
                      await context.read<OnBoardingCubit>().cacheFirstTimer();
                    },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 50,
                      vertical: 17,
                    ),
                    backgroundColor:  Colours.primaryColour,
                    foregroundColor: Colors.white,
                  ),
                    child: const Text(
                      'Get Started',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontFamily: Fonts.aeonik,
                      ),
                    ),
                ),

              ],
            ),
        ),

      ],
    );

  }
}
