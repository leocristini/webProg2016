/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package db_classes;

import info.debatty.java.stringsimilarity.LongestCommonSubsequence;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Logger;

/**
 *
 * @author gianma
 */
public class DBManager implements Serializable {
    
    private transient Connection con;
    
    public DBManager(String dburl, String dbuser, String dbpassword) throws SQLException{
        try{
            Class.forName("org.postgresql.Driver", true, getClass().getClassLoader());
        } catch(Exception e){
            throw new RuntimeException(e.toString(), e);
        }
        
        Connection con = DriverManager.getConnection(dburl, dbuser, dbpassword);
        this.con = con;
    }
    
    public static void shutdown(){
        try{
            DriverManager.getConnection("jdbc:postgresql:;shutdown=true");
        } catch (SQLException ex){
            Logger.getLogger(DBManager.class.getName()).info(ex.getMessage());
        }
    }
    
    /**
    *Autentica un utente in base ad un nome utente e una password
    * @param username il nome utente
    * @param password la password
    * @return null se l'utente non è autenticato, un oggetto User se l'utente esiste ed è autenticato
    * @throws java.sql.SQLException
    */
    
    public User authenticate(String username, String password) throws SQLException{
        
        PreparedStatement stm = con.prepareStatement("SELECT * FROM Users WHERE username = ? AND password = ?");
        
        try{
            stm.setString(1, username);
            stm.setString(2, password);
            
            ResultSet rs = stm.executeQuery();
            
            try{
                if (rs.next()){
                    User user = new User();
                    user.setUsername(username);
                    user.setFirstname(rs.getString("firstname"));
                    user.setLastname(rs.getString("lastname"));
                    user.setUsertype(rs.getString("user_type"));
                    
                    return user;
                    
                }else{
                    return null;
                }
            } finally{
                //Ricordarsi SEMPRE di chiudere i ResultSet in un blocco finally
                rs.close();
            }
        } finally{
            //Ricordarsi SEMPRE di chiudere i PreparedStatement in un blocco finally
            stm.close();
        }
    }
    
    public String [] getRestaurantNames() throws SQLException{
        
        ArrayList <String> names = new ArrayList<String>();
        
        String query = "SELECT name FROM restaurants";
        PreparedStatement ps = con.prepareStatement(query);
        
        ResultSet rs = ps.executeQuery();
        while(rs.next()){
            names.add(rs.getString("name"));
        }
        
        String [] results = new String[names.size()];
        for (int i = 0; i < names.size(); i++){
            results[i] = names.get(i);
        }
        
        return results;
    }
    
    public ArrayList <Restaurant> getRestaurantByName(String search) throws SQLException{
        
        ArrayList <Restaurant> results = new ArrayList<Restaurant>();
        
        LongestCommonSubsequence lcs = new LongestCommonSubsequence();
        
        String query = "SELECT * FROM restaurants";
        PreparedStatement ps = con.prepareStatement(query);
        
        ResultSet rs = ps.executeQuery();
        Restaurant tmp = new Restaurant();
        
        try{
            while(rs.next()){
                int distanza = (int)(lcs.distance(search, rs.getString("name"))/2);
                if (distanza <= 2){
                    tmp.setId(rs.getInt("id"));
                    tmp.setName(rs.getString("name"));
                    tmp.setDescription(rs.getString("description"));
                    tmp.setWebSiteUrl(rs.getString("web_site_url"));
                    
                    query = "SELECT c.name " + "FROM (restaurant_cuisine AS rc INNER JOIN restaurants AS r ON rc.id_restaurant = r.id)" + "INNER JOIN cuisines AS c ON rc.id_cuisine = c.id WHERE r.name = ?";
                    PreparedStatement pst = con.prepareStatement(query);
                    pst.setString(1, tmp.getName());
                    ResultSet rst = pst.executeQuery();
                    if(rst.next()){
                        tmp.setCousineType(rst.getString(1));
                    }
                    
                    rst.close();
                    pst.close();
                    
                    results.add(tmp);
                }
            }
        }finally{
            rs.close();
            ps.close();
        }
        return results;
    }
    
    
    public boolean register(String firstname, String lastname, String username, String password) throws SQLException{
        
        
        int next_id = 0;
        String query1 = "SELECT MAX(id) FROM Users";
        PreparedStatement ps1 = con.prepareStatement(query1);
        ResultSet rs1 = ps1.executeQuery();
        while(rs1.next()){
            next_id = rs1.getInt(1) + 1;
        }
        
        String query = "INSERT INTO Users VALUES (?,?,?,?,?,?)";
        PreparedStatement ps = con.prepareStatement(query);
        ps.setInt(1, next_id);
        ps.setString(2, firstname);
        ps.setString(3, lastname);
        ps.setString(4, username);
        ps.setString(5, "U");
        ps.setString(6, password);
        
        try{
            ps.executeUpdate();
        }finally{
            ps.close();
        }
        return true;
    }
    
    public User existingUser(String username) throws SQLException{
        
        String query = "SELECT * FROM Users WHERE username = ?";
        PreparedStatement ps = con.prepareStatement(query);
        ps.setString(1, username);
        
        ResultSet rs = ps.executeQuery();
        
        try {
            if (rs.next()){
                User user = new User();
                user.setFirstname(rs.getString("firstname"));
                user.setLastname(rs.getString("lastname"));
                return user;
            }
        }finally{
            rs.close();
            ps.close();
        }
        
        return null;
        
        
    }
    
    public boolean badPassword(String pw1, String pw2){
        
        if(!pw1.equals(pw2)){
            return true;
        }
        
        return false;  
    }
}
