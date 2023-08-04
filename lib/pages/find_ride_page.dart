import 'package:bikerzone/components/filter_dropdown_custom.dart';
import 'package:bikerzone/components/ride_card_custom.dart';
import 'package:flutter/material.dart';

class FindRidePage extends StatefulWidget {
  const FindRidePage({super.key});
  @override
  State<FindRidePage> createState() => _FindRidePageState();
}

class _FindRidePageState extends State<FindRidePage> {
  bool isFilterShown = false;

  void _handleDataRecieved(bool filter) {
    setState(() {
      isFilterShown = filter;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEAF2F4),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(children: [
              OfferOverviewCustom(
                  isFilterShown: isFilterShown,
                  onDataRecieved: _handleDataRecieved),
              Visibility(
                visible: isFilterShown,
                child: const FilterDropdownCustom(),
              ),
              const RideCardCustom(),
              const RideCardCustom(),
              const RideCardCustom(),
              const RideCardCustom(),
              const RideCardCustom()
            ]),
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class OfferOverviewCustom extends StatefulWidget {
  OfferOverviewCustom(
      {super.key, required this.isFilterShown, required this.onDataRecieved});
  bool isFilterShown;
  final void Function(bool) onDataRecieved;

  @override
  State<OfferOverviewCustom> createState() => _OfferOverviewCustomState();
}

class _OfferOverviewCustomState extends State<OfferOverviewCustom> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color((0xFF394949)),
      height: 85,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 65,
          ),
          const Text(
            "Istražite ponudu",
            style: TextStyle(
              fontSize: 22,
              color: Color(0xFFEAEAEA),
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: GestureDetector(
              onTap: () => {
                setState(() {
                  widget.onDataRecieved(!widget.isFilterShown);
                })
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  color: const Color(0xFF394949),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.8),
                      blurRadius: 4,
                      offset: const Offset(0, 0),
                    )
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    widget.isFilterShown ? Icons.close : Icons.filter_alt,
                    color: const Color(0xFFEAEAEA),
                    size: 35,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
