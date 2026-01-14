package com.mains.controller;

import java.io.File;
import java.io.IOException;
import java.net.MalformedURLException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.mains.bin.AdminD;
import com.mains.bin.Book;
import com.mains.bin.Cart;
import com.mains.bin.PurchaseOrder;
import com.mains.bin.UserB;
import com.mains.repositry.AdminRepositry;
import com.mains.repositry.AdminTwoRepository;
import com.mains.repositry.MyBookRepository;
import com.mains.repositry.OrderRepository;
import com.mains.repositry.UserRepositry;
import com.mains.repositry.UserbRepository;

import jakarta.servlet.http.HttpSession;
import jakarta.ws.rs.core.MediaType;







@Controller
public class handaler {
	@Autowired
	private UserRepositry repo;
	@Autowired
	private MyBookRepository  cartRepository; 
	@Autowired
	 private AdminRepositry adrepo;
    private static final String UPLOAD_DIR = "C:\\Users\\Asus\\Documents\\workspace-spring-tool-suite-4-4.20.1.RELEASE\\BookStoreManagementSystem\\src\\main\\webapp\\img";
    
    @Autowired
    private UserbRepository userb;
    @Autowired
    private OrderRepository orderRepository;
    
    @Autowired
    private AdminTwoRepository adminRepository;




	/*@RequestMapping("/")
	public String dis()
	{
		return "home";
	}*/
	
	
	@RequestMapping("/")
	public String disho(Model model, HttpSession session)
	{
		 List<Book> li = repo.findAll();
		 //li.forEach(book -> System.out.println(book.getCategory())); // Debugging category

		    model.addAttribute("e_data",li);  
		    System.out.println(li);
		UserB user = (UserB) session.getAttribute("user");  // Get user from session

        if (user != null) {
            model.addAttribute("user", user);  // Pass the user object to the view
        } else {
            model.addAttribute("error", "You must be logged in.");
        }

       
		return "home3";
	}
	
	
	
	
	    // User Registration
	    @PostMapping("/registerUser")
	    public String registerUser(UserB user, Model model) {
	        // Check if the user already exists
	        if (userb.findByEmail(user.getEmail()) != null) {
	            model.addAttribute("error", "User with this email already exists.");
	            return "UserRegister";  // Return to registration page
	        } 
	        // Save the user in the database
	        userb.save(user);
	        model.addAttribute("message", "User registered successfully.");
	        return "UserLogin";  // Redirect to login page
	    }

	    // User Login
	    @PostMapping("/loginUser")
	    public String loginUser(@RequestParam String email, @RequestParam String password,HttpSession session, Model model,RedirectAttributes redirectAttributes) {
	        UserB user = userb.findByEmail(email);

	        if (user != null && user.getPassword().equals(password)) {
	            session.setAttribute("user", user);  // Store the user in the session

	            redirectAttributes.addFlashAttribute("message", "Login successful!");
	            return "redirect:/";  // Redirect to home page
	        } else {
	        	 redirectAttributes.addFlashAttribute("error", "Invalid email or password.");
	            return "redirect:/login";  // Return to login page
	        }
	    }
	    
	    //User Logout
	    @GetMapping("/userlogout")
	    public String logout(HttpSession session, Model model,RedirectAttributes redirectAttributes) {
	        session.invalidate();  // Invalidate the session
	        redirectAttributes.addFlashAttribute("message", "You have been logged out successfully.");
	        return "redirect:/";  // Redirect to login page
	    }
	    
	    
	   //Edit Profile User
	        @GetMapping("/editprouser")
	        public String editProfile(Model model, @SessionAttribute("user") UserB user) {
	            model.addAttribute("user", user);
	            return "editProfileuser"; 
	        }

	      
	        // Handle the form submission to update the profile
	        @PostMapping("/editproupdate")
	        public String updateProfile(@ModelAttribute UserB user, 
	                                    RedirectAttributes redirectAttributes, 
	                                    HttpSession session) {
	            // Directly updating the user in the repository
	            Optional<UserB> existingUser = userb.findById(user.getId());
	            if (existingUser.isPresent()) {
	                userb.save(user); // Save the updated user data to the database
	            } else {
	                redirectAttributes.addFlashAttribute("errorMessage", "User not found.");
	                return "redirect:/editprouser"; // Redirect to edit profile page
	            }

	            session.setAttribute("user", user); // Update session with new user details
	            redirectAttributes.addFlashAttribute("successMessage", "Profile updated successfully!");
	            return "redirect:/"; // Redirect to the edit profile page
	        }
	    
	    
	    
	   
	    // Show login page
	    @GetMapping("/login")
	    public String loginPage() {
	        return "UserLogin";
	    }

	    // Show registration page
	    @GetMapping("/register")
	    public String registerPage(Model model) {
	        model.addAttribute("user", new UserB());

	        return "UserRegister";
	    }
	



	//Book Registration Form
	@RequestMapping("/regis")
	public String display()
	{
		return "registration";
	}
	
	//Save Book
	@PostMapping("/success")
	public String data(@ModelAttribute Book bok,@RequestParam("imageFile") MultipartFile file, Model model) {
        if (!file.isEmpty()) {
            try {
                // Save file to the specified directory
                String fileName = file.getOriginalFilename();
                File uploadFile = new File(UPLOAD_DIR + fileName);
                file.transferTo(uploadFile);
                bok.setImageFileName(fileName);

            } catch (IOException e) {
                e.printStackTrace();
                model.addAttribute("message", "File upload failed: " + e.getMessage());
                return "error";
            }
        } else {
            bok.setImageFileName("default.jpg"); 
        }
        repo.save(bok);

        model.addAttribute("message", "Book added successfully!");
        return "home"; 

	}
	
	//View all Books
	@RequestMapping("/view")
	public String getData(Model m) {
	    List<Book> li = repo.findAll();
	    
	    m.addAttribute("e_data",li);  
	    System.out.println(li);
	    return "view_book";
	}
	
	
	@GetMapping("/images/{imageFileName}")
	public ResponseEntity<Resource> serveImage(@PathVariable String imageFileName) {
	    try {
	        Path path = Paths.get("C:/Users/Asus/Pictures").resolve(imageFileName);
	        Resource resource = new FileSystemResource(path); // Use FileSystemResource for local files

	        if (resource.exists() || resource.isReadable()) {
	            return ResponseEntity.ok()
	                    .body(resource);
	        } else {
	            return ResponseEntity.notFound().build();
	        }
	    } catch (Exception e) {
	        return ResponseEntity.internalServerError().build();
	    }
	}

	//Delete Book
	@RequestMapping("/{id}")
	public String dlt_book(@PathVariable Integer id)
	{
		repo.deleteById(id);
		
		return "redirect:/admin";
		
	}
	
	//Edit Book
	
	 @GetMapping("/edit/{id}")
		public String editData( @PathVariable Integer id, Model m)
		{
			Book bok= repo.findById(id).orElse(null);
			m.addAttribute("book",bok); 
			return "update";
		}
	 
	 
	 //Update Book
	 
	 @PostMapping("/update/{id}")
	 public String updateData(@PathVariable Integer id,@ModelAttribute Book updatedemp,@RequestParam("imageFile") MultipartFile file) throws IOException {

	 
		 Book bok= repo.findById(id).orElse(null);
		 if(bok!=null)
		 {   
			 bok.setId(updatedemp.getId());
			 bok.setTitle(updatedemp.getTitle());
			 bok.setAuthor(updatedemp.getAuthor());
			 bok.setPrice(updatedemp.getPrice());
			 bok.setCategory(updatedemp.getCategory());
			  // Check if the file is not empty (i.e., a file is uploaded)
		        if (!file.isEmpty()) {
		            try {
		                // Define the directory to save the uploaded file
		                String UPLOAD_DIR = "C:\\Users\\Asus\\Documents\\workspace-spring-tool-suite-4-4.20.1.RELEASE\\BookStoreManagementSystem\\src\\main\\webapp\\img";
		                
		                String fileName = file.getOriginalFilename();
		                
		                File uploadFile = new File(UPLOAD_DIR + fileName);
		                
		                file.transferTo(uploadFile);
		                
		                bok.setImageFileName(fileName);
		                
		            } catch (IOException e) {
		                e.printStackTrace();
		                return "error";
		            }
		        } else {
		          
		        }
		        
		        repo.save(bok);

		    } else {
		        return "error"; 
		    }
		    
		 return "redirect:/admin";
	 }
	 

	 //Cart Section Only Valid User can login
	 @RequestMapping("/cart")
	 public String getMyBooks(HttpSession session,Model model) {
		    UserB user = (UserB) session.getAttribute("user");
		    if (user == null) {
		        return "redirect:/login"; // Redirect if user not logged in
		    }

		    List<Cart> list =cartRepository.findByUser(user);
		    model.addAttribute("cartItems", list);

		    System.out.print(list);
		    return "cart";
		}
	 

	//Cart Section
	 @RequestMapping("/my_cart/{id}")
		public String getMyList(@PathVariable("id") int id, HttpSession session) {
		    UserB user = (UserB) session.getAttribute("user");
		    if (user == null) {
		    
		        return "redirect:/login"; // Redirect if user not logged in
		    }

			Book b=repo.getById(id);
			Cart mb = new Cart();
		    mb.setTitle(b.getTitle());
		    mb.setAuthor(b.getAuthor());
		    mb.setPrice(b.getPrice());
		    mb.setBook(b);	    
		    mb.setUser(user); // Associate cart item with the logged-in user

			cartRepository.save(mb);
			return "redirect:/cart";
		}
	 
	 
	 //Delete Cart Item
	 @GetMapping("/deletecart/{id}")
	 
		public String deleteMyList(@PathVariable("id") int id,HttpSession session) {
		 UserB user = (UserB) session.getAttribute("user");

		    if (user == null) {
		        return "redirect:/login"; 
		    }
		    Cart cartItem = cartRepository.findById(id).orElse(null);

		    if (cartItem != null && cartItem.getUser().getId() == user.getId()) {
	            System.out.println("Deleting cart item with ID: " + id);
	            cartRepository.deleteById(id);
	        } else {
	            System.out.println("Cart item not found or user mismatch.");
	        }
			return "redirect:/cart";
		}
	 
	 
	 //Admin delete item by id
	 
	 @RequestMapping("/delete")
		public String deleteRecord(@RequestParam("id")Integer id) {
		 repo.deleteById(id);
			return "redirect:/view";
		}
	 
	 
	
	 
	/*@RequestMapping("/admin")
	public String avi()
	{
		return "/adminview";
	}*/
	
	
	@RequestMapping("/admin2")
	
		public String admin2()
		{
		return"admin_page";
	}
	
	 /*@RequestMapping("/logins")
	    public String admin() {
	        return "adminlogin";
	    }
	
	 @PostMapping("/login/authenticate")
	    public String authenticate(@RequestParam String password) {
	        if ("admin".equals(password)) {
	            return "redirect:/admin";
	        } else {
	            return "redirect:/login";
	        }
	    }*/
	 
	 //Search Book through super Admin panel
	 @GetMapping("/search")
	 public String searchBooks(@RequestParam(name = "id", required = false) Integer id, Model model) {
		    if (id != null) {
		        Book book = repo.findById(id).orElse(null);


		        if (book != null) {
		            model.addAttribute("e_data", Collections.singletonList(book));
		        } else {
		            model.addAttribute("e_data", Collections.emptyList());
		        }
		    } else {
		        model.addAttribute("e_data", Collections.emptyList());
		    }

		    return "admin_page";
		}
	 
	 //User Order checkout
       @RequestMapping("/order")
	    public String orderInfo(Model model,HttpSession session) {
	        UserB user = (UserB) session.getAttribute("user");
	        if (user == null) {
	            return "redirect:/login";  // Redirect to login if not logged in
	        }

		 List<Cart> cartItems = cartRepository.findByUser(user);
		    model.addAttribute("cartItems", cartItems);
		    model.addAttribute("user", user); 
		    return "orderdet";
	    }
	 
	 
	 @RequestMapping( path = "/placeOrder" , method = RequestMethod.POST)
		public String formHandler( @RequestParam("customerName") String e_customerName,
				                   @RequestParam("address") String address,
				                   @RequestParam("phone")  String phone ,
		                          
		                           Model m,HttpSession session) {
		 UserB user = (UserB) session.getAttribute("user");
	        if (user == null) {
	            return "redirect:/login";  // Redirect to login if not logged in
	        }
		 List<Cart> cartItems =  cartRepository.findByUser(user);
		 // Iterate over the cart items and create orders
		    for (Cart cartItem : cartItems) {
		        // Ensure cartItem.getBook() is not null before creating PurchaseOrder
		        if (cartItem.getBook() == null) {
		            System.out.println("Cart item with null book: " + cartItem);
		            continue;  // Skip this cart item if the book is null
		        }

		        // Proceed only if the book is valid
		        Book book = cartItem.getBook();
		        PurchaseOrder order = new PurchaseOrder();
		        order.setUser(user);
		        order.setBook(cartItem.getBook());  // Assuming Cart contains Book info
		        order.setPrice(cartItem.getPrice());
		        order.setOrderDate(new Date());  // Automatically sets the current timestamp

		        // Save the order to the database
		        orderRepository.save(order);
		    }

		    m.addAttribute("cartItems", cartItems);
		    m.addAttribute("user", user);
			m.addAttribute("NAME", e_customerName);
			m.addAttribute("ADDRESS", address);
			m.addAttribute("PHONE", phone);
			
			System.out.println(e_customerName+"\t"+address+"\t"+phone+"\t");
			
			
			return "Recipt";
		}
	 
	 
	 @RequestMapping("/book/{id}")
	 public String getBookDetails(@PathVariable Integer id, HttpSession session, Model model) {
	     Book book = repo.getById(id);
	     model.addAttribute("book", book);
	     return "UserBuyNow"; // Name of the JSP page
	 }

	 
	 @RequestMapping("/buyNow/{id}")
	 public String buyNow(@PathVariable("id") int id, HttpSession session, Model model,RedirectAttributes redirectAttributes) {
	     // Retrieve the logged-in user
	     UserB user = (UserB) session.getAttribute("user");
	     if (user == null) {
             redirectAttributes.addFlashAttribute("error", "Login First.");

	         return "redirect:/login"; // Redirect to login if not logged in
	     }

	  // Fetch the book that the user wants to buy
	     Book book = repo.findById(id).orElse(null);
	     if (book == null) {
	         return "error"; // Return an error if the book is not found
	     }

	     // Create a new order (no cart involved)
	     PurchaseOrder order = new PurchaseOrder();
	     order.setUser(user);
	     order.setBook(book);
	     order.setPrice(book.getPrice());
	     order.setOrderDate(new Date()); // Automatically sets the current timestamp
	     String userName = user.getFirstName() + " " + user.getLastName(); // Assumes the `UserB` class has these methods


	     // Save the order
	     orderRepository.save(order);

	     // Add order details to the model for displaying in the checkout page
	     model.addAttribute("order", order);
	     model.addAttribute("user", user);
	     model.addAttribute("book", book);

	    
	     model.addAttribute("bookName", book.getTitle());  // Fetch book name
	     model.addAttribute("userName", user.getFirstName() + " " + user.getLastName()); 
	     return "redirect:/userOrders"; 
	 }
	 
	 
	 
	 
	 //User Order
	 
	 @RequestMapping("/userOrders")
	 public String showUserOrders(HttpSession session, Model model) {
	     // Retrieve the logged-in user from session
	     UserB user = (UserB) session.getAttribute("user");
	     if (user == null) {
	         return "redirect:/login"; 
	     }

	     // Fetch the orders for the logged-in user
	     List<PurchaseOrder> orders =  orderRepository.findByUser(user);
	     model.addAttribute("orders", orders);

	     return "UserOrder"; 
	 }
	 
	 
	 
	 @GetMapping("/userbuynow/{id}")
	    public String BuyNow(@PathVariable Integer id,HttpSession session,Model model) {
		    UserB user = (UserB) session.getAttribute("user"); // assuming the user object is stored in the session
		    if (user == null) {
		        return "redirect:/login"; // Redirect to the login page if the user is not logged in
		    }

		    // Fetch the book details using the provided bookId (can be passed as a query parameter)
		    Book book =repo.getById(id); // Assuming a service method to fetch book by ID

		    if (book == null) {
		        // Handle the case where the book doesn't exist
		        return "redirect:/h"; // Redirect to the book list page
		    }

		    // Add the user and book details to the model
		    model.addAttribute("user", user);
		    model.addAttribute("book", book);

	        return "CustomerFormBuy";
	    }
	 
	 
	 
	 @PostMapping("/registerAdmin")
	    public String registerAdmin(@ModelAttribute("admin") AdminD adm,
                @RequestParam("profileImage") MultipartFile profileImage,Model model,RedirectAttributes redirectAttributes) {
		 try {
	        // Check if the user already exists
	        if (adminRepository.findByEmail(adm.getEmail()) != null) {
	            model.addAttribute("error", "Admin with this email already exists.");
	            return "AdminRegisterjsp";  // Return to registration page
	        }
	        
	        if (!profileImage.isEmpty()) {
                String UPLOAD_DIR = "C:\\Users\\Asus\\Documents\\workspace-spring-tool-suite-4-4.20.1.RELEASE\\BookStoreManagementSystem\\src\\main\\webapp\\img";

	            // Generate a unique filename for the image
	            String imageName = profileImage.getOriginalFilename();

	            // Define the directory where you want to store the image
	            File uploadDir = new File(UPLOAD_DIR + imageName);

	            // Save the image to the specified directory
	            profileImage.transferTo(uploadDir);

	            // Save the image filename in the AdminD object
	            adm.setImageName(imageName);
	        }

	        // Save the admin in the database
	        adminRepository.save(adm);
	        redirectAttributes.addFlashAttribute("message", "Admin registered successfully.");
	        return "AdLogin";  // Redirect to login page
	    } catch (IOException e) {
	        e.printStackTrace();
	        model.addAttribute("error", "Error processing the image. Please try again.");
	        return "AdminRegisterjsp";  // Return to registration page
	    }
	}

	        
	     
	 
	 
	 // Show login page
	    @GetMapping("/adlogin")
	    public String adloginPage() {
	        return "AdLogin";
	    }

	    // Show registration page
	    @GetMapping("/adregister")
	    public String adregisterPage() {

	        return "AdminRegisterjsp";
	    }
	    
	   
			 
			 
	    /*@PostMapping("/admindashboard")
	    public String dashboard(@RequestParam String email, @RequestParam String password,HttpSession session, Model model) {
	    	 AdminD aduser = adminRepository.findByEmail(email);

		        if (aduser != null && aduser.getPassword().equals(password)) {
		            session.setAttribute("loggedInAdmin", aduser);
		            model.addAttribute("message", "Login successful!");
		            List<Book> books = repo.findAll();
		            List<UserB> customers = userb.findAll();
		            int totalBooks = (int) repo.count();
		            int totalOrders = (int) orderRepository.count();
		            int totalCustomers = (int) userb.count();

		            double totalRevenue = orderRepository.findAll()
                            .stream()
                            .mapToDouble(PurchaseOrder::getPrice)
                            .sum();
		            model.addAttribute("totalRevanue", totalRevenue);
		            model.addAttribute("totalBooks", totalBooks);
		            model.addAttribute("totalOrders", totalOrders);
		            model.addAttribute("totalCustomers", totalCustomers);
		            model.addAttribute("bookList", books);
		            model.addAttribute("customerList", customers);
		            return "AdminDashboard";  // Redirect to home page
		        } else {
		            model.addAttribute("error", "Invalid email or password.");
		            return "AdLogin";  // Return to login page
		        }
		    }*/
	    
	    
	    //Admin Logout
	    
	    @GetMapping("/adlogout")
	    public String adminlogout(HttpSession session,Model model,RedirectAttributes redirectAttributes) {
	        session.invalidate(); // Invalidate the session
	      //  model.addAttribute("message", "You have been logged out successfully.");
	        redirectAttributes.addFlashAttribute("message", "You have been logged out successfully !.");


	        return "redirect:/adlogin"; // Redirect to login page
	    }
	    
	    
	    
	    //Admin dashboard
	    
	    @GetMapping("/admindashboard")
	    public String dashboardPage(HttpSession session, Model model) {
	        AdminD loggedInAdmin = (AdminD) session.getAttribute("loggedInAdmin");
	        if (loggedInAdmin == null) {
	            return "AdLogin"; // Redirect to login page if admin is not logged in.
	        }

	        List<Book> books = repo.findAll();
	        List<UserB> customers = userb.findAll();
	        int totalBooks = (int) repo.count();
	        int totalOrders = (int) orderRepository.count();
	        int totalCustomers = (int) userb.count();

	        double totalRevenue = orderRepository.findAll()
	                .stream()
	                .mapToDouble(PurchaseOrder::getPrice)
	                .sum();

	        model.addAttribute("totalRevanue", totalRevenue);
	        model.addAttribute("totalBooks", totalBooks);
	        model.addAttribute("totalOrders", totalOrders);
	        model.addAttribute("totalCustomers", totalCustomers);
	        model.addAttribute("bookList", books);
	        model.addAttribute("customerList", customers);

	        return "AdminDashboard"; // Return the dashboard view
	    }
	    
	    
	    @PostMapping("/admindashboard")
	    public String dashboard(@RequestParam String email, @RequestParam String password, HttpSession session, Model model) {
	        AdminD aduser = adminRepository.findByEmail(email);

	        if (aduser != null && aduser.getPassword().equals(password)) {
	            session.setAttribute("loggedInAdmin", aduser);
	            return "redirect:/admindashboard"; // Redirect to GET method for the dashboard
	        } else {
	            model.addAttribute("error", "Invalid email or password.");
	            return "AdLogin"; // Return to login page
	        }
	    }

	    
	    
	    //Pagination with purchase details
	    
	    @GetMapping("/showpurchase")
	    public String showPurchase( @RequestParam(defaultValue = "1") int page,Model model) {
	        int pageSize = 10; // Number of records per page

	        List<PurchaseOrder> orders = orderRepository.findAll();
	        int totalPages = (int) Math.ceil((double) orders.size() / pageSize);

	        // Get subset of orders for the current page
	        int start = (page - 1) * pageSize;
	        int end = Math.min(start + pageSize, orders.size());
	        List<PurchaseOrder> order = orders.subList(start, end);


	        model.addAttribute("orders", order);
	        model.addAttribute("currentPage", page);
	        model.addAttribute("totalPages", totalPages);

	        return "PurchaseAll"; // The JSP page to display the orders
	    }
	    
	    //Purchase Invoice
	    
	    @RequestMapping("/viewReceipt")
	    public String viewReceipt(@RequestParam("orderId") Long orderId, Model model) {
	        PurchaseOrder order = orderRepository.findById(orderId).orElse(null);

	        model.addAttribute("order", order);
	        return "PurchaseInvoice";  // A JSP page where you display the receipt details
	    }
	    
	    
	    //Admin purchase report by date
	    
	    @GetMapping("/showreportpurchase")
	    public String showreport(@RequestParam(required = false) String fromDate,
	                             @RequestParam(required = false) String toDate,
	                             @RequestParam(required = false) Integer userId,
	                             Model model) throws ParseException {

	        List<PurchaseOrder> orders = orderRepository.findAll();

	        if (fromDate != null && toDate != null) {
	            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

	            // Parse the dates from the request
	            Date startDate = dateFormat.parse(fromDate);
	            Date endDate = dateFormat.parse(toDate);

	            // Ensure the end date is inclusive by setting time to the end of the day
	            Calendar calendar = Calendar.getInstance();
	            calendar.setTime(endDate);
	            calendar.set(Calendar.HOUR_OF_DAY, 23);
	            calendar.set(Calendar.MINUTE, 59);
	            calendar.set(Calendar.SECOND, 59);
	            calendar.set(Calendar.MILLISECOND, 999);
	            endDate = calendar.getTime();

	            // Query the repository to find orders within the specified date range
	            orders = orderRepository.findByOrderDateBetween(startDate, endDate);
	        } else if (userId != null) {
	            // If userId is provided, filter orders by user
	            orders = orderRepository.findByUserId(userId);
	        }

	        model.addAttribute("orders", orders);
	        return "PurchaseReportjsp";
	    }
}
	    
	    
	    
	    
	    
	    
	    
	    
	


	 
	 


	 
	
	
	

	