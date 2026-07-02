package com.tap.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.tap.connection.DBConnection;
import com.tap.dao.MenuDAO;
import com.tap.model.Menu;


public class MenuDAOImpl implements MenuDAO {

    private static final String GET_ALL_BY_RES = "SELECT * FROM `menu` WHERE `restaurantId` = ?";
    private static final String GET_MENU = "SELECT * FROM `menu` WHERE `menuId` = ?";

    @Override
    public List<Menu> getAllMenusByRestaurant(int restaurantId) {
        List<Menu> menuList = new ArrayList<>();

        try (Connection con = DBConnection.getConnection();
             PreparedStatement statement = con.prepareStatement(GET_ALL_BY_RES)) {

            statement.setInt(1, restaurantId);
            ResultSet res = statement.executeQuery();

            while (res.next()) {
                Menu menu = new Menu();
                menu.setMenuId(res.getInt("menuId"));
                // Note: If you have restaurantId in your Menu model, uncomment below:
                 menu.setRestaurantId(res.getInt("restaurantId"));
                menu.setItemName(res.getString("itemName"));
                menu.setDescription(res.getString("description"));
                menu.setPrice(res.getInt("price"));
                menu.setRating(res.getDouble("rating"));
                menu.setImageUrl(res.getString("imageUrl"));
                
                menuList.add(menu);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return menuList;
    }

    @Override
    public Menu getMenu(int menuId) {
        Menu menu = null;

        try (Connection con = DBConnection.getConnection();
             PreparedStatement statement = con.prepareStatement(GET_MENU)) {

            statement.setInt(1, menuId);
            ResultSet res = statement.executeQuery();

            if (res.next()) {
                menu = new Menu();
                menu.setMenuId(res.getInt("menuId"));
                menu.setItemName(res.getString("itemName"));
                menu.setDescription(res.getString("description"));
                menu.setPrice(res.getInt("price"));
                menu.setRating(res.getDouble("rating"));
                menu.setImageUrl(res.getString("imageUrl"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return menu;
    }
}