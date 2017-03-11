package wordcram;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.HashMap;
import processing.core.PApplet;

// This is a healthy rip-off of
// https://github.com/processing/processing/wiki/Library-Basics#adding-your-own-library-events

class SketchCallbackObserver implements Observer {
	PApplet parent;

	HashMap<String, Method> sketchMethods = new HashMap<>();

	SketchCallbackObserver(PApplet parent) {

		this.parent = parent;

		registerSketchMethod("wordsCounted", Word[].class);
		registerSketchMethod("beginDraw");
		registerSketchMethod("wordDrawn", Word.class);
		registerSketchMethod("wordSkipped", Word.class);
		registerSketchMethod("endDraw");
	}

        @Override
	public void wordsCounted(Word[] words) {
		invoke("wordsCounted", new Object[] { words });
	}
        @Override
	public void beginDraw() {
		invoke("beginDraw", new Object[0]);
	}
        @Override
	public void wordDrawn(Word word) {
		invoke("wordDrawn", new Object[] { word });
	}
        @Override
	public void wordSkipped(Word word) {
		invoke("wordSkipped", new Object[] { word });
	}
        @Override
	public void endDraw() {
		invoke("endDraw", new Object[0]);
	}

	private void registerSketchMethod(String name, Class... parameterTypes) {
		try {
			Method method = parent.getClass().getMethod(name, parameterTypes);
			sketchMethods.put(name, method);
	    }
	    catch (NoSuchMethodException | SecurityException e) {
			// The sketch doesn't have this method name. No worries.
	    }
	}

	private void invoke(String name, Object[] arguments) {
		if (sketchMethods.containsKey(name)) {
			Method method = sketchMethods.get(name);
			try {
				method.invoke(parent, arguments);
			}
			catch (IllegalAccessException | IllegalArgumentException | InvocationTargetException e) {
				System.err.println("Disabling method " + name + " because of an error.");
				sketchMethods.remove(name);
			}
		}
	}
}
