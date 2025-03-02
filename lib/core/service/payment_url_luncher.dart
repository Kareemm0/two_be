import 'package:url_launcher/url_launcher.dart';

Future<void> launchPaymentUrl(String url) async {
  if (await canLaunchUrl(Uri.parse(url))) {
    await launchUrl(Uri.parse(url));
  } else {
    throw Exception('Could not launch $url');
  }
}
