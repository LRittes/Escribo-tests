List myListFiltered(List l, List idx) {
  List result = [];
  for (var i = 0; i < l.length; i++) {
    if (idx.contains(i)) continue;
    result.add(l[i]);
  }
  return result;
}
