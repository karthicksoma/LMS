using System;
using System.Linq;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Configuration;
using System.Web.UI.WebControls;

public partial class User : Page
{
    //Connection to sql 
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["LMS"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
         BindGridView();
    }

    // We need to reset the fields in the intial load and after the added new user.
    void clear()
    {
        txtfname.Text = string.Empty;
        txtlname.Text = string.Empty;
        txtmobile.Text = string.Empty;
        txtaddress1.Text = string.Empty;
        txtaddress2.Text = string.Empty;
        txtemail.Text = string.Empty;
        txtcity.Text = string.Empty;
        txtpincode.Text = string.Empty;
        txtfname.Focus();
    }

    // get the existing users from users table.
    // show the users details below save/update button.
     private void BindGridView()
    {
        try
        {
            if (conn.State == ConnectionState.Closed)
            {
                conn.Open();
            }
            
            // sql query to get the list of users
            SqlCommand cmd = new SqlCommand("select id as \"User Id\",fname+' '+lname as Name, sex as Gender, dob as \"Date of Birth\",mobile as \"Mobile No\", email as \"Email Id\" from users order by id;", conn);
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            
            adp.Fill(ds);
            GridViewUser.DataSource = ds;
            GridViewUser.DataBind();
            lbltotalcount.Text = GridViewUser.Rows.Count.ToString();
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

    // Add new user
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            conn.Open();

            SqlCommand cmd_max = new SqlCommand("select max(id) from users;", conn);
            int id = Convert.ToInt32(cmd_max.ExecuteScalar().ToString());
            
            // Query to insert the data
            SqlCommand cmd = new SqlCommand("Insert into users (id,fname,lname,sex,address1,address2,city,zip,mobile,email) values(@id, @fname, @lname, @sex, @address1, @address1, @city, @zip, @mobile, @email)", conn);

            cmd.Parameters.AddWithValue("@id", id+1);
            cmd.Parameters.AddWithValue("@fname", txtfname.Text);
            cmd.Parameters.AddWithValue("@lname", txtlname.Text);

            char sex = (rdomale.Checked) ? 'M' : 'F';

            cmd.Parameters.AddWithValue("@sex", sex);
            // ** Need to handle dob
            //string mm = drpmm.SelectedIndex.ToString();
            //string dob = drpdd + "/" + (Convert.ToInt32(mm) + 1) + "/" + drpyyyy;
            
            //cmd.Parameters.AddWithValue("@dob", dob);
            cmd.Parameters.AddWithValue("@address1", txtaddress1.Text);
            cmd.Parameters.AddWithValue("@address2", txtaddress2.Text);
            cmd.Parameters.AddWithValue("@city", txtcity.Text);
            cmd.Parameters.AddWithValue("@zip", txtpincode.Text);
            cmd.Parameters.AddWithValue("@mobile", txtmobile.Text);
            cmd.Parameters.AddWithValue("@email", txtemail.Text);
            cmd.ExecuteNonQuery();
            conn.Close();

            clear();
            BindGridView();
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

    // Get the existing user info
    protected void GridViewUser_SelectedIndexChanged(object sender, EventArgs e)
    {

        GridViewRow row = GridViewUser.SelectedRow;

        lblID.Text = row.Cells[2].Text;
        txtfname.Text = row.Cells[3].Text;
        txtlname.Text = row.Cells[4].Text;
        // DOB and sex - need to handle
        txtmobile.Text = row.Cells[7].Text;
        txtaddress1.Text = row.Cells[8].Text;
        txtaddress2.Text = row.Cells[9].Text;
        txtcity.Text = row.Cells[10].Text;
        txtemail.Text = row.Cells[11].Text;
        btnSubmit.Visible = false;
        btnUpdate.Visible = true;
    }

    // delete process
    protected void GridViewUser_RowDeleting(object sender, GridViewDeleteEventArgs e) {
        try
        {
            conn.Open();
            int i = e.RowIndex;
            //int SID = Convert.ToInt32(GridViewUser.DataKeys[e.RowIndex].Value);
            GridViewRow row = GridViewUser.Rows[i];
            int id = Convert.ToInt32(row.Cells[2].Text);

            SqlCommand cmd = new SqlCommand("Delete From users where id=@id", conn);
            cmd.Parameters.AddWithValue("@id", id);
            cmd.ExecuteNonQuery();
            cmd.Dispose();

            GridViewUser.EditIndex = -1;
            BindGridView();
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

    //Update operation
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        try
        {
            conn.Open();
            string id = lblID.Text;
            SqlCommand cmd = new SqlCommand("update users Set fname=@fame,lname=@lname,dob=@dob,sex=@sex,address1=@address1,address2=@address2,city=@city,email=@email,mobile=@mobile where SID=@SID", conn);
            cmd.Parameters.AddWithValue("@ID", id);

            cmd.Parameters.AddWithValue("@fname", txtfname.Text);
            cmd.Parameters.AddWithValue("@lname", txtlname.Text);
            char sex = (rdomale.Checked) ? 'M' : 'F';
            cmd.Parameters.AddWithValue("@dob", "01/01/1900");
            cmd.Parameters.AddWithValue("@sex", sex);
            cmd.Parameters.AddWithValue("@address1", txtaddress1.Text);
            cmd.Parameters.AddWithValue("@address2", txtaddress2.Text);
            cmd.Parameters.AddWithValue("@city", txtcity.Text);
            cmd.Parameters.AddWithValue("@mobile", txtmobile.Text);
            cmd.Parameters.AddWithValue("@email", txtemail.Text);
            cmd.ExecuteNonQuery();
            cmd.Dispose();

            GridViewUser.EditIndex = -1;
            BindGridView(); btnUpdate.Visible = false;
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