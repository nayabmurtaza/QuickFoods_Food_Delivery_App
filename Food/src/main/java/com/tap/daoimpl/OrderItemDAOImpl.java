package com.tap.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.tap.connection.DBConnection;
import com.tap.dao.OrderItemDAO;
import com.tap.model.Menu;
import com.tap.model.OrderItem;

public class OrderItemDAOImpl implements OrderItemDAO {

    private static final String INSERT_ORDER_ITEM = "INSERT INTO `order_item` (`order_id`, `menu_id`, `quantity`, `total_price`) VALUES (?, ?, ?, ?)";
    private static final String SELECT_ITEM_BY_ID = "SELECT * FROM `order_item` WHERE `order_item_id` = ?";
    private static final String SELECT_ITEMS_BY_ORDER_ID = "SELECT * FROM `order_item` WHERE `order_id` = ?";

    @Override
    public void addOrderItem(OrderItem orderItem) {
        try (Connection con = DBConnection.getConnection();
             PreparedStatement statement = con.prepareStatement(INSERT_ORDER_ITEM)) {

            statement.setInt(1, orderItem.getOrderId());
            statement.setInt(2, orderItem.getMenuId());
            statement.setInt(3, orderItem.getQuantity());
            statement.setDouble(4, orderItem.getItemTotal());

            statement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public OrderItem getOrderItem(int orderItemId) {
        OrderItem orderItem = null;

        try (Connection con = DBConnection.getConnection();
             PreparedStatement statement = con.prepareStatement(SELECT_ITEM_BY_ID)) {

            statement.setInt(1, orderItemId);

            try (ResultSet res = statement.executeQuery()) {
                if (res.next()) {
                    orderItem = extractOrderItemFromResultSet(res);
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return orderItem;
    }

    @Override
    public List<OrderItem> getOrderItemsByOrder(int orderId) {
        List<OrderItem> itemList = new ArrayList<>();

        try (Connection con = DBConnection.getConnection();
             PreparedStatement statement = con.prepareStatement(SELECT_ITEMS_BY_ORDER_ID)) {

            statement.setInt(1, orderId);

            try (ResultSet res = statement.executeQuery()) {
                while (res.next()) {
                    OrderItem orderItem = extractOrderItemFromResultSet(res);
                    itemList.add(orderItem);
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return itemList;
    }

    // Helper mapping utility method
    private OrderItem extractOrderItemFromResultSet(ResultSet res) throws SQLException {
        OrderItem orderItem = new OrderItem();
        orderItem.setOrderItemId(res.getInt("order_item_id"));
        orderItem.setOrderId(res.getInt("order_id"));
        
        int menuId = res.getInt("menu_id");
        orderItem.setMenuId(menuId);
        orderItem.setQuantity(res.getInt("quantity"));
        orderItem.setItemTotal(res.getDouble("total_price"));

        // ARCHITECTURE BONUS: Automatically populate the nested Menu object using MenuDAOImpl
        // This stops your frontend pages from crashing when trying to show item images/names
        MenuDAOImpl menuDAO = new MenuDAOImpl();
        Menu menu = menuDAO.getMenu(menuId);
        orderItem.setMenuItem(menu);

        return orderItem;
    }
}