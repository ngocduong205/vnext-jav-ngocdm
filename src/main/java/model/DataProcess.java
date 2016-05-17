
package model;

import java.sql.DriverManager;
import java.sql.SQLException;

import com.sun.accessibility.internal.resources.accessibility;

import java.sql.*;
import entity.Account;

import java.sql.Connection;


/**
 * @author Administrator
 *
 */
public class DataProcess {
	
	public static void connection(){
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	public static Connection connectionToMySQL(){
		Connection connect = null;
		connection();
		String host = "jdbc:mysql://localhost/demologin";
		String username = "root";
		String password = "ngocke12";
	
		try {
			connect = DriverManager.getConnection(host,username,password);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return connect;
	}
	// check connect SQL
	public static void main(String[] args) {
		
//		if (connectionToMySQL() != null) {
//			System.out.println("ok");
//		} else {
//			System.out.println("error");
//		}
	}
		
	public static boolean checkLogin(Account acc){
		Connection con = connectionToMySQL();
		boolean status = false;
		try {
			PreparedStatement ps = con.prepareStatement("select * from accounts where _Username =? and _Password =?");
			ps.setString(1, acc.getUsername());
			ps.setString(2, acc.getPassword());
			ResultSet rs = ps.executeQuery();
			status = rs.next();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return status;
	}
}
