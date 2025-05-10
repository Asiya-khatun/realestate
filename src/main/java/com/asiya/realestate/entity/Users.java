package com.asiya.realestate.entity;

import java.io.Serializable;

import org.springframework.web.multipart.MultipartFile;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;
import jakarta.persistence.Transient;
import jakarta.persistence.Version;
import jakarta.validation.constraints.Digits;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;

@Entity
@Table(name = "User_Table")
public class Users implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "user_id")
    private int id;

    @NotBlank(message = "The name field should not be empty")
    @Size(min = 2, max = 20, message = "The name field should contain 2 to 20 characters")
    @Column(name = "name")
    private String name;

    @NotNull(message = "The email should not be empty")
    @Email(regexp = "[a-z0-9._%+-]+@[a-z0-9.-]+\\.[a-z]{2,3}", message = "Enter a valid email address")
    @Column(name = "email", unique = true)
    private String email;

    @NotNull(message = "Citizenship number should not be null")
    @Digits(integer = 12, fraction = 0, message = "Citizenship number must be valid")
    @Column(name = "citizenship_no", unique = true)
    private Long citi_no;

    @NotNull(message = "The address should not be null")
    @Pattern(regexp = "^[a-zA-Z0-9]{5,15}$",
             message = "Address should contain only letters and numbers, and be 5 to 15 characters long")
    @Column(name = "address")
    private String address;

    @NotNull(message = "Age field should not be empty")
    @Digits(integer = 2, fraction = 0, message = "Age should be valid")
    @Column(name = "age")
    private int age;

    @NotNull(message = "Username should not be null and unique")
    @Size(min = 5, max = 20, message = "The username should be between 5 and 20 characters long")
    @Column(name = "username", unique = true)
    private String username;

    
    private String imageName;
    @Transient
    private MultipartFile imagefile;
    
    

    @NotNull(message = "The password field should not be empty")
    @Pattern(regexp = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[@#$%^&*!]).{8,}$",
             message = "Password must have at least one uppercase letter, one lowercase letter, one digit, one special character, and be at least 8 characters long")
    @Column(name = "password")
    private String password;

    @Column(name = "enable")
    private String enable;

    @Transient
    private String authority;

    @OneToOne(mappedBy = "user", cascade = CascadeType.ALL, fetch = FetchType.EAGER,orphanRemoval = true)
    private UserRole userRole;

    @Transient
    private String token; // Add a transient field for the token

//    @Version
//    private Long version;
    // Default constructor
    public Users() {
        super();
    }

    // Parameterized constructor
    public Users(int id, String name, String email, Long citi_no, String address, int age, String username,
                MultipartFile imagefile, String imageName, String password, String enable, String authority,
                UserRole userRole, String token) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.citi_no = citi_no;
        this.address = address;
        this.age = age;
        this.username = username;
        this.imagefile = imagefile;
        this.imageName = imageName;
        this.password = password;
        this.enable = enable;
        this.authority = authority;
        this.userRole = userRole;
        this.token = token;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Long getCiti_no() {
        return citi_no;
    }

    public void setCiti_no(Long citi_no) {
        this.citi_no = citi_no;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public MultipartFile getImagefile() {
        return imagefile;
    }

    public void setImagefile(MultipartFile imagefile) {
        this.imagefile = imagefile;
    }

    public String getImageName() {
        return imageName;
    }

    public void setImageName(String imageName) {
        this.imageName = imageName;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEnable() {
        return enable;
    }

    public void setEnable(String enable) {
        this.enable = enable;
    }

    public String getAuthority() {
        return authority;
    }

    public void setAuthority(String authority) {
        this.authority = authority;
    }

    public UserRole getUserRole() {
        return userRole;
    }

    public void setUserRole(UserRole userRole) {
        this.userRole = userRole;
    }

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }
}
