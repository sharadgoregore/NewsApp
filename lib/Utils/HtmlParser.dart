import 'package:html/parser.dart' as html_parser;
import 'package:html/dom.dart' as dom;

// To parse HTMl String and remove symbols
String parseHtmlString(String htmlString) {
  final document = html_parser.parse(htmlString);
  return _parseElement(document.body!);
}

String _parseElement(dom.Element element) {
  final buffer = StringBuffer();

  for (final node in element.nodes) {
    if (node is dom.Element) {
      buffer.write(_parseElement(node));
    } else if (node is dom.Text) {
      buffer.write(node.text);
    }
  }

  return buffer.toString();
}
