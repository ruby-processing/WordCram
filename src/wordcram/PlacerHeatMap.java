package wordcram;

import java.awt.Shape; // awt: word->shape->rect
import java.awt.geom.Rectangle2D; // awt: intersects(box), x-y-w-h, bounds
import java.util.ArrayList;
import java.util.HashMap;

import processing.core.PApplet;
import processing.core.PFont;
import processing.core.PVector;

public class PlacerHeatMap {

  private final Word[] words;
  private final WordFonter fonter;
  private final WordSizer sizer;
  private final WordAngler angler;
  private final WordPlacer placer;
  private final WordNudger nudger;
  private final WordShaper shaper;

  PlacerHeatMap(Word[] words, WordFonter fonter, WordSizer sizer, WordAngler angler, WordPlacer placer, WordNudger nudger, WordShaper shaper) {

    this.fonter = fonter;
    this.sizer = sizer;
    this.angler = angler;
    this.placer = placer;
    this.nudger = nudger;
    this.shaper = shaper;
    this.words = words;
  }

  class RectStack {
    ArrayList<Rectangle2D> rects = new ArrayList<>();

    void add(int x, int y, int w, int h) {
      rects.add(new Rectangle2D.Float(x, y, w, h));
    }

    int howManyIntersect(int x, int y, int w, int h) {
      int sum = 0;

      sum = rects.stream().filter((r) -> (r.intersects(x, y, w, h))).map((_item) -> 1).reduce(sum, Integer::sum);

      return sum;
    }
  }

  class RectGrid {
    RectStack stack;
    HashMap<Rectangle2D, Integer> levels = new HashMap<>();

    RectGrid(RectStack stack) {
      this.stack = stack;
    }

    void measure(int x, int y, int w, int h) {
      Rectangle2D plot = new Rectangle2D.Float(x, y, w, h);
      int level = stack.howManyIntersect(x, y, w, h);
      levels.put(plot, level);
    }

    int maxLevel() {
      int maxLevel = 0;
      for (Integer level : levels.values()) {
        if (level > maxLevel) {
          maxLevel = level;
        }
      }
      return maxLevel;
    }

    void draw(PApplet sketch) {
      int rowHeight = 10;
      int colWidth = 10;
      int rows = (int)(sketch.height / (float)rowHeight);
      int cols = (int)(sketch.width / (float)colWidth);

      for (int i = 0; i < rows; i++) {
        int y = i * rowHeight;
        for (int j = 0; j < cols; j++) {
          int x = j * colWidth;

          measure(x, y, colWidth, rowHeight);
        }
      }

      sketch.colorMode(PApplet.HSB);

      int max = maxLevel();
      levels.keySet().forEach((rect) -> {
          Integer level = levels.get(rect);
          
          int c = sketch.color(0);
          if (level > 0) {
              float scaled = (float)level / 8;
              int hue = (int)PApplet.map(scaled, 0, 1, 85, 0);  // 85 = pure green
              c = sketch.color(hue, 255, 255);
          }
          
          sketch.fill(c);
          sketch.rect((float)rect.getX(), (float)rect.getY(), (float)rect.getWidth(), (float)rect.getHeight());
        });
    }
  }

  public void draw(PApplet sketch) {
    RectStack rectStack = new RectStack();

    for (int i = 0; i < words.length; i++) {
      Word word = words[i];
      PFont wordFont = word.getFont(fonter);
      float wordSize = word.getSize(sizer, i, words.length);
      float wordAngle = word.getAngle(angler);

      Shape shape = shaper.getShapeFor(word.word, wordFont, wordSize, wordAngle);
      Rectangle2D rect = shape.getBounds2D();
      //return r.getHeight() < minShapeSize || r.getWidth() < minShapeSize;

      int wordImageWidth = (int)rect.getWidth();
      int wordImageHeight = (int)rect.getHeight();

      PVector desiredLocation = word.getTargetPlace(placer, i, words.length, 
          wordImageWidth, wordImageHeight, sketch.width, sketch.height);

      //sketch.rect(desiredLocation.x, desiredLocation.y, wordImageWidth, wordImageHeight);
      rectStack.add((int)desiredLocation.x, (int)desiredLocation.y, 
          wordImageWidth, wordImageHeight);
    }

    RectGrid grid = new RectGrid(rectStack);
    grid.draw(sketch);
  }
}
