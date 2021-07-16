package pp;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class Wdao 
{
	public Connection con;
	public PreparedStatement ps;
	public int x=100;
	public Connection getCon() throws ClassNotFoundException, SQLException
	{
		Class.forName("com.mysql.jdbc.Driver");
		return DriverManager.getConnection("jdbc:mysql://localhost:3306/mvc","root","root");
	}
	public int addWorker(Worker w) throws SQLException, ClassNotFoundException
	{
		con=getCon();
		String qr="insert into workers(name, contact, email, category, location, address, services, charges)values(?,?,?,?,?,?,?,?)";
		ps=con.prepareStatement(qr);
		//ps.setInt(1, id);
		ps.setString(1, w.getName());
		ps.setInt(2, w.getContact());
		ps.setString(3, w.getEmail());
		ps.setString(4, w.getCategory());
		ps.setString(5, w.getLocation());
		ps.setString(6, w.getAddress());
		ps.setString(7, w.getServices());
		ps.setInt(8, w.getCharges());
		return ps.executeUpdate();
	}
	public List<Worker> search(String category, String location) throws ClassNotFoundException, SQLException
	{
		con=getCon();
		String qr="select * from workers where category like '"+category+"%' or location like'"+location+"%'";
		Statement st=con.createStatement();
		ResultSet rs=st.executeQuery(qr);
		ArrayList<Worker> al=new ArrayList<Worker>();
		while(rs.next())
		{
			Worker w=new Worker();
			w.setId(rs.getInt("id"));
			w.setName(rs.getString("name"));
			w.setContact(rs.getInt("contact"));
			w.setEmail(rs.getString("email"));
			w.setCategory(rs.getString("category"));
			w.setLocation(rs.getString("location"));
			w.setAddress(rs.getString("address"));
			w.setServices(rs.getString("services"));
			w.setCharges(rs.getInt("charges"));
			al.add(w);
		}
		return al;
	}
	public List<Worker> search1(int id) throws ClassNotFoundException, SQLException
	{
		con=getCon();
		String qr="select * from workers where id="+id;
		Statement st=con.createStatement();
		ResultSet rs=st.executeQuery(qr);
		ArrayList<Worker> al=new ArrayList<Worker>();
		while(rs.next())
		{
			Worker w=new Worker();
			w.setId(rs.getInt("id"));
			w.setName(rs.getString("name"));
			w.setContact(rs.getInt("contact"));
			w.setEmail(rs.getString("email"));
			w.setCategory(rs.getString("category"));
			w.setLocation(rs.getString("location"));
			w.setAddress(rs.getString("address"));
			w.setServices(rs.getString("services"));
			w.setCharges(rs.getInt("charges"));
			al.add(w);
		}
		return al;
	}
	
	public List<Worker> profile(String email) throws ClassNotFoundException, SQLException
	{
		con=getCon();
		String qr="select * from workers where email='"+email+"'";
		Statement st=con.createStatement();
		ResultSet rs=st.executeQuery(qr);
		ArrayList<Worker> al=new ArrayList<Worker>();
		while(rs.next())
		{
			Worker w=new Worker();
			w.setId(rs.getInt("id"));
			w.setName(rs.getString("name"));
			w.setContact(rs.getInt("contact"));
			w.setEmail(rs.getString("email"));
			w.setCategory(rs.getString("category"));
			w.setLocation(rs.getString("location"));
			w.setAddress(rs.getString("address"));
			w.setServices(rs.getString("services"));
			w.setCharges(rs.getInt("charges"));
			al.add(w);
		}
		return al;
	}
	
	public List<User> uprofile(String id) throws ClassNotFoundException, SQLException
	{
		con=getCon();
		String qr="select * from users where id='"+id+"'";
		Statement st=con.createStatement();
		ResultSet rs=st.executeQuery(qr);
		ArrayList<User> al=new ArrayList<User>();
		while(rs.next())
		{
			User u=new User();
			u.setName(rs.getString("name"));
			u.setId(rs.getString("id"));
			al.add(u);
		}
		return al;
	}
	
	public int updateWorker(Worker w) throws SQLException, ClassNotFoundException
	{
		con=getCon();
		String qr="update workers set name=?, contact=?, category=?, location=?, address=?, services=?, charges=? where id=?";
		ps=con.prepareStatement(qr);
		ps.setString(1, w.getName());
		ps.setInt(2, w.getContact());
		ps.setString(3, w.getCategory());
		ps.setString(4, w.getLocation());
		ps.setString(5, w.getAddress());
		ps.setString(6, w.getServices());
		ps.setInt(7, w.getCharges());
		ps.setInt(8, w.getId());
		return ps.executeUpdate();
	}
}
