package com.cs336.pkg;

public class Auction {
   private int id;
   private String startDate;
   private String endDate;
   private String isAvailable;
   private double initialBidPrice;
   private double incrementBidPrice;
   private double minBid;
   private double currentBidPrice;

   public int getId() {
      return this.id;
   }

   public void setId(int id) {
      this.id = id;
   }

   public String getStartDate() {
      return this.startDate;
   }

   public void setStartDate(String startDate) {
      this.startDate = startDate;
   }

   public String getEndDate() {
      return this.endDate;
   }

   public void setEndDate(String endDate) {
      this.endDate = endDate;
   }

   public String getIsAvailable() {
      return this.isAvailable;
   }

   public void setIsAvailable(String isAvailable) {
      this.isAvailable = isAvailable;
   }

   public double getInitialBidPrice() {
      return this.initialBidPrice;
   }

   public void setInitialBidPrice(double initialBidPrice) {
      this.initialBidPrice = initialBidPrice;
   }

   public double getIncrementBidPrice() {
      return this.incrementBidPrice;
   }

   public void setIncrementBidPrice(double incrementBidPrice) {
      this.incrementBidPrice = incrementBidPrice;
   }

   public double getMinBid() {
      return this.minBid;
   }

   public void setMinBid(double minBid) {
      this.minBid = minBid;
   }

   public double getCurrentBidPrice() {
      return this.currentBidPrice;
   }

   public void setCurrentBidPrice(double currentBidPrice) {
      this.currentBidPrice = currentBidPrice;
   }
}
