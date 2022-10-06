import 'dart:math';

final Random _random = Random();

int generateId() {
  return _random.nextInt(999999);
}

const String mockTitle1 = 'title 1';
const String mockTitle2 = 'title 2';
const List<String> videoPaths = <String>[
  'https://assets.mixkit.co/videos/preview/mixkit-rolling-slowly-on-roller-skates-during-sunset-34547-large.mp4',
  'https://assets.mixkit.co/videos/preview/mixkit-sitting-by-the-edge-of-the-swimming-pool-1270-large.mp4',
  'https://assets.mixkit.co/videos/preview/mixkit-girl-lying-in-an-armchair-using-an-ipad-4959-large.mp4',
  'https://assets.mixkit.co/videos/preview/mixkit-young-sportsman-jumping-rope-at-home-5050-large.mp4',
  'https://assets.mixkit.co/videos/preview/mixkit-an-artists-hand-detailing-an-abstract-portrait-5272-large.mp4',
  'https://assets.mixkit.co/videos/preview/mixkit-dark-beer-with-a-lot-of-foam-in-a-beautiful-8700-large.mp4',
  'https://assets.mixkit.co/videos/preview/mixkit-woman-is-lovingly-welcomed-at-her-friends-house-12130-large.mp4',
  'https://assets.mixkit.co/videos/preview/mixkit-practicing-with-a-tibetan-bowl-during-meditation-32634-large.mp4',
  'https://assets.mixkit.co/videos/preview/mixkit-meditating-peacefully-in-yoga-pose-at-home-32633-large.mp4',
  'https://assets.mixkit.co/videos/preview/mixkit-two-friends-dressed-up-for-halloween-taking-a-selfie-34455-large.mp4',
];
const String videoPath2 =
    'https://static.videezy.com/system/resources/previews/000/013/362/original/Timelapse_Mountains_5_-_90s_-_4k_res.mp4';
const String mockDescription =
    "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.";
