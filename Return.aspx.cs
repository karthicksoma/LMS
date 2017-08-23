using System;
using System.Linq;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Configuration;

public partial class Return : Page
{
    //Connection to sql 
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["LMS"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (conn.State == ConnectionState.Closed)
            {
                conn.Open();
            }

            // sql query to get the list of users for book selection drop down
            SqlCommand cmdbook = new SqlCommand("select id, name from books order by name;", conn);
            drpbook.DataSource = cmdbook.ExecuteReader();
            drpbook.DataTextField = "name";
            drpbook.DataValueField = "id";
            drpbook.DataBind();
            cmdbook.Dispose();
            conn.Close();


            // sql query to get the list of users for user selection drop down
            conn.Open();
            SqlCommand cmd = new SqlCommand("select id, fname+' '+lname as username from users order by fname,lname;", conn);
            drpuser.DataSource = cmd.ExecuteReader();
            drpuser.DataTextField = "username";
            drpuser.DataValueField = "id";
            drpuser.DataBind();
        }
        catch (SqlException ex)
        {
            throw ex;
        }
        finally
        {
            conn.Close();
        }
    }

    // check user log
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        try
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("select books.name as \"Book Name\",books.author as Author,rent.Issuedate as \"Borrow Date\",rent.actualreturndate as \"Actual return date\" from books,users,rent where rent.bookid = books.id and rent.userid = users.id and books.id = @bid and users.id = @uid and rent.returneddate is null", conn);
            cmd.Parameters.AddWithValue("@bid", drpbook.SelectedValue);
            cmd.Parameters.AddWithValue("@uid", drpuser.SelectedValue);
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();

            adp.Fill(ds);
            GridViewbooklist.DataSource = ds;
            GridViewbooklist.DataBind();

            lbltotalbooks.Text = "No fo books need to return: " + GridViewbooklist.Rows.Count.ToString();
            if (GridViewbooklist.Rows.Count > 0)
            {
                btnreturn.Visible = true;
            }
            
        }
        catch (SqlException ex)
        {
            throw ex;
        }
        finally
        {
            conn.Close();
        }
    }

    protected void btnReturn_Click(object sender, EventArgs e)
    {
        try
        {
            conn.Open();

            SqlCommand cmd_max = new SqlCommand("select max(id) from rent;", conn);
            int id = Convert.ToInt32(cmd_max.ExecuteScalar().ToString());

            // Query to insert the data
            SqlCommand cmd = new SqlCommand("Update rent set returneddate=@date where userid = @uid and bookid = @bid", conn);
            cmd.Parameters.AddWithValue("@uid", Convert.ToInt32(drpuser.SelectedValue));
            cmd.Parameters.AddWithValue("@bid", Convert.ToInt32(drpbook.SelectedValue));

            DateTime date= DateTime.Now;
            cmd.Parameters.AddWithValue("@date", date.ToShortDateString());
            cmd.ExecuteNonQuery();

            // update the book quantity 
            cmd = new SqlCommand("Update books set quantity = quantity+1 where id = @bid", conn);
            cmd.Parameters.AddWithValue("@bid", Convert.ToInt32(drpuser.SelectedValue));
            cmd.ExecuteNonQuery();

            Response.Redirect("~/");

        }
        catch (SqlException ex)
        {
            throw ex;
        }
        finally
        {
            conn.Close();
        }
    }

}