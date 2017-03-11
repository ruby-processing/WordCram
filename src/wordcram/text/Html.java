package wordcram.text;

public class Html implements TextSource {

    private final String src;

    public Html(String htmlSrc) {
        src = htmlSrc;
    }

    @Override
    public String getText() {
        return new Html2Text().text(src, null);
    }
}
