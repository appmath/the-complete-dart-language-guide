void main() {
  const emails = [
    'abc@abc.com',
    'me@example.co.uk',
    'john@gmail.com.com',
    'katy@yahoo.com'
  ];

  const knownDomains = ['gmail.com', 'yahoo.com'];

  final unknownDomains = getUnknowDomains(emails, knownDomains);

  print('unknownDomains: $unknownDomains');
}

Iterable<String> getUnknowDomains(
    List<String> emails, List<String> knownDomains) {
  return emails
      .map((email) => email.split('@').last)
      .where((domain) => !knownDomains.contains(domain));
}
