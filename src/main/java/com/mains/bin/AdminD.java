package com.mains.bin;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity

public class AdminD {
	
	 @Id
	    @GeneratedValue(strategy = GenerationType.IDENTITY)
	    private Long id;
	    private String username;
	    private String email;
	    private String password;
	    private String imageName;
		public AdminD() {
			super();
			// TODO Auto-generated constructor stub
		}
		public AdminD(Long id, String username, String email, String password, String imageName) {
			super();
			this.id = id;
			this.username = username;
			this.email = email;
			this.password = password;
			this.imageName = imageName;
		}
		public Long getId() {
			return id;
		}
		public void setId(Long id) {
			this.id = id;
		}
		public String getUsername() {
			return username;
		}
		public void setUsername(String username) {
			this.username = username;
		}
		public String getEmail() {
			return email;
		}
		public void setEmail(String email) {
			this.email = email;
		}
		public String getPassword() {
			return password;
		}
		public void setPassword(String password) {
			this.password = password;
		}
		public String getImageName() {
			return imageName;
		}
		public void setImageName(String imageName) {
			this.imageName = imageName;
		}
		@Override
		public String toString() {
			return "AdminD [id=" + id + ", username=" + username + ", email=" + email + ", password=" + password
					+ ", imageName=" + imageName + "]";
		}
	    


}
