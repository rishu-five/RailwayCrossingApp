package favorite;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AddToFavorite")
public class AddToFavorite extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String itemId = request.getParameter("itemId");

        // Check if the item is already in favorites
        boolean isAlreadyInFavorites = checkIfAlreadyInFavorites(itemId);

        if (isAlreadyInFavorites) {
            response.sendRedirect("AlreadyInFavorites.jsp");
        } else {
            // Perform necessary operations to add the item to favorites
            try {
                // Establish database connection
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/railway", "root",
                        "Rishu@170955");

                // Prepare SQL statement to insert the favorite crossing
                String sql = "INSERT INTO favorites (id, Name, Address, Landmark, Trainschedule, pname, status) "
                        + "SELECT id, Name, Address, Landmark, Trainschedule, pname, status " + "FROM adminhome WHERE id = ?";
                PreparedStatement statement = connection.prepareStatement(sql);
                statement.setString(1, itemId);

                // Execute the SQL statement
                int rowsAffected = statement.executeUpdate();
                System.out.println("Rows affected: " + rowsAffected);

                // Close the database connection
                statement.close();
                connection.close();

                // Redirect the user back to the user home page
                response.sendRedirect("userhome.jsp");
            } catch (ClassNotFoundException | SQLException e) {
                e.printStackTrace();
            }
        }
    }

    // Method to check if item is already in favorites
    private boolean checkIfAlreadyInFavorites(String itemId) {
        boolean isInFavorites = false;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/railway", "root",
                    "Rishu@170955");

            String sql = "SELECT id FROM favorites WHERE id = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, itemId);

            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                isInFavorites = true;
            }

            resultSet.close();
            statement.close();
            connection.close();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return isInFavorites;
    }
}
