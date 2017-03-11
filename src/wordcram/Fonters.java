package wordcram;

import java.util.Random;

import processing.core.PFont;

public class Fonters {

    public static WordFonter alwaysUse(final PFont pfont) {
        return (Word word) -> pfont;
    }

    public static WordFonter pickFrom(final PFont... fonts) {
        final Random r = new Random();
        return (Word w) -> fonts[r.nextInt(fonts.length)];
    }
}
