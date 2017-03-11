package wordcram.text;

public class Text implements TextSource {

    private final String text;

    public Text(String _text) {
        text = _text;
    }

    @Override
    public String getText() {
        return text;
    }
}
