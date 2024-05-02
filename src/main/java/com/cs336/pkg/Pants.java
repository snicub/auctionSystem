package com.cs336.pkg;

public class Pants {
   private int itemID;
   private int pantWaist;
   private double bidPrice;
   private String pantType;
   private String pantGender;
   private String color;

   public int getItemID() {
      return this.itemID;
   }

   public void setItemID(int itemID) {
      this.itemID = itemID;
   }

   public int getPantWaist() {
      return this.pantWaist;
   }

   public void setPantWaist(int pantWaist) {
      this.pantWaist = pantWaist;
   }

   public double getBidPrice() {
      return this.bidPrice;
   }

   public void setBidPrice(double bidPrice) {
      this.bidPrice = bidPrice;
   }

   public String getPantType() {
      return this.pantType;
   }

   public void setPantType(String pantType) {
      this.pantType = pantType;
   }

   public String getPantGender() {
      return this.pantGender;
   }

   public void setPantGender(String pantGender) {
      this.pantGender = pantGender;
   }

   public String getColor() {
      return this.color;
   }

   public void setColor(String color) {
      this.color = color;
   }
}
