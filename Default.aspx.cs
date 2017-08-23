using System;
using System.Linq;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Configuration;

public partial class _Default : Page
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
            SqlCommand cmd = new SqlCommand("select count(id) from books where books.id = @bid and quantity > 0", conn);
            cmd.Parameters.AddWithValue("@bid", drpbook.SelectedValue);

            int val = Convert.ToInt32(cmd.ExecuteScalar().ToString());
            lbltotalbooks.Text = "Availaility : " + val;
            if (val > 0)
            {
                btnissue.Visible = true;
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

    protected void btnIssue_Click(object sender, EventArgs e)
    {
        try
        {
            conn.Open();

            SqlCommand cmd_max = new SqlCommand("select max(id) from rent;", conn);
            int id = Convert.ToInt32(cmd_max.ExecuteScalar().ToString());
            
            // Query to insert the data
            SqlCommand cmd = new SqlCommand("Insert into rent (id,userid,bookid,issuedate,actualreturndate) values(@id, @userid, @bookid, @today, @actualreturn)", conn);

            cmd.Parameters.AddWithValue("@id", id + 1);
            cmd.Parameters.AddWithValue("@userid", Convert.ToInt32(drpuser.SelectedValue));
            cmd.Parameters.AddWithValue("@bookid", Convert.ToInt32(drpbook.SelectedValue));
            DateTime today = DateTime.Now;
            DateTime actualreturn = today.AddDays(30);
            cmd.Parameters.AddWithValue("@today", today);
            cmd.Parameters.AddWithValue("@actualreturn", actualreturn);
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