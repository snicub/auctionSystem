package com.cs336.pkg;

public class Users {
   private int id;
   private String userName;
   private String password;
   private String email;
   private String birthday;
   private String address;

   public int getId() {
      return this.id;
   }

   public void setId(int id) {
      this.id = id;
   }

   public String getuserName() {
      return this.userName;
   }

   public void setuserName(String userName) {
      this.userName = userName;
   }

   public String getPassword() {
      return this.password;
   }

   public void setPassword(String password) {
      this.password = password;
   }

   public String getEmail() {
      return this.email;
   }

   public void setEmail(String email) {
      this.email = email;
   }

   public String getAddress() {
      return this.address;
   }

   public void setAddress(String address) {
      this.address = address;
   }

   public String getBirthday() {
      return this.birthday;
   }

   public void setBirthday(String birthday) {
      this.birthday = birthday;
   }
}
