import 'package:flutter/material.dart';

import '../components/projectlists.dart';

class ProjectScreen extends StatelessWidget {
  const ProjectScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: ourapplists.length,
      shrinkWrap: true,
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
      itemBuilder: (BuildContext context, int index) {
        var ourapps = ourapplists[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: PhysicalModel(
            color: Colors.white.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
            elevation: 10,
            child: Container(
              height: 250,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 0,
                    child: SizedBox(
                      width: 80,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 12),
                            child: Image.asset(ourapps.image!),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 12),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Text(
                                ourapps.title!,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                    fontSize: 20),
                              ),
                            ),
                            Expanded(
                              child: SingleChildScrollView(
                                physics: const NeverScrollableScrollPhysics(),
                                child: Text(ourapps.description!,
                                    style: const TextStyle(color: Colors.white),
                                    textAlign: TextAlign.justify),
                              ),
                            ),
                            Expanded(
                              flex: 0,
                              child: InkWell(
                                onTap: () {
                                  // printer(lists.downloadLink);
                                },
                                child: Container(
                                  height: 50,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(4.0),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      'DownLoad Now',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
