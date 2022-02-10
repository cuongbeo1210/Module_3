package dao;

import context.DBContext;
import model.category;
import model.product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DAO {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<product> getAllProduct() {
        List<product> list = new ArrayList<>();
        String query = "SELECT * FROM casestudy3v1.product";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new product((rs.getInt(1)), rs.getInt(2),
                        rs.getString(3), rs.getInt(4), rs.getInt(5),
                        rs.getString(6), rs.getString(7), rs.getString(8),
                        rs.getString(9), rs.getInt(10)));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<category> getAllCategory() {
        List<category> list = new ArrayList<>();
        String query = "SELECT * FROM casestudy3v1.category";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new category((rs.getInt(1)), rs.getString(2)));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<product> getAllProductByCategory(String categoryID) {
        List<product> list = new ArrayList<>();
        String query = "SELECT * FROM casestudy3v1.product where category_id = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1,categoryID);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new product((rs.getInt(1)), rs.getInt(2),
                        rs.getString(3), rs.getInt(4), rs.getInt(5),
                        rs.getString(6), rs.getString(7), rs.getString(8),
                        rs.getString(9), rs.getInt(10)));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public product getProductByID(String id) {
        String query = "SELECT * FROM casestudy3v1.product where id = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1,id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return(new product((rs.getInt(1)), rs.getInt(2),
                        rs.getString(3), rs.getInt(4), rs.getInt(5),
                        rs.getString(6), rs.getString(7), rs.getString(8),
                        rs.getString(9), rs.getInt(10)));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

//    public static void main(String[] args) {
//        DAO dao = new DAO();
//        List<category> list = dao.getAllCategory();
//        for (category category : list) {
//            System.out.println(category);
//        }
//    }
}

