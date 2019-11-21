package com.shop.model;

import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

public class Cart {

  private HashMap<Long, Item> cartItems;

  public Cart() {
    cartItems = new HashMap<>();
  }

  public Cart(HashMap<Long, Item> cartItems) {
    this.cartItems = cartItems;
  }

  public HashMap<Long, Item> getCartItems() {
    return cartItems;
  }

  public void setCartItems(HashMap<Long, Item> cartItems) {
    this.cartItems = cartItems;
  }

  public void plusToCart(Long key, Item item) {
    cartItems.put(key, item);
  }

  public void subToCart(Long key, Item item) {
      int quantity_old = item.getQuantity();
      if (quantity_old < 1) {
        cartItems.remove(key);
      } else {
        cartItems.put(key, item);
      }
  }

  public void removeToCart(Long product) {
    boolean bln = cartItems.containsKey(product);
    if (bln) {
      cartItems.remove(product);
    }
  }

  public int countItem() {
    int count = 0;
    for (Map.Entry<Long, Item> list : cartItems.entrySet()) {
      count += list.getValue().getQuantity();
    }
    return count;
  }

  public List<Item> getItems() {
    if (cartItems.isEmpty()) return new LinkedList<Item>();
    return new LinkedList<Item>(cartItems.values());
  }
  
  public double totalCart() {
    double count = 0;
    for (Map.Entry<Long, Item> list : cartItems.entrySet()) {
      count += list.getValue().getProduct().getPrice() * list.getValue().getQuantity();
    }
    return count;

  }
}
