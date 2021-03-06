package wordcram;

import java.util.Arrays;

class WordSorterAndScaler {

    public Word[] sortAndScale(Word[] rawWords) {
    	if (rawWords.length == 0) {
    		return rawWords;
    	}

        Word[] words = copy(rawWords);
        Arrays.sort(words);
        float maxWeight = words[0].weight;

        for (Word word : words) {
            word.weight = word.weight / maxWeight;
        }

        return words;
    }

    private Word[] copy(Word[] rawWords) {

        // was Arrays.copyOf(rawWords, rawWords.length); - removed for Java 1.5 compatibility.

        Word[] copy = new Word[rawWords.length];
        System.arraycopy(rawWords, 0, copy, 0, copy.length);
        return copy;
    }
}
