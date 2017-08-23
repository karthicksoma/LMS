using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Addbook : Page
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
        txtbname.Text = string.Empty;
        txtdetail.Text = string.Empty;
        txtauthor.Text = string.Empty;
        txtpublication.Text = string.Empty;
        txtprice.Text = string.Empty;
        txtqnt.Text = string.Empty;
        txtbname.Focus();
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
            SqlCommand cmd = new SqlCommand("select id as \"Book Id\", name as Name, notes as Description,Author,publication,price,quantity from books order by id;", conn);
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();

            // Fill the Grid view
            adp.Fill(ds);
            GridViewBooks.DataSource = ds;
            GridViewBooks.DataBind();
            lbltotalcount.Text = GridViewBooks.Rows.Count.ToString();
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
            SqlCommand cmd_max = new SqlCommand("select max(id) from books;", conn);
            int id = Convert.ToInt32(cmd_max.ExecuteScalar().ToString());
            // Base case
            //if (id > 0) {
            //   id = 0;
            //}

            SqlCommand cmd = new SqlCommand("Insert into books (id,name,notes,author,publication,price,quantity) values(@id,@txtbname,@txtdetail,@txtauthor,@txtpublication,@txtprice,@txtqnt)", conn);
            cmd.Parameters.AddWithValue("@id", id + 1);
            cmd.Parameters.AddWithValue("@txtbname", txtbname.Text);
            cmd.Parameters.AddWithValue("@txtdetail", txtdetail.Text);
            cmd.Parameters.AddWithValue("@txtauthor", txtauthor.Text);
            cmd.Parameters.AddWithValue("@ttxtpublication", txtpublication.Text);
            cmd.Parameters.AddWithValue("@ttxtprice", txtprice.Text);
            cmd.Parameters.AddWithValue("@ttxtqnt", Convert.ToInt32(txtqnt.Text));

            cmd.ExecuteNonQuery();
            cmd.Dispose();

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
    protected void GridViewBooks_EditIndexChanged(object sender, GridViewEditEventArgs e)
    {
        int i = e.NewEditIndex;
        GridViewRow row = GridViewBooks.Rows[i];
        txtbname.Text = row.Cells[3].Text;
        txtdetail.Text = row.Cells[4].Text;
        txtauthor.Text = row.Cells[5].Text;
        txtpublication.Text = row.Cells[6].Text;
        txtprice.Text = row.Cells[7].Text;
        txtqnt.Text = row.Cells[8].Text;
        BindGridView();
    }

    // delete process
    protected void GridViewBooks_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        try
        {
            conn.Open();
            int i = e.RowIndex;
            GridViewRow row = GridViewBooks.Rows[i];
            int id = Convert.ToInt32(row.Cells[2].Text);

            SqlCommand cmd = new SqlCommand("Delete From books where id=@id", conn);
            cmd.Parameters.AddWithValue("@id", id);
            cmd.ExecuteNonQuery();
            cmd.Dispose();

            GridViewBooks.EditIndex = -1;
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
            SqlCommand cmd = new SqlCommand("update books Set txtbname=@txtbname,txtdetail=@txtdetail,txtauthor=@txtauthor,txtpublication=@txtpublication,txtprice=@txtprice,txtqnt=@txtqnt where id=@ID", conn);
            cmd.Parameters.AddWithValue("@ID", id);

            cmd.Parameters.AddWithValue("@txtbname", txtbname.Text);
            cmd.Parameters.AddWithValue("@txtdetail", txtdetail.Text);
            cmd.Parameters.AddWithValue("@txtauthor", txtauthor.Text);
            cmd.Parameters.AddWithValue("@txtpublication", txtpublication.Text);
            cmd.Parameters.AddWithValue("@txtprice", txtprice.Text);
            cmd.Parameters.AddWithValue("@txtqnt", txtqnt.Text);
            cmd.ExecuteNonQuery();
            cmd.Dispose();

            GridViewBooks.EditIndex = -1;
            BindGridView();
            btnUpdate.Visible = false;
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