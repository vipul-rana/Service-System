package pp;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedHashMap;
import java.util.Map;

public class UserDao 
{
	public Connection con;
	public PreparedStatement ps;
	public Connection getCon() throws ClassNotFoundException, SQLException
	{
		Class.forName("com.mysql.jdbc.Driver");
		return DriverManager.getConnection("jdbc:mysql://localhost:3306/mvc","root","root");
	}
	public int addUser(User u) throws SQLException, ClassNotFoundException
	{
		con=getCon();
		String qr="insert into users values(?,?,?)";
		ps=con.prepareStatement(qr);
		ps.setString(1, u.getName());
		ps.setString(2, u.getId());
		ps.setString(3, u.getPassword());
		return ps.executeUpdate();
	}
	public int search(String id, String password) throws ClassNotFoundException, SQLException
	{
		con=getCon();
		String qr="select * from users where id='"+id+"'and password='"+password+"'";
		Statement st=con.createStatement();
		ResultSet rs=st.executeQuery(qr);
		int i=0; 
		while(rs.next())
			i++;
		return i;
	}
	public int search1(String id) throws ClassNotFoundException, SQLException
	{
		con=getCon();
		String qr="select * from users where id='"+id+"'";
		Statement st=con.createStatement();
		ResultSet rs=st.executeQuery(qr);
		int i=0; 
		while(rs.next())
			i++;
		return i;
	}
	public int updateName(String name, String id) throws SQLException, ClassNotFoundException
	{
		con=getCon();
		String qr="update users set name='"+name+"' where id='"+id+"'";
		ps=con.prepareStatement(qr);
		return ps.executeUpdate();
	}
	public int updatePassword(String password, String id) throws SQLException, ClassNotFoundException
	{
		con=getCon();
		String qr="update users set password='"+password+"' where id='"+id+"'";
		ps=con.prepareStatement(qr);
		return ps.executeUpdate();
	}
	
	public Map<Worker, Appointment> showBookings(String email) throws ClassNotFoundException, SQLException
	{
		con=getCon();
		String qr="select appno, workerid, name, contact, bookingdate, timeslot, charges, status, workstatus from appointment, workers where workerid=workers.id and userid='"+email+"'";
		Statement st=con.createStatement();
		ResultSet rs=st.executeQuery(qr);
		LinkedHashMap<Worker, Appointment> hm=new LinkedHashMap<Worker, Appointment>();
		while(rs.next())
		{
			Appointment a =new Appointment();
			Worker w=new Worker();
			a.setAppno(rs.getInt("appno"));
			a.setWid(rs.getInt("workerid"));
			w.setName(rs.getString("name"));
			w.setContact(rs.getInt("contact"));
			a.setDate(rs.getString("bookingdate"));
			a.setTime(rs.getString("timeslot"));
			w.setCharges(rs.getInt("charges"));
			a.setStatus(rs.getString("status"));
			a.setWorkstatus(rs.getString("workstatus"));
			//a.setWid(rs.getInt("workers.id"));
			hm.put(w, a);
		}
		return hm;
	}
}
