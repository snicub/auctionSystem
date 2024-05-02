package com.cs336.pkg;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ApplicationDB {
   public int createAccount(Users u) {
      int status = 0;

      try {
         Connection con = this.getConnection();
         PreparedStatement ps = con.prepareStatement("INSERT INTO Users(userName, email, password, address, birthday)VALUES (?, ?, ?, ?, ?)");
         ps.setString(1, u.getuserName());
         ps.setString(2, u.getEmail());
         ps.setString(3, u.getPassword());
         ps.setString(4, u.getAddress());
         ps.setString(5, u.getBirthday());
         status = ps.executeUpdate();
         con.close();
      } catch (Exception var5) {
         System.out.println(var5);
      }

      return status;
   }

   public Connection getConnection() {
      String connectionUrl = "jdbc:mysql://localhost:3306/CSBay?autoReconnect=true&useSSL=false";
      Connection connection = null;

      try {
         Class.forName("com.mysql.jdbc.Driver").newInstance();
      } catch (InstantiationException var5) {
         var5.printStackTrace();
      } catch (IllegalAccessException var6) {
         var6.printStackTrace();
      } catch (ClassNotFoundException var7) {
         var7.printStackTrace();
      }

      try {
         connection = DriverManager.getConnection(connectionUrl, "root", "rootpassword");
      } catch (SQLException var4) {
         var4.printStackTrace();
      }

      return connection;
   }

   public void closeConnection(Connection connection) {
      try {
         connection.close();
      } catch (SQLException var3) {
         var3.printStackTrace();
      }

   }

   public static void main(String[] args) {
      ApplicationDB dao = new ApplicationDB();
      Connection connection = dao.getConnection();
      System.out.println(connection);
      dao.closeConnection(connection);
   }
}
