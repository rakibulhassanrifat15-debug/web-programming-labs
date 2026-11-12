package org.example.lab5;

/**
 * Represents a book in the library.
 * Stores the author, title, and reading status.
 */
public class Book {

    private final String author;
    private final String title;
    private final boolean read;

    /**
     * Creates a book with the specified information.
     *
     * @param author the author of the book
     * @param title the title of the book
     * @param read whether the book has been read
     */
    public Book(String author, String title, boolean read) {
        this.author = author;
        this.title = title;
        this.read = read;
    }

    /**
     * Returns the author of the book.
     *
     * @return the author's name
     */
    public String getAuthor() {
        return author;
    }

    /**
     * Returns the book title.
     *
     * @return the title
     */
    public String getTitle() {
        return title;
    }

    /**
     * Returns the reading status.
     *
     * @return true if the book has been read
     */
    public boolean isRead() {
        return read;
    }
}
