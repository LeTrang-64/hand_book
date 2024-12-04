import 'package:flutter_handbook/src/json_logic/json_logic_v2.dart';

void main() {
  final data = {
    'date': 18269869869,
    'user_id': 11499,
  };
  final answer = JsonLogicV2.apply(mockLogic, data);
  print(answer);
}

Map<String, dynamic> mockLogic = {
  "and": [
    {
      "in": [
        {"var": "user_id"},
        [11699, 11753, 107372, 590, 107371]
      ]
    },
    {
      "!": {
        "in": [
          {"var": "user_id"},
          [11499, 590]
        ]
      }
    },
    {
      ">=": [
        {"var": "date"},
        1729503
      ]
    }
  ]
};


