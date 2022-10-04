import 'dart:math';

final Random _random = Random();

int generateId() {
  return _random.nextInt(999999);
}

const String mockTitle1 = 'title 1';
const String mockTitle2 = 'title 2';
const String videoPath1 =
    'https://static.videezy.com/system/resources/previews/000/013/367/original/timelapse_tropical_clouds_and_palm_trees_29s_4kres.mp4';
const String videoPath2 =
    'https://static.videezy.com/system/resources/previews/000/013/362/original/Timelapse_Mountains_5_-_90s_-_4k_res.mp4';
const String mockDescription =
    'solid OpenSCAD_Model\nfacet normal -1.000000 -0.000000 -0.000000\nouter loop\nvertex -5.000000 -5.000000 0.000000\nvertex -5.000000 -5.000000 10.000000\nvertex -5.000000 5.000000 0.000000\nendloop\nendfacet\nfacet normal -1.000000 0.000000 0.000000\nouter loop\nvertex -5.000000 5.000000 0.000000\nvertex -5.000000 -5.000000 10.000000\nvertex -5.000000 5.000000 10.000000\nendloop\nendfacet';
