float t = 0.0;

float L = 10000.0;
float l = 0.5;
float c = 10.0;

float[][] z = {
  {350.0,400.0},
  {450.0,400.0},
};

int len = z.length;

float fure = 128.0/len;

boolean poi = true;

void setup() {
  size(800, 800);

  noStroke();
}

void draw() {
  for (int i = 0; i < 160; i++) {
    for (int j = 0; j < 160; j++) {
      float a = 0.0;

      for (int k = 0; k < len; k++) {
        float d = dist(z[k][0], z[k][1], 0.0, 2.5+5.0*i, 2.5+5.0*j, L);

        a += fure * sin(TWO_PI*(c*t-d)/l);
      }

      fill(128.0+a);
      square(5.0*i, 5.0*j, 10.0);
    }
  }

  if (poi) {
    fill(#CE3E3E);

    for (int k = 0; k<len; k++) {
      circle(z[k][0], z[k][1], 5);
    }
  }

  t += 1.0/1000.0;
}
