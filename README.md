
# Game of Life Projects

Various attempts at building Conway's Game of Life in Processing, all of which failed.

**Interesting results:**
1) *Agario* slowly spreads and eats up everything in its path
2) *Cityscape* works by clicking, but creates a little "city" that looks kind of cool after a few clicks.

The "conwaysGameOfLife" folder has a working model, based off of these rules:
 > 1. Any live cell with fewer than two live neighbors dies, as if caused by under population. 
 > 2. Any live cell with two or three live neighbors lives on to the next generation. 
 > 3. Any live cell with more than three live neighbors dies, as if by overpopulation. 
 > 4. Any dead cell with exactly three live neighbors becomes a live cell, as if by reproduction.

*- Wikipedia*

Feel free to mess with this in any way. Try changing

```
fill(0, 0, 0);
```

To

```
fill(random(255), random(255), random(255));
```

Also, the spawning method spawns squares at the start by random, beginning with a 10% chance. It's done like this:

```
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
```

For more spawns, change it to a lower number from 0-1 in "if (z > 0.9)", and for less spawns, make the tariff higher (up to 0.99 or you'll have almost no spawns!).

