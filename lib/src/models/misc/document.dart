class FileDocument {
  final String url;
  final String? data;

  const FileDocument({required this.url, this.data});

  Map<String, dynamic> toMap() {
    return {
      'url': url,
      'data': data,
    };
  }

  factory FileDocument.fromMap(Map<String, dynamic> map) {
    return FileDocument(
      url: map['url'] ?? '',
      data: map['data'],
    );
  }

  @override
  String toString() => 'FileDocument(url: $url, data: $data)';

  FileDocument copyWith({
    String? url,
    String? data,
  }) {
    return FileDocument(
      url: url ?? this.url,
      data: data ?? this.data,
    );
  }
}
