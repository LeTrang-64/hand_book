void main(){
  print('trang      tét    '.trim()
      .split(RegExp(r'\s+'))
      .map((word) => word.toLowerCase())
      .join('_'));
}