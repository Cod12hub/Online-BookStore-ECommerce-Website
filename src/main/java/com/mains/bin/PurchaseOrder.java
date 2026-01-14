package com.mains.bin;

import java.util.Date;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;

@Entity
public class PurchaseOrder {
	@Id
	    @GeneratedValue(strategy = GenerationType.IDENTITY)
	    private Long id;

	    @ManyToOne
	    private UserB user;

	    @ManyToOne
	    @JoinColumn(name = "book_id", nullable = false) // Maps to the foreign key for Book
	    private Book book;

	    @Column(nullable = false)
	    private Double price;

	    @Temporal(TemporalType.TIMESTAMP)
	    @Column(name = "order_date", nullable = false, updatable = false)
	    private Date orderDate = new Date(); // Default to current date

		public PurchaseOrder() {
			super();
			// TODO Auto-generated constructor stub
		}

		public PurchaseOrder(Long id, UserB user, Book book, Double price, Date orderDate) {
			super();
			this.id = id;
			this.user = user;
			this.book = book;
			this.price = price;
			this.orderDate = orderDate;
		}

		public Long getId() {
			return id;
		}

		public void setId(Long id) {
			this.id = id;
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

		public Double getPrice() {
			return price;
		}

		public void setPrice(Double price) {
			this.price = price;
		}

		public Date getOrderDate() {
			return orderDate;
		}

		public void setOrderDate(Date orderDate) {
			this.orderDate = orderDate;
		}

		@Override
		public String toString() {
			return "Order [id=" + id + ", user=" + user + ", book=" + book + ", price=" + price + ", orderDate="
					+ orderDate + "]";
		}
	    


}
