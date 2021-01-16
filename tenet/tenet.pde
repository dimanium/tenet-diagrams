
import garciadelcastillo.dashedlines.*;

DashedLines dash;

class Event {
  int x;
  int fromY;
  int toY;
  String text;
  int textY;
  int textAlign;
  int[] dotYArr;
  Event(int x, int fromY, int toY, String text, int textAlign, int textY, int[] dotYArr) {
    this.x = x;
    this.fromY = fromY;
    this.toY = toY;
    this.text = text;
    this.textY = textY;
    this.textAlign = textAlign;
    this.dotYArr = dotYArr;
  }
  void draw() {
    int xx = BASE_X + x;

    stroke(0);
    strokeWeight(1);

    fill(0);
    for (int i = 0; i < dotYArr.length; i++) {
      circle(xx, dotYArr[i], W);
    }

    textAlign(textAlign);
    int xDelta = 0;
    if (textAlign == LEFT) {
      dash.line(xx, fromY, xx, toY);
      xDelta = 3;
      fill(0, 127);
    } else if (textAlign == RIGHT) {
      line(xx, fromY, xx, toY);
      xDelta = -3;
      fill(0);
    }
    text(text, BASE_X + x + xDelta, textY);
  }
}

// colors are from https://github.com/chriskempson/tomorrow-theme

color RED = #c82829;
color ORANGE = #f5871f;
color YELLOW = #eab700;
color GREEN = #718c00;
color AQUA = #3e999f;
color BLUE = #4271ae;
color PURPLE = #8959a8;

color I_RED = #cc6666;
color I_ORANGE = #de935f;
color I_YELLOW = #f0c674;
color I_GREEN = #b5bd68;
color I_AQUA = #8abeb7;
color I_BLUE = #81a2be;
color I_PURPLE = #b294bb;



int W = 5;

int BASE_X = 50;
//int BASE_X = -800;
int BASE_Y = 50;

int L_BEGIN_X = BASE_X;
int L_END_X = BASE_X + 1800;

int lineDelta = 7 * W + 2 * W;

int AREA_DELTA = 4 * W;

int I_Y1 = BASE_Y;
int I_Y2 = I_Y1 + lineDelta + 3 * W;
int N_Y = I_Y2 + lineDelta;
int P_Y = N_Y + lineDelta;
int K_Y = P_Y + lineDelta;
int S_Y = K_Y + lineDelta;

int MIDDLE_Y = S_Y + 110;

int IS_Y = S_Y + 220;
int IP_Y = IS_Y + lineDelta;
int ALG_Y = IP_Y + 12 + W;
int II_Y = IP_Y + 2 * lineDelta + 3 * W;
int IK_Y = II_Y + lineDelta;
int IN_Y = IK_Y + lineDelta;

int COMMENT_Y0 = I_Y1;
int COMMENT_Y1 = N_Y - 80;
int COMMENT_Y2 = S_Y + 40;
int COMMENT_Y3 = IS_Y - 80;
int COMMENT_Y4 = IP_Y + 40;

int X001 = 0;
int X002 = 60;
int X003 = 80;
int X004 = 140;
int X005 = 170;
int X006 = 180;

int X010 = 220;
int X011 = 290;
int X012 = 390;
int X013 = 425;
int X014 = 460;
int X015 = 530;
int X016 = 610;

int X020 = 700;
int X021 = 790;
int X022 = 810;
int X023 = 880;

int X030 = 960;
int X031 = 1060;
int X032 = 1020;
int X033 = 1080;
int X034 = 1100;

int X040 = 1150;
int X041 = 1170;
int X042 = 1210;
int X043 = 1220;
int X044 = 1280;
int X045 = 1290;
int X046 = 1310;

int X050 = 1380;
int X051 = 1450;
int X052 = 1530;

int X060 = 1630;
int X061 = 1700;
int X062 = 1770;
int X063 = 1850;

int X070 = 1930;
int X071 = 1970;
int X072 = 2010;
int X073 = 2080;
int X074 = 2160;

int X080 = 2220;
int X081 = 2260;
int X082 = 2300;
int X083 = 2380;

int delta_100 = 1030;

int X090 = 1430 + delta_100;
int X091 = 1500 + delta_100;
int X092 = 1580 + delta_100;
int X093 = 1660 + delta_100;
int X094 = 1720 + delta_100;

int X100 = 1780 + delta_100;
int X101 = 1850 + delta_100;
int X102 = 1920 + delta_100;
int X103 = 1940 + delta_100;
int X104 = 1970 + delta_100;
int X105 = 2000 + delta_100;

int X110 = 2020 + delta_100;
int X111 = 2070 + delta_100;
int X112 = 2090 + delta_100;
int X113 = 2160 + delta_100;
int X114 = 2200 + delta_100;
int X115 = 2220 + delta_100;

int X120 = 2250 + delta_100;
int X121 = 2340 + delta_100;
int X122 = 2440 + delta_100;
int X123 = 2500 + delta_100;

int X130 = 2540 + delta_100;

ArrayList<Event> events = new ArrayList<Event>();

void setup() {

  background(255);

  //scale(0.6);
  
  scale(2.0);

  //size(2200, 500);
  size(7350, 1600);

  dash = new DashedLines(this);
  dash.pattern(2, 2);
  dash.offset(2);

  strokeCap(SQUARE);

  events.add(new Event(X001, IS_Y, COMMENT_Y3, "IS gets away\nfrom Freeport", LEFT, COMMENT_Y3 + 10, new int[]{IS_Y}));
  events.add(new Event(X001, IP_Y, IN_Y, "ITP will be put into\ncargo container\nwith IN and IK\non its way to Oslo", LEFT, COMMENT_Y4, new int[]{IP_Y, II_Y, IK_Y, IN_Y}));
  events.add(new Event(X002, K_Y, COMMENT_Y2 + 30, "S and K\nget to\nFreeport", RIGHT, COMMENT_Y2, new int[]{K_Y, S_Y}));
  events.add(new Event(X003, P_Y, COMMENT_Y1, "N and TP\nsee convoy,\nfollow it", RIGHT, COMMENT_Y1 + 10, new int[]{N_Y, P_Y}));
  events.add(new Event(X004, K_Y, COMMENT_Y2 + 45, "S and K\nargue,\nS hides\nin chamber", RIGHT, COMMENT_Y2, new int[]{K_Y, S_Y}));  
  events.add(new Event(X005, IP_Y, II_Y, "ITP is rescued\nby II-men", LEFT, COMMENT_Y4, new int[]{IP_Y, II_Y}));
  events.add(new Event(X006, P_Y, COMMENT_Y1, "N and TP\nget AlgPiece\n in orange case\nfrom convoy", RIGHT, COMMENT_Y1 + 10, new int[]{N_Y, P_Y}));

  events.add(new Event(X010, K_Y, MIDDLE_Y, "K is put\nin IAudi\nwith IS", RIGHT, COMMENT_Y2, new int[]{K_Y}));
  events.add(new Event(X010, IS_Y, MIDDLE_Y, "IS and K\nget to\nFreeport", LEFT, COMMENT_Y3 + 10, new int[]{IS_Y}));
  events.add(new Event(X011, MIDDLE_Y, COMMENT_Y1, "N and TP hear\n'not Estonian'", RIGHT, COMMENT_Y1 + 10, new int[]{N_Y, P_Y}));
  events.add(new Event(X011, IS_Y, MIDDLE_Y, "IS tells S-men\nto get AlgPiece\nfrom ISaab\nin Freeport", LEFT, COMMENT_Y3 + 10, new int[]{IS_Y}));
  events.add(new Event(X012, IS_Y, COMMENT_Y3, "IS returns\nto IAudi,\nIS and K\ndrive away", LEFT, COMMENT_Y3 + 10, new int[]{IS_Y}));
  events.add(new Event(X013, IS_Y, COMMENT_Y4 + 15, "IS talks to ITP,\nblows up ISaab", LEFT, COMMENT_Y4, new int[]{IS_Y, IP_Y}));
  events.add(new Event(X014, IS_Y, COMMENT_Y3, "IS and K\nstop near\ncrashed\nISaab", LEFT, COMMENT_Y3 + 10, new int[]{IS_Y}));
  events.add(new Event(X015, MIDDLE_Y, COMMENT_Y1, "N and TP\nencounter\nIS and K\nin IAudi", RIGHT, COMMENT_Y1 + 10, new int[]{N_Y, P_Y, K_Y}));
  events.add(new Event(X015, IS_Y, MIDDLE_Y, "", LEFT, COMMENT_Y3 + 10, new int[]{IS_Y}));
  events.add(new Event(X016, MIDDLE_Y, COMMENT_Y1, "N and TP\nsee ISaab\nuncrash,\nTP sees ITP", RIGHT, COMMENT_Y1 + 10, new int[]{N_Y, P_Y}));
  events.add(new Event(X016, IP_Y, MIDDLE_Y, "IS rams IAudi\ninto ISaab,\nISaab crashes", LEFT, COMMENT_Y3 + 10, new int[]{IS_Y, IP_Y}));

  events.add(new Event(X020, MIDDLE_Y, COMMENT_Y1, "TP throws\nempty case\nto IS through\nISaab hood", RIGHT, COMMENT_Y1 + 10, new int[]{P_Y}));
  events.add(new Event(X020, IP_Y, MIDDLE_Y, "IS uncatches\nempty case", LEFT, COMMENT_Y3 + 10, new int[]{IS_Y, IP_Y}));
  events.add(new Event(X021, MIDDLE_Y, COMMENT_Y1, "TP throws\nAlgPiece\ninto ISaab\nwith ITP", RIGHT, COMMENT_Y1 + 10, new int[]{P_Y}));
  events.add(new Event(X021, MIDDLE_Y, COMMENT_Y4 + 45, "ITP watches\nAlgPiece fly\nout of ISaab\ninto BMW", LEFT, COMMENT_Y4, new int[]{IP_Y}));
  events.add(new Event(X022, IP_Y, COMMENT_Y3, "IS sees ITP\nin ISaab,\nobserves\nhandoff", LEFT, COMMENT_Y3 + 10, new int[]{IS_Y, IP_Y}));
  events.add(new Event(X023, MIDDLE_Y, COMMENT_Y1, "K sees IS\nbacking\ninto Merc\nwith case", RIGHT, COMMENT_Y1 + 10, new int[]{K_Y}));
  events.add(new Event(X023, IS_Y, MIDDLE_Y, "IS gets into\nIAudi with\nempty case", LEFT, COMMENT_Y3 + 10, new int[]{IS_Y}));

  events.add(new Event(X030, IP_Y, COMMENT_Y3, "IS tells his men\nthat case and\nBMW glove box\nare empty", LEFT, COMMENT_Y3 + 10, new int[]{IS_Y}));
  events.add(new Event(X030, IP_Y, COMMENT_Y4 + 15, "ITP listens\nto IS", LEFT, COMMENT_Y4, new int[]{IP_Y}));
  events.add(new Event(X031, IP_Y, COMMENT_Y3, "IS unthrows\ncase from\nthe ground", LEFT, COMMENT_Y3 + 10, new int[]{IS_Y}));
  events.add(new Event(X031, IP_Y, COMMENT_Y4 + 30, "ITP sees Merc\non highway,\nfollows it", LEFT, COMMENT_Y4, new int[]{IP_Y}));
  events.add(new Event(X032, P_Y, COMMENT_Y2 + 15, "TP jumps\ninto IAudi", RIGHT, COMMENT_Y2, new int[]{P_Y, K_Y}));
  events.add(new Event(X033, P_Y, COMMENT_Y2 + 15, "TP stops\nIAudi", RIGHT, COMMENT_Y2, new int[]{P_Y, K_Y}));
  events.add(new Event(X034, N_Y, COMMENT_Y1, "N stops BMW and gets out,\nS-men arrive, start shooting,\nN hides behind KIA, calls I", RIGHT, COMMENT_Y1 + 10, new int[]{N_Y}));

  events.add(new Event(X040, IP_Y, COMMENT_Y4 + 45, "ITP\nreturns\nto ISaab,\nwaits", LEFT, COMMENT_Y4, new int[]{IP_Y}));
  events.add(new Event(X041, P_Y, MIDDLE_Y, "Merc rams\nIAudi with\nTP and K", RIGHT, COMMENT_Y2, new int[]{P_Y, K_Y}));
  events.add(new Event(X041, IS_Y, MIDDLE_Y, "IS gets\ninto Merc,\nunrams\nIAudi", LEFT, COMMENT_Y3 + 10, new int[]{IS_Y}));
  events.add(new Event(X042, K_Y, COMMENT_Y1, "S-men drag\nTP and K\nout of IAudi", RIGHT, COMMENT_Y1 + 10, new int[]{P_Y, K_Y}));
  events.add(new Event(X043, IP_Y, COMMENT_Y4 + 30, "ITP plants\nearpiece\nin case", LEFT, COMMENT_Y4, new int[]{IP_Y}));
  events.add(new Event(X044, K_Y, COMMENT_Y1, "S-men put\nTP and K\ninto Merc", RIGHT, COMMENT_Y1 + 10, new int[]{P_Y, K_Y}));
  events.add(new Event(X045, IP_Y, COMMENT_Y4 + 30, "ITP finds\ncase with\ntracker", LEFT, COMMENT_Y4, new int[]{IP_Y}));
  events.add(new Event(X046, IS_Y, COMMENT_Y3, "IS checks\nBMW glove\nbox, finds\nnothing", LEFT, COMMENT_Y3 + 10, new int[]{IS_Y}));

  events.add(new Event(X050, MIDDLE_Y, COMMENT_Y1, "TP and K are\ndriven away\nin Merc with IS", RIGHT, COMMENT_Y1 + 10, new int[]{P_Y, K_Y}));
  events.add(new Event(X050, IS_Y, MIDDLE_Y, "IS arrives\nat shootout\nscene", LEFT, COMMENT_Y3 + 10, new int[]{IS_Y}));
  events.add(new Event(X051, I_Y1, N_Y, "I-men\narrive at\nshootout\nto help N", RIGHT, COMMENT_Y1 + 10, new int[]{I_Y1, N_Y}));
  events.add(new Event(X052, MIDDLE_Y, COMMENT_Y1, "TP and K\nare taken\nto Freeport", RIGHT, COMMENT_Y1 + 10, new int[]{P_Y, K_Y}));
  events.add(new Event(X052, IS_Y, MIDDLE_Y, "IS drags K\ninto Merc", LEFT, COMMENT_Y3 + 10, new int[]{IS_Y}));

  events.add(new Event(X060, P_Y, MIDDLE_Y, "TP is dragged\nto red room,\nsees IS and K\nenter blue room", RIGHT, COMMENT_Y2, new int[]{P_Y, K_Y}));
  events.add(new Event(X060, IS_Y, MIDDLE_Y, "IS drags K\nout of\nblue room", LEFT, COMMENT_Y3 + 10, new int[]{IS_Y}));
  events.add(new Event(X061, P_Y, MIDDLE_Y, "TP sees IS\nput mask\non K", RIGHT, COMMENT_Y2, new int[]{P_Y, K_Y}));
  events.add(new Event(X061, IS_Y, MIDDLE_Y, "IS takes\nmask\noff K", LEFT, COMMENT_Y3 + 10, new int[]{IS_Y}));
  events.add(new Event(X062, P_Y, MIDDLE_Y, "TP sees IS\ntake off\nhis mask", RIGHT, COMMENT_Y2, new int[]{P_Y}));
  events.add(new Event(X062, IS_Y, MIDDLE_Y, "IS puts on\nhis mask", LEFT, COMMENT_Y3 + 10, new int[]{IS_Y}));
  events.add(new Event(X063, P_Y, MIDDLE_Y, "TP is\ninterrogated\nby IS", RIGHT, COMMENT_Y2, new int[]{P_Y}));
  events.add(new Event(X063, IS_Y, MIDDLE_Y, "IS\ninterrogates\nTP", LEFT, COMMENT_Y3 + 10, new int[]{IS_Y}));

  events.add(new Event(X070, P_Y, MIDDLE_Y, "TP\nhears\nIS say\n'3'", RIGHT, COMMENT_Y2, new int[]{P_Y}));
  events.add(new Event(X070, IS_Y, MIDDLE_Y, "IS\nsays\n'3'", LEFT, COMMENT_Y3 + 10, new int[]{IS_Y}));
  events.add(new Event(X071, P_Y, MIDDLE_Y, "TP\nhears\nIS say\n'2'", RIGHT, COMMENT_Y2, new int[]{P_Y}));
  events.add(new Event(X071, IS_Y, MIDDLE_Y, "IS\nsays\n'2'", LEFT, COMMENT_Y3 + 10, new int[]{IS_Y}));
  events.add(new Event(X072, P_Y, MIDDLE_Y, "TP\nhears\nIS say\n'1'", RIGHT, COMMENT_Y2, new int[]{P_Y}));
  events.add(new Event(X072, IS_Y, MIDDLE_Y, "IS\nsays\n'1'", LEFT, COMMENT_Y3 + 10, new int[]{IS_Y}));
  events.add(new Event(X073, P_Y, MIDDLE_Y, "TP sees IS\nshoot K,\nbullet hole\ndisappears", RIGHT, COMMENT_Y2, new int[]{P_Y, K_Y}));
  events.add(new Event(X073, IS_Y, MIDDLE_Y, "TP\nunshoots K,\nbullet hole\nappears", LEFT, COMMENT_Y3 + 10, new int[]{IS_Y}));
  events.add(new Event(X074, P_Y, MIDDLE_Y, "TP hears IS\nthreaten\nto kill K", RIGHT, COMMENT_Y2, new int[]{P_Y}));
  events.add(new Event(X074, IS_Y, MIDDLE_Y, "IS\nthreatens\nto kill K", LEFT, COMMENT_Y3 + 10, new int[]{IS_Y}));

  events.add(new Event(X080, P_Y, MIDDLE_Y, "TP\nhears\nIS say\n'1'", RIGHT, COMMENT_Y2, new int[]{P_Y}));
  events.add(new Event(X080, IS_Y, MIDDLE_Y, "IS\nsays\n'1'", LEFT, COMMENT_Y3 + 10, new int[]{IS_Y}));
  events.add(new Event(X081, P_Y, MIDDLE_Y, "TP\nhears\nIS say\n'2'", RIGHT, COMMENT_Y2, new int[]{P_Y}));
  events.add(new Event(X081, IS_Y, MIDDLE_Y, "IS\nsays\n'2'", LEFT, COMMENT_Y3 + 10, new int[]{IS_Y}));
  events.add(new Event(X082, P_Y, MIDDLE_Y, "TP\nhears\nIS say\n'3'", RIGHT, COMMENT_Y2, new int[]{P_Y}));
  events.add(new Event(X082, IS_Y, MIDDLE_Y, "IS\nsays\n'3'", LEFT, COMMENT_Y3 + 10, new int[]{IS_Y}));
  events.add(new Event(X083, P_Y, MIDDLE_Y, "TP\n'gives up',\nlies to IS\nabout BMW", RIGHT, COMMENT_Y2, new int[]{P_Y}));
  events.add(new Event(X083, IS_Y, MIDDLE_Y, "IS hears\nabout BMW,\nsays 'they'\nwill check", LEFT, COMMENT_Y3 + 10, new int[]{IS_Y}));

  events.add(new Event(X090, S_Y, COMMENT_Y2 + 30, "S appears\nin red\nroom", RIGHT, COMMENT_Y2, new int[]{S_Y}));
  events.add(new Event(X091, P_Y, MIDDLE_Y, "TP\nmentions\nglove box", RIGHT, COMMENT_Y2, new int[]{P_Y, S_Y}));
  events.add(new Event(X091, IS_Y, MIDDLE_Y, "IS hears TP\nmention\nglove box", LEFT, COMMENT_Y3 + 10, new int[]{IS_Y}));
  events.add(new Event(X092, P_Y, COMMENT_Y2 + 30, "S asks TP\n'which car',\nTP replies\n'already told'", RIGHT, COMMENT_Y2, new int[]{S_Y, P_Y}));
  events.add(new Event(X093, I_Y2, COMMENT_Y2 + 30, "I-men and N\nburst into\nred room", RIGHT, COMMENT_Y2, new int[]{I_Y2, N_Y}));
  events.add(new Event(X094, S_Y, MIDDLE_Y, "S runs\ninto\nturnstile", RIGHT, COMMENT_Y2, new int[]{S_Y}));
  events.add(new Event(X094, IS_Y, MIDDLE_Y, "IS gets\nout of\nturnstile", LEFT, COMMENT_Y3 + 10, new int[]{IS_Y}));

  //events.add(new Event(X060, COMMENT_Y1, IN_Y, "X060", RIGHT, COMMENT_Y1 + 10, new int[]{}));
  //events.add(new Event(X070, COMMENT_Y1, IN_Y, "X070", RIGHT, COMMENT_Y1 + 10, new int[]{}));
  //events.add(new Event(X080, COMMENT_Y1, IN_Y, "X080", RIGHT, COMMENT_Y1 + 10, new int[]{}));
  //events.add(new Event(X090, COMMENT_Y1, IN_Y, "X090", RIGHT, COMMENT_Y1 + 10, new int[]{}));
  //events.add(new Event(X100, COMMENT_Y1, IN_Y, "X100", RIGHT, COMMENT_Y1 + 10, new int[]{}));
  //events.add(new Event(X120, COMMENT_Y1, IN_Y, "X120", RIGHT, COMMENT_Y1 + 10, new int[]{}));
  //events.add(new Event(X130, COMMENT_Y1, IN_Y, "X130", RIGHT, COMMENT_Y1 + 10, new int[]{}));

  events.add(new Event(X101, I_Y2, COMMENT_Y2 - lineDelta + 30, "I-men\ntake over\nFreeport", RIGHT, COMMENT_Y2 - lineDelta, new int[]{I_Y2}));
  events.add(new Event(X102, I_Y2, COMMENT_Y2 - lineDelta + 30, "I-men\nmove K to\nred side", RIGHT, COMMENT_Y2 - lineDelta, new int[]{I_Y2, K_Y}));
  events.add(new Event(X103, II_Y, COMMENT_Y4, "II-men\nleave\nFreeport", LEFT, COMMENT_Y4 + 10, new int[]{II_Y}));
  events.add(new Event(X104, IP_Y, COMMENT_Y3 + lineDelta, "ITP\ndrives\naway", LEFT, COMMENT_Y3 + lineDelta + 10, new int[]{IP_Y}));
  events.add(new Event(X105, IN_Y, COMMENT_Y4, "II-men put\nIN and IK\nin cargo\ncontainer", LEFT, COMMENT_Y4 + 10, new int[]{II_Y, IN_Y, IK_Y}));

  events.add(new Event(X110, IP_Y, COMMENT_Y3 + lineDelta, "ITP gets\ninto ISaab,\ncan't find\nAlgPiece", LEFT, COMMENT_Y3 + lineDelta + 10, new int[]{IP_Y}));
  events.add(new Event(X111, I_Y2, COMMENT_Y2 - lineDelta + 45, "TP, N and I\ndiscuss\ntemporal\npincer", RIGHT, COMMENT_Y2 - lineDelta, new int[]{I_Y2, N_Y, P_Y, K_Y}));
  events.add(new Event(X112, IP_Y, COMMENT_Y3 + lineDelta, "ITP walks\noutside,\nsplashes\npuddle", LEFT, COMMENT_Y3 + lineDelta + 10, new int[]{IP_Y}));
  events.add(new Event(X113, IP_Y, COMMENT_Y3 + lineDelta, "ITP is briefed\nby IWheeler,\ntakes tracker\nfrom IN", LEFT, COMMENT_Y3 + lineDelta + 10, new int[]{IP_Y}));
  events.add(new Event(X115, I_Y2, COMMENT_Y2 - lineDelta + 45, "TP convinces\nN and I\nto invert\nto save K", RIGHT, COMMENT_Y2 - lineDelta, new int[]{I_Y2, N_Y, P_Y, K_Y}));

  events.add(new Event(X121, MIDDLE_Y, K_Y - AREA_DELTA - W, "S-men take\nAlgPiece\nfrom ISaab\nat Freeport", RIGHT, K_Y - AREA_DELTA - W + 10, new int[]{}));
  events.add(new Event(X121, MIDDLE_Y, ALG_Y, "", LEFT, COMMENT_Y4, new int[]{ALG_Y}));
  events.add(new Event(X122, ALG_Y, COMMENT_Y3 + 2 * lineDelta, "ISaab is parked\nnear Freeport\nblue exit", LEFT, COMMENT_Y3 + 2 * lineDelta + 10, new int[]{ALG_Y + 1}));
  events.add(new Event(X123, K_Y - AREA_DELTA, COMMENT_Y2 - 2 * lineDelta + 10 + 45, "Saab is produced\nin the past (not shown),\nbrought to Freeport\nby TENET men", RIGHT, COMMENT_Y2 - 2 * lineDelta + 10, new int[]{K_Y - AREA_DELTA + 2}));

  drawCars();
  drawCargoContainer();

  drawTimelineLabels();
  drawTimelines();

  drawCase();
  drawAlg();

  // inversion lines  
  strokeWeight(2);
  stroke(0);
  line(L_BEGIN_X + X100, S_Y - W, L_BEGIN_X + X100, IS_Y + W);
  line(L_BEGIN_X + X120, I_Y2 - W, L_BEGIN_X + X120, IP_Y + 3 * lineDelta + W);
  line(L_BEGIN_X + X130, K_Y - AREA_DELTA - W, L_BEGIN_X + X130, IP_Y + AREA_DELTA + W);

  // middle line
  stroke(0, 32);
  strokeWeight(1);
  line(L_BEGIN_X, MIDDLE_Y, L_BEGIN_X + X130, MIDDLE_Y);

  for (int i = events.size() - 1; i >= 0; i--) {
    Event event = events.get(i);
    event.draw();
  }


  String versionStr = "v2.1";

  fill(0);
  textAlign(RIGHT);
  text("Tenet Tallinn timeline\n" + versionStr + "\nmade with Processing.org", L_BEGIN_X + X130, IN_Y - 30);

  //save("tenet_tallinn_" + versionStr + ".png");
}

void drawTimelineLabels() {
  textAlign(RIGHT);
  fill(0);
  text("I", L_BEGIN_X - 7, I_Y1 + 5);
  text("N", L_BEGIN_X - 7, N_Y + 5);
  text("TP", L_BEGIN_X - 7, P_Y + 5);
  text("K", L_BEGIN_X - 7, K_Y + 5);
  text("S", L_BEGIN_X - 7, S_Y + 5);
  text("IS", L_BEGIN_X - 7, IS_Y + 5);
  text("ITP", L_BEGIN_X - 7, IP_Y + 5);
  text("II", L_BEGIN_X - 7, II_Y + 5);
  text("IK", L_BEGIN_X - 7, IK_Y + 5);
  text("IN", L_BEGIN_X - 7, IN_Y + 5);
}

void drawTimelines() {
  noFill();

  // I
  stroke(AQUA);
  strokeWeight(10);

  dash.line(L_BEGIN_X, I_Y1, L_BEGIN_X + X091, I_Y1);
  dash.offset(0);
  dash.bezier(L_BEGIN_X + X091, I_Y1, L_BEGIN_X + X091 + 80, I_Y1, L_BEGIN_X + X093 - 80, I_Y2, L_BEGIN_X + X093, I_Y2);
  dash.offset(2);
  line(L_BEGIN_X + X093 - 1, I_Y2, L_BEGIN_X + X120, I_Y2);

  //dash.line(L_BEGIN_X, I_Y1, L_BEGIN_X + X093, I_Y1);
  //line(L_BEGIN_X + X093, I_Y1, L_BEGIN_X + X094 + 1, I_Y1);
  //bezier(L_BEGIN_X + X094, I_Y1, L_BEGIN_X + X094 + 60, I_Y1, L_BEGIN_X + X101 - 60, I_Y2, L_BEGIN_X + X101, I_Y2);


  // II
  stroke(I_AQUA);
  strokeWeight(10);
  dash.line(L_BEGIN_X, II_Y, L_BEGIN_X + X112, II_Y); 
  bezier(L_BEGIN_X + X112, II_Y, L_BEGIN_X + X112 + 60, II_Y, L_BEGIN_X + X114 - 60, IP_Y + lineDelta, L_BEGIN_X + X114, IP_Y + lineDelta);
  line(L_BEGIN_X + X114 - 1, IP_Y + lineDelta, L_BEGIN_X + X120, IP_Y + lineDelta);


  // N
  stroke(BLUE);
  strokeWeight(10);
  line(L_BEGIN_X, N_Y, L_BEGIN_X + X042, N_Y);
  dash.line(L_BEGIN_X + X042, N_Y, L_BEGIN_X + X093, N_Y);
  line(L_BEGIN_X + X093, N_Y, L_BEGIN_X + X120, N_Y);

  // IN
  stroke(I_BLUE);
  strokeWeight(10);
  dash.line(L_BEGIN_X, IN_Y, L_BEGIN_X + X112, IN_Y); 
  bezier(L_BEGIN_X + X112, IN_Y, L_BEGIN_X + X112 + 60, IN_Y, L_BEGIN_X + X114 - 60, IP_Y + 3 * lineDelta, L_BEGIN_X + X114, IP_Y + 3 * lineDelta);
  line(L_BEGIN_X + X114 - 1, IP_Y + 3 * lineDelta, L_BEGIN_X + X120, IP_Y + 3 * lineDelta);


  // P
  stroke(PURPLE);
  strokeWeight(10);
  line(L_BEGIN_X, P_Y, L_BEGIN_X + X042, P_Y);
  dash.line(L_BEGIN_X + X042, P_Y, L_BEGIN_X + X052, P_Y);
  line(L_BEGIN_X + X052, P_Y, L_BEGIN_X + X120, P_Y);

  // IP
  stroke(I_PURPLE);
  strokeWeight(10);
  dash.line(L_BEGIN_X, IP_Y, L_BEGIN_X + X012, IP_Y);
  line(L_BEGIN_X + X012, IP_Y, L_BEGIN_X + X120, IP_Y);


  // K
  stroke(GREEN);
  strokeWeight(10);
  line(L_BEGIN_X, K_Y, L_BEGIN_X + X004, K_Y);
  dash.line(L_BEGIN_X + X004, K_Y, L_BEGIN_X + X012, K_Y);
  line(L_BEGIN_X + X012, K_Y, L_BEGIN_X + X042, K_Y);
  dash.line(L_BEGIN_X + X042, K_Y, L_BEGIN_X + X052, K_Y);
  line(L_BEGIN_X + X052, K_Y, L_BEGIN_X + X120, K_Y);

  // IK
  stroke(I_GREEN);
  strokeWeight(10);
  dash.line(L_BEGIN_X, IK_Y, L_BEGIN_X + X112, IK_Y);
  bezier(L_BEGIN_X + X112, IK_Y, L_BEGIN_X + X112 + 60, IK_Y, L_BEGIN_X + X114 - 60, IP_Y + 2 * lineDelta, L_BEGIN_X + X114, IP_Y + 2 * lineDelta);
  line(L_BEGIN_X + X114 - 1, IP_Y + 2 * lineDelta, L_BEGIN_X + X120, IP_Y + 2 * lineDelta);


  // S
  stroke(RED);
  strokeWeight(10);
  line(L_BEGIN_X, S_Y, L_BEGIN_X + X004, S_Y);
  dash.line(L_BEGIN_X + X004, S_Y, L_BEGIN_X + X090, S_Y);
  line(L_BEGIN_X + X090, S_Y, L_BEGIN_X + X100, S_Y);

  // IS
  stroke(I_RED);
  strokeWeight(10);
  dash.line(L_BEGIN_X, IS_Y, L_BEGIN_X + X012, IS_Y);
  line(L_BEGIN_X + X012, IS_Y, L_BEGIN_X + X046, IS_Y);
  dash.line(L_BEGIN_X + X046, IS_Y, L_BEGIN_X + X052, IS_Y);
  line(L_BEGIN_X + X052, IS_Y, L_BEGIN_X + X100, IS_Y);
}

void drawCase() {
  strokeWeight(W);
  stroke(ORANGE);
  noFill();
  beginShape();
  vertex(L_BEGIN_X + X006 + 3, COMMENT_Y1);
  vertex(L_BEGIN_X + X006 + 3, P_Y + 12);
  vertex(L_BEGIN_X + X020, P_Y + 12);
  vertex(L_BEGIN_X + X020, IS_Y - 12);
  vertex(L_BEGIN_X + X031 - 2, IS_Y - 12);
  vertex(L_BEGIN_X + X031 - 2, COMMENT_Y3);
  endShape();
  beginShape();
  vertex(L_BEGIN_X + X020, K_Y + 12);
  vertex(L_BEGIN_X + X023, K_Y + 12);
  vertex(L_BEGIN_X + X023, IS_Y - 12);
  endShape();
}

void drawAlg() {
  strokeWeight(W);
  stroke(127, 127, 127);
  noFill();
  beginShape();
  vertex(L_BEGIN_X + X006 + 10, COMMENT_Y1);
  vertex(L_BEGIN_X + X006 + 10, P_Y - 12);
  vertex(L_BEGIN_X + X021, P_Y - 12);
  vertex(L_BEGIN_X + X021, ALG_Y);
  vertex(L_BEGIN_X + X121, ALG_Y);
  vertex(L_BEGIN_X + X121, K_Y - AREA_DELTA - W);
  endShape();
}

void drawCars() {
  // BMW
  stroke(0, 64);
  fill(YELLOW, 96);
  beginShape();
  vertex(L_BEGIN_X, N_Y - AREA_DELTA);
  vertex(L_BEGIN_X + X034, N_Y - AREA_DELTA);
  vertex(L_BEGIN_X + X034, N_Y + AREA_DELTA);
  vertex(L_BEGIN_X + X032, N_Y + AREA_DELTA);
  vertex(L_BEGIN_X + X032, P_Y + AREA_DELTA);
  vertex(L_BEGIN_X, P_Y + AREA_DELTA);
  vertex(L_BEGIN_X, N_Y - AREA_DELTA);
  endShape();
  fill(0, 128);
  textAlign(LEFT);
  text("BMW", L_BEGIN_X + W, P_Y + 3 * W + 2);
  textAlign(RIGHT);
  text("BMW", L_BEGIN_X + X034 - W, N_Y + 3 * W + 2);

  // Merc 1
  stroke(0, 64);
  fill(YELLOW, 96);
  beginShape();
  vertex(L_BEGIN_X, K_Y - AREA_DELTA);
  vertex(L_BEGIN_X + X002, K_Y - AREA_DELTA);
  vertex(L_BEGIN_X + X002, S_Y + AREA_DELTA);
  vertex(L_BEGIN_X, S_Y + AREA_DELTA);
  vertex(L_BEGIN_X, K_Y - AREA_DELTA);
  endShape();
  fill(0, 128);
  textAlign(LEFT);
  text("Merc", L_BEGIN_X + W, S_Y + 3 * W + 2);

  // Merc 2
  stroke(0, 64);
  fill(YELLOW, 96);
  beginShape();
  vertex(L_BEGIN_X + X023, IS_Y - AREA_DELTA);
  vertex(L_BEGIN_X + X041, IS_Y - AREA_DELTA);  
  vertex(L_BEGIN_X + X041, IS_Y + AREA_DELTA - 2 * W);
  vertex(L_BEGIN_X + X050, IS_Y + AREA_DELTA - 2 * W);
  vertex(L_BEGIN_X + X050, IS_Y - AREA_DELTA);
  vertex(L_BEGIN_X + X052, IS_Y - AREA_DELTA);
  vertex(L_BEGIN_X + X052, IS_Y + AREA_DELTA);  
  vertex(L_BEGIN_X + X023, IS_Y + AREA_DELTA);
  vertex(L_BEGIN_X + X023, IS_Y - AREA_DELTA);
  endShape();
  fill(0, 128);
  textAlign(LEFT);
  text("Merc", L_BEGIN_X + X023 + W, IS_Y + 3 * W + 2);
  textAlign(RIGHT);
  text("Merc", L_BEGIN_X + X052 - W, IS_Y + 3 * W + 2);

  // Merc 3
  stroke(0, 64);
  fill(YELLOW, 96);
  beginShape();
  vertex(L_BEGIN_X + X044, P_Y - AREA_DELTA);
  vertex(L_BEGIN_X + X052, P_Y - AREA_DELTA);
  vertex(L_BEGIN_X + X052, K_Y + AREA_DELTA);
  vertex(L_BEGIN_X + X044, K_Y + AREA_DELTA);
  vertex(L_BEGIN_X + X044, P_Y - AREA_DELTA);
  endShape();
  fill(0, 128);
  textAlign(LEFT);
  text("Merc", L_BEGIN_X + X044 + W, K_Y + 3 * W + 2);
  textAlign(RIGHT);
  text("Merc", L_BEGIN_X + X052 - W, K_Y + 3 * W + 2);

  // IAudi 1
  stroke(0, 64);
  fill(I_YELLOW, 64);
  beginShape();
  vertex(L_BEGIN_X + X010, K_Y - AREA_DELTA);
  vertex(L_BEGIN_X + X032, K_Y - AREA_DELTA);
  vertex(L_BEGIN_X + X032, P_Y - AREA_DELTA);
  vertex(L_BEGIN_X + X042, P_Y - AREA_DELTA);
  vertex(L_BEGIN_X + X042, K_Y + AREA_DELTA);
  vertex(L_BEGIN_X + X010, K_Y + AREA_DELTA);
  vertex(L_BEGIN_X + X010, K_Y - AREA_DELTA);
  endShape();
  fill(0, 128);
  textAlign(LEFT);
  text("IAudi", L_BEGIN_X + X010 + W, K_Y + 3 * W + 2);
  textAlign(RIGHT);
  text("IAudi", L_BEGIN_X + X042 - W, K_Y + 3 * W + 2);

  // IAudi 2
  stroke(0, 64);
  fill(I_YELLOW, 64);
  beginShape();
  vertex(L_BEGIN_X + X010, IS_Y - AREA_DELTA);
  vertex(L_BEGIN_X + X023, IS_Y - AREA_DELTA);
  vertex(L_BEGIN_X + X023, IS_Y + AREA_DELTA);
  vertex(L_BEGIN_X + X014, IS_Y + AREA_DELTA);
  vertex(L_BEGIN_X + X014, IS_Y - AREA_DELTA + 2 * W);
  vertex(L_BEGIN_X + X012, IS_Y - AREA_DELTA + 2 * W);
  vertex(L_BEGIN_X + X012, IS_Y + AREA_DELTA);
  vertex(L_BEGIN_X + X010, IS_Y + AREA_DELTA);
  vertex(L_BEGIN_X + X010, IS_Y - AREA_DELTA);
  endShape();
  fill(0, 128);
  textAlign(LEFT);
  text("IAudi", L_BEGIN_X + X010 + W, IS_Y + 3 * W + 2);
  textAlign(RIGHT);
  text("IAudi", L_BEGIN_X + X023 - W, IS_Y + 3 * W + 2);

  // Saab
  stroke(0, 64);
  fill(YELLOW, 96);
  beginShape();
  vertex(L_BEGIN_X + X123, K_Y - AREA_DELTA - W);
  vertex(L_BEGIN_X + X130, K_Y - AREA_DELTA - W);
  vertex(L_BEGIN_X + X130, K_Y - AREA_DELTA + W + 4);
  vertex(L_BEGIN_X + X123, K_Y - AREA_DELTA + W + 4);
  vertex(L_BEGIN_X + X123, K_Y - AREA_DELTA - W);
  endShape();
  fill(0, 128);
  textAlign(RIGHT);
  text("Saab", L_BEGIN_X + X130 - W - 4, K_Y - AREA_DELTA + W + 2);

  // ISaab
  stroke(0, 64);
  fill(I_YELLOW, 64);
  beginShape();
  vertex(L_BEGIN_X + X005, IP_Y - AREA_DELTA);
  vertex(L_BEGIN_X + X040, IP_Y - AREA_DELTA);
  vertex(L_BEGIN_X + X040, IP_Y + 2 * W);
  vertex(L_BEGIN_X + X045, IP_Y + 2 * W);
  vertex(L_BEGIN_X + X045, IP_Y - AREA_DELTA);
  vertex(L_BEGIN_X + X110, IP_Y - AREA_DELTA);
  vertex(L_BEGIN_X + X110, IP_Y + 2 * W);
  vertex(L_BEGIN_X + X130, IP_Y + 2 * W);
  vertex(L_BEGIN_X + X130, IP_Y + AREA_DELTA + W);
  vertex(L_BEGIN_X + X005, IP_Y + AREA_DELTA + W);
  vertex(L_BEGIN_X + X005, IP_Y - AREA_DELTA);
  endShape();
  fill(0, 128);
  textAlign(LEFT);
  text("ISaab", L_BEGIN_X + X005 + W, IP_Y + 4 * W + 2);
  textAlign(RIGHT);
  text("ISaab", L_BEGIN_X + X040 - W, IP_Y - 2 * W + 2);
  textAlign(LEFT);
  text("ISaab", L_BEGIN_X + X045 + W, IP_Y - 2 * W + 2);
  textAlign(RIGHT);
  text("ISaab", L_BEGIN_X + X130 - W - 4, IP_Y + 4 * W + 2);
}

void drawCargoContainer() {
  stroke(0, 64);
  fill(0, 8);
  beginShape();
  vertex(L_BEGIN_X, IK_Y - AREA_DELTA);
  vertex(L_BEGIN_X + X105, IK_Y - AREA_DELTA);
  vertex(L_BEGIN_X + X105, IN_Y + AREA_DELTA);
  vertex(L_BEGIN_X, IN_Y + AREA_DELTA);
  vertex(L_BEGIN_X, IK_Y - AREA_DELTA);
  endShape();
  fill(0, 128);
  textAlign(LEFT);
  text("cargo container", L_BEGIN_X + W, IN_Y + 3 * W + 2);
  textAlign(RIGHT);
  text("cargo container", L_BEGIN_X + X105 - W - 4, IN_Y + 3 * W + 2);
}
