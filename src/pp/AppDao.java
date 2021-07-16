package pp;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class AppDao 
{
	public Connection con;
	public PreparedStatement ps;
	public Connection getCon() throws ClassNotFoundException, SQLException
	{
		Class.forName("com.mysql.jdbc.Driver");
		return DriverManager.getConnection("jdbc:mysql://localhost:3306/mvc","root","root");
	}
	
	public int addUser(Appointment a) throws SQLException, ClassNotFoundException
	{
		con=getCon();
		String qr="insert into appointment(userid, workerid, bookingdate, timeslot, address, workdesc, status, workstatus)values(?,?,?,?,?,?,?,?)";
		ps=con.prepareStatement(qr);
		ps.setString(1, a.getUid());
		ps.setInt(2, a.getWid());
		ps.setString(3, a.getDate());
		ps.setString(4, a.getTime());
		ps.setString(5, a.getAddress());
		ps.setString(6, a.getWork());
		ps.setString(7, a.getStatus());
		ps.setString(8, a.getWorkstatus());
		return ps.executeUpdate();
	}
	
	public List<Appointment> showRequests(int wid) throws ClassNotFoundException, SQLException
	{
		con=getCon();
		String qr="select * from appointment where workerid="+wid;
		Statement st=con.createStatement();
		ResultSet rs=st.executeQuery(qr);
		ArrayList<Appointment> al=new ArrayList<Appointment>(); 
		while(rs.next())
		{
			Appointment a=new Appointment();
			a.setAppno(rs.getInt("appno"));
			a.setUid(rs.getString("userid"));
			a.setWid(rs.getInt("workerid"));
			a.setDate(rs.getString("bookingdate"));
			a.setTime(rs.getString("timeslot"));
			a.setAddress(rs.getString("address"));
			a.setWork(rs.getString("workdesc"));
			a.setStatus(rs.getString("status"));
			a.setWorkstatus(rs.getString("workstatus"));
			al.add(a);
		}
		return al;
	}
	
	public int update(String status,int appno) throws SQLException, ClassNotFoundException
	{
		con=getCon();
		String qr="update appointment set status='"+status+"' where appno="+appno;
		ps=con.prepareStatement(qr);
		return ps.executeUpdate();
	}
	public int updateWork(String workstatus,int appno) throws SQLException, ClassNotFoundException
	{
		con=getCon();
		String qr="update appointment set workstatus='"+workstatus+"' where appno="+appno;
		ps=con.prepareStatement(qr);
		return ps.executeUpdate();
	}
}
