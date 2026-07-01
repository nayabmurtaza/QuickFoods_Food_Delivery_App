package com.tap.dao;

import java.util.List;
import com.tap.model.Menu;

public interface MenuDAO {
    List<Menu> getAllMenusByRestaurant(int restaurantId);
    Menu getMenu(int menuId);
}