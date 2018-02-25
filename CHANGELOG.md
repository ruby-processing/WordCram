**v2.0.3**
JRubyArt-1.4.6 and processing-3.3.6

**v2.0.2**
JRubyArt-1.4.2 and processing-3.3.5

**v2.0.1**
JRubyArt-1.3.3 and processing-3.3.4

**v2.0.0**
We now compile our own version of WordCram, which for this release is essentially the the same code as Dan Bernier (and Jonathan Feinberg cue.language), except we have dropped java-1.5 compatibility in favour of updating to JDK8. So where possible instead of using an anonymous class expression, we now use a lambda expression, and other jdk goodness. Future releases might actually include some jruby java code to compile. Update to use jsoup-1.10.2.jar

**v1.0.2** Bump for processing and jsoup updates add travis

**v1.0.1** Supports Placers, specifically ShapeBasedPlacer, and Observer (hence callbacks)

**v1.0.0** First release depends on WordCram-1.0 to supply jars
