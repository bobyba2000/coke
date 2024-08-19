// import 'package:coke_platform/generated/l10n.dart';
// import 'package:flutter/material.dart';

// enum LandingPageType {
//   home,
//   about,
//   candidateProfile,
//   openOpportunities;

//   @override
//   String toString() {
//     switch (this) {
//       case LandingPageType.home:
//         return S.current.home;
//       case LandingPageType.about:
//         return S.current.about;
//       case LandingPageType.candidateProfile:
//         return S.current.candidateProfile;
//       case LandingPageType.openOpportunities:
//         return S.current.openOpportunities;
//     }
//   }
// }

// class ProgressWidget extends StatelessWidget {
//   final LandingPageType current;
//   final void Function(LandingPageType type) onSelect;
//   const ProgressWidget({
//     super.key,
//     required this.current,
//     required this.onSelect,
//   });

//   @override
//   Widget build(BuildContext context) {
//     const values = LandingPageType.values;
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       crossAxisAlignment: CrossAxisAlignment.end,
//       children: List.generate(
//         values.length,
//         (index) {
//           final type = values[index];
//           final isCurrent = type == current;
//           return ProgressItemWidget(
//             type: type,
//             isCurrent: isCurrent,
//             onTap: () => onSelect.call(type),
//           );
//         },
//       ),
//     );
//   }
// }

// class ProgressItemWidget extends StatefulWidget {
//   final LandingPageType type;
//   final bool isCurrent;
//   final VoidCallback onTap;
//   const ProgressItemWidget({
//     super.key,
//     required this.type,
//     required this.isCurrent,
//     required this.onTap,
//   });

//   @override
//   State<ProgressItemWidget> createState() => _ProgressItemWidgetState();
// }

// class _ProgressItemWidgetState extends State<ProgressItemWidget> {
//   bool isHover = false;
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: widget.onTap,
//       onHover: (value) {
//         setState(() {
//           isHover = value;
//         });
//       },
//       child: Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(6),
//           color: isHover ? Colors.white.withOpacity(0.2) : Colors.transparent,
//         ),
//         padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
//         margin: const EdgeInsets.symmetric(vertical: 6),
//         child: Text(
//           widget.type.toString(),
//           style: Theme.of(context).textTheme.bodyMedium?.copyWith(
//                 color: widget.isCurrent ? Colors.white : Colors.white.withOpacity(0.7),
//                 fontWeight: widget.isCurrent ? FontWeight.bold : null,
//               ),
//         ),
//       ),
//     );
//   }
// }
