package utils;

import org.junit.Test;

import static org.junit.Assert.*;

public class MessageFormattedTest {
    @Test
    public void test01() {
        final Message m = new MessageFormatted("Hello");
        assertEquals("Hello", m.get());
    }

    @Test
    public void test02() {
        final Message m = new MessageFormatted("Hello %d", 1);
        assertEquals("Hello 1", m.get());
    }

    @Test
    public void test03() {
        final Message m = new MessageFormatted("Hello %s", "World");
        assertEquals("Hello World", m.get());
    }

    @Test
    public void test04() {
        final Message m = new MessageFormatted("%s : %s", "Hello", "World");
        assertEquals("Hello : World", m.get());
    }

    @Test
    public void test05() {
        final Message m = new MessageFormatted("%s : %s", "Hello", "World");
        assertEquals("Hello : World", m.toString());
    }
}