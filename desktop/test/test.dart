

void main(){
    String source = "00:03:32";

    // source = source.replaceAll(RegExp(r'[.:\s]'), '');

    List<String> test = source.split(RegExp(r'[.:\s]'));

    print(test);
}