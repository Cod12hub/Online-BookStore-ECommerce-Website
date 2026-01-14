package com.mains.bin;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class Book {
	@Id
    @GeneratedValue(strategy=GenerationType.AUTO)

	  private int id;
	    private String title;
	    private String author;
	    private double price;
	    private String category; 
	    private String imageFileName;
	    
		public Book() {
			super();
			// TODO Auto-generated constructor stub
		}
		public Book(int id, String title, String author, double price, String category, String imageFileName) {
			this.id = id;
			this.title = title;
			this.author = author;
			this.price = price;
			this.category=category;
	        this.imageFileName = imageFileName;

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
		 public String getCategory() {
		        return category;
		    }

		    public void setCategory(String category) {
		        this.category = category;
		    }

		    public String getImageFileName() {
		        return imageFileName;
		    }

		    public void setImageFileName(String imageFileName) {
		        this.imageFileName = imageFileName;
		    }
		@Override
		public String toString() {
			return "Book [id=" + id + ", title=" + title + ", author=" + author + ", price=" + price + ", category=" + category + ", imageFileName=" + imageFileName + "]";
		}
		

}
