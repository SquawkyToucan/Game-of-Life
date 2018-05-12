// 100 x 100 array
boolean[][] cells = new boolean[901][901];
boolean[][] newCells =new boolean[901][901];
// Code to be executed at start
void setup() { 
  size(900, 900, P2D);
  //background(43, 31, 35);
  randomizeCells();
  noStroke();
}

void draw() {
  // Executed once every second or something
  for (int x = 0; x < 901; x++) {
    for (int y = 0; y < 901; y++) {
      newCells[x][y] = cells[x][y];
    }
  }
  for (int x = 0; x < 901; x++) {
    for (int y = 0; y < 901; y++) {
      if (cells[x][y]) {
        fill(255, 255, 255);
        //fill(random(255), random(255), random(255));
      } else {
        fill(0, 0, 0);
      }
      rect(x, y, 1, 1);
      newCells[x][y] = isAliveAfterChange(getAmountOfNeighbors(x, y), cells[x][y]);
    }
  }
  for (int x = 0; x < 901; x++) {
    for (int y = 0; y < 901; y++) {
      cells[x][y] = newCells[x][y];
    }
  }
}

public void randomizeCells() {
  for (int x = 0; x < 900; x++) {
    for (int y = 0; y < 900; y++) {
      float z = random(1);
      if (z > 0.9) {
        cells[x][y] = true;
      } else {
        cells[x][y] = false;
      }
    }
  }
}

public int getAmountOfNeighbors(int x, int y) {
  int neighbors = 0;
  // Check to make sure it isn't on the edges
  if (x == 0 || x == 900 || y == 0 || y == 900) {
    // It is on the edge, first check the irregularities (double corners) then the normal ones
  } else {
    // It is in the middle, so it can be treated like a normal square
    int amountSurrounding = 0;
    if (check(x-1, y-1)) {
      amountSurrounding++;
    }
    if (check(x, y-1)) {
      amountSurrounding++;
    }
    if (check(x + 1, y - 1)) {
      amountSurrounding++;
    }
    if (check(x - 1, y)) {
      amountSurrounding++;
    }
    if (check(x - 1, y + 1)) {
      amountSurrounding++;
    }
    if (check(x, y+1)) {
      amountSurrounding++;
    }
    if (check(x+1, y+1)) {
      amountSurrounding++;
    }
    if (check(x+1, y)) {
      amountSurrounding++;
    }
    neighbors = amountSurrounding;
  }
  return neighbors;
}

public boolean check(int param1, int param2) {
  boolean returnThis = false;
  boolean isSafe = false;
  if (!(param1 < 0) && !(param1 > 900) && !(param2 < 0) && !(param2 > 900)) {
    isSafe = true;
  }
  if (isSafe) {
    returnThis = cells[param1][param2];
  }
  return returnThis;
}
public boolean isAliveAfterChange(int neighbors, boolean isAliveNow) {
  if (isAliveNow) {
    // It's alive
    if (neighbors == 2 || neighbors == 3) {
      return true;
    } else {
      // It's either 0, 1, or 4+
      return false;
    }
  } else {
    // It's dead
    if (neighbors == 3) {
      return true;
    } else {
      return false;
    }
  }
}
