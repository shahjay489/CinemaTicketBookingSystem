/**
 * 
 */
package common;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * @author Tich
 *
 */
public class Ticket {
	/*----------- Fields ----------- */
	private int id;
	private User user;
	private Showtime showtime;
	private int seat_row;
	private int seat_col;
	private String seatCode;
	/**
	 * @return the id
	 */
	public int getId() {
		return id;
	}
	/**
	 * @param id the id to set
	 */
	public void setId(int id) {
		this.id = id;
	}
	/**
	 * @return the user
	 */
	public User getUser() {
		return user;
	}
	/**
	 * @param user the user to set
	 */
	public void setUser(User user) {
		this.user = user;
	}
	/**
	 * @return the showtime
	 */
	public Showtime getShowtime() {
		return showtime;
	}
	/**
	 * @param showtime the showtime to set
	 */
	public void setShowtime(Showtime showtime) {
		this.showtime = showtime;
	}
	/**
	 * @return the seat_row
	 */
	public int getSeat_row() {
		return seat_row;
	}
	/**
	 * @param seat_row the seat_row to set
	 */
	public void setSeat_row(int seat_row) {
		this.seat_row = seat_row;
	}
	/**
	 * @return the seat_col
	 */
	public int getSeat_col() {
		return seat_col;
	}
	/**
	 * @param seat_col the seat_col to set
	 */
	public void setSeat_col(int seat_col) {
		this.seat_col = seat_col;
	}
	
	/**
	 * @return the seatCode
	 */
	public String getSeatCode() {
		return seatCode;
	}
	/**
	 * @param seatCode the seatCode to set
	 */
	public void setSeatCode(String seatCode) {
		this.seatCode = seatCode;
	}
	/*----------- Constructors ----------- */
	/**
	 * 
	 */
	public Ticket() {
	}
	
	/**
	 * @param user
	 * @param showtime
	 */
	public Ticket(User user, Showtime showtime, String seatCode) {
		this.user = user;
		this.showtime = showtime;
		this.seatCode = seatCode;
	}
	/**
	 * @param id
	 * @param user
	 * @param showtime
	 * @param seat_row
	 * @param seat_col
	 */
	public Ticket(int id, User user, Showtime showtime, int seat_row, int seat_col) {
		this.id = id;
		this.user = user;
		this.showtime = showtime;
		this.seat_row = seat_row;
		this.seat_col = seat_col;
	}
	/*----------- Methods ----------- */
	
	public static Ticket insert(Connection connection, Ticket ticket) throws SQLException {
		String query = "INSERT INTO tickets (user_id, showtime_id) VALUES (?, ?)";
		PreparedStatement statement = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
		statement.setInt(1, ticket.getUser().getId());
		statement.setInt(2, ticket.getShowtime().getId());
//		statement.executeUpdate();
		int affectedRows = statement.executeUpdate();
        if (affectedRows == 0) {
            throw new SQLException("Creating ticket failed, no rows affected.");
        }
        try (ResultSet generatedKeys = statement.getGeneratedKeys()) {
            if (generatedKeys.next()) {
            	ticket.setId(generatedKeys.getInt(1));
                System.out.println("Ticket inserted successfully. Ticket ID: " + ticket.getId());
            }
            else {
                throw new SQLException("Creating ticket failed, no ID obtained.");
            }
        }
		return ticket;
	}
}