package com.mains.bin;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name="mycart")
public class Cart {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	
	 private int id;
	    private String title;
	    private String author;
	    private double price;
	    @ManyToOne
	    private UserB user; // Associate cart with a user
	    @ManyToOne
	    @JoinColumn(name = "book_id")
	    private Book book;
		
		
	    
	    
	    
	    public Cart(int id, String title, String author, double price, UserB user,Book book) {
			super();
			this.id = id;
			this.title = title;
			this.author = author;
			this.price = price;
			this.user = user;
			this.book=book;
		}
		public Cart(int id, String title, String author, double price) {
			super();
			this.id = id;
			this.title = title;
			this.author = author;
			this.price = price;
		}
		public Cart() {
			super();
			// TODO Auto-generated constructor stub
		}
		public int getId() {
			return id;
		}
		public void setId(int id) {
			this.id = id;
		}
		public String getTitle() {
			return title;
		}
		public void setTitle(String title) {
			this.title = title;
		}
		public String getAuthor() {
			return author;
		}
		public void setAuthor(String author) {
			this.author = author;
		}
		public double getPrice() {
			return price;
		}
		public void setPrice(double price) {
			this.price = price;
		}
		
		public UserB getUser() {
			return user;
		}
		public void setUser(UserB user) {
			this.user = user;
		}
		
		public Book getBook() {
			return book;
		}
		public void setBook(Book book) {
			this.book = book;
		}
		@Override
		public String toString() {
			return "Cart [id=" + id + ", title=" + title + ", author=" + author + ", price=" + price + ", user=" + user
					+ ", book=" + book + "]";
		}
		
		
	    

}
