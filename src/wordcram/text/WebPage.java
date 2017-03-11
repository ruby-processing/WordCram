package wordcram.text;

import processing.core.PApplet;

public class WebPage implements TextSource {

    private final String url;
    private final String cssSelector;
    private final PApplet parent;

    public WebPage(String url, String cssSelector, PApplet parent) {
        this.url = url;
        this.cssSelector = cssSelector;
        this.parent = parent;
    }

    @Override
    public String getText() {
        String html = PApplet.join(parent.loadStrings(url), ' ');
        return new Html2Text().text(html, cssSelector);
    }

}
