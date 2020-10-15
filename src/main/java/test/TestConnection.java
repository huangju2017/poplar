package test;

import java.sql.Connection;
import java.sql.SQLException;

import org.junit.jupiter.api.Test;

import com.zr.poplar.util.TxDBUtils;

public class TestConnection {

	@Test
	public void testConnection() throws SQLException {

		Connection connection = TxDBUtils.getSource().getConnection();
		System.out.println(connection);
		TxDBUtils.release();

	}

}
