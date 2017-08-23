<%@ Page Title="LMS - Users" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="User.aspx.cs" Inherits="User" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        input[type=Text]{
            width: 100%;
            padding: 5px 10px;
            margin: 4px 0;
            display: inline-block;
            border: 0.5px solid #ccc;
            border-radius: 1px;
            box-sizing: border-box;
        }
        input[type=Button]:hover {
            background-color: #45a049;
        }
        select {
            width: 15%;
            padding: 1px 2px;
            border: 1px solid #ccc;
            display: inline-block;
            border-radius: 1px;
            box-sizing: border-box;
        }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server" >
    <div class="container">
    <table class="tbl">
    <tr>
        <td class="tblhead">
            <h3>ADD NEW User</h3></td>
    </tr>
    <tr>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td>
            <table class="table1">
                <tr>
                    <td class="lbl">
                        First Name </td>
                    <td>
                        <asp:TextBox ID="txtfname" runat="server" CssClass="txt"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                ControlToValidate="txtfname" ErrorMessage="First name is required." ForeColor="Red" 
                                SetFocusOnError="True"></asp:RequiredFieldValidator>
                        </td>
                    <td>
                        <asp:Label ID="lblID" runat="server" Visible="false"></asp:Label>
                    </td>
                </tr>
                                <tr>
                    <td class="lbl">
                        Last Name </td>
                    <td>
                        <asp:TextBox ID="txtlname" runat="server" CssClass="txt"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                ControlToValidate="txtlname" ErrorMessage="Last name is required." ForeColor="Red" 
                                SetFocusOnError="True"></asp:RequiredFieldValidator>
                        </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="lbl">
                        Gender&nbsp;  </td>
                    <td>
                        <asp:RadioButton ID="rdomale" runat="server" Checked="True" Text="MALE" />
                        <asp:RadioButton ID="rdofemale" runat="server" Text="FEMALE" />
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="lbl">
                        Birth of Date  </td>
                    <td>
                        &nbsp;<asp:DropDownList ID="drpdd" runat="server">
                            <asp:ListItem>DD</asp:ListItem>
                            <asp:ListItem>1</asp:ListItem>
                            <asp:ListItem>2</asp:ListItem>
                            <asp:ListItem>3</asp:ListItem>
                            <asp:ListItem>4</asp:ListItem>
                            <asp:ListItem>5</asp:ListItem>
                            <asp:ListItem>6</asp:ListItem>
                            <asp:ListItem>7</asp:ListItem>
                            <asp:ListItem>8</asp:ListItem>
                            <asp:ListItem>9</asp:ListItem>
                            <asp:ListItem>10</asp:ListItem>
                             <asp:ListItem>11</asp:ListItem>
                            <asp:ListItem>12</asp:ListItem>
                            <asp:ListItem>13</asp:ListItem>
                            <asp:ListItem>14</asp:ListItem>
                            <asp:ListItem>15</asp:ListItem>
                            <asp:ListItem>16</asp:ListItem>
                            <asp:ListItem>17</asp:ListItem>
                            <asp:ListItem>18</asp:ListItem>
                            <asp:ListItem>19</asp:ListItem>
                            <asp:ListItem>20</asp:ListItem>
                             <asp:ListItem>21</asp:ListItem>
                            <asp:ListItem>22</asp:ListItem>
                            <asp:ListItem>23</asp:ListItem>
                            <asp:ListItem>24</asp:ListItem>
                            <asp:ListItem>25</asp:ListItem>
                            <asp:ListItem>26</asp:ListItem>
                            <asp:ListItem>27</asp:ListItem>
                            <asp:ListItem>28</asp:ListItem>
                            <asp:ListItem>29</asp:ListItem>
                            <asp:ListItem>30</asp:ListItem>
                            <asp:ListItem>31</asp:ListItem>
                            <asp:ListItem></asp:ListItem>
                        </asp:DropDownList>
                        &nbsp;<asp:DropDownList ID="drpmm" runat="server">
                            <asp:ListItem>MM</asp:ListItem>
                            <asp:ListItem>jan</asp:ListItem>
                            <asp:ListItem>feb</asp:ListItem>
                            <asp:ListItem>mar</asp:ListItem>
                            <asp:ListItem>apr</asp:ListItem>
                            <asp:ListItem>may</asp:ListItem>
                            <asp:ListItem>jun</asp:ListItem>
                            <asp:ListItem>jul</asp:ListItem>
                            <asp:ListItem>aug</asp:ListItem>
                            <asp:ListItem>sep</asp:ListItem>
                            <asp:ListItem>oct</asp:ListItem>
                            <asp:ListItem>nov</asp:ListItem>
                            <asp:ListItem>dec</asp:ListItem>
                        </asp:DropDownList>
                        &nbsp;<asp:DropDownList ID="drpyyyy" runat="server">
                            <asp:ListItem>YYYY</asp:ListItem>
                            <asp:ListItem>1980</asp:ListItem>
                            <asp:ListItem>1981</asp:ListItem>
                            <asp:ListItem>1982</asp:ListItem>
                            <asp:ListItem>1983</asp:ListItem>
                            <asp:ListItem>1984</asp:ListItem>
                            <asp:ListItem>1985</asp:ListItem>
                            <asp:ListItem>1986</asp:ListItem>
                            <asp:ListItem>1987</asp:ListItem>
                            <asp:ListItem>1988</asp:ListItem>
                            <asp:ListItem>1989</asp:ListItem>
                            <asp:ListItem>1990</asp:ListItem>
                            <asp:ListItem>1991</asp:ListItem>
                             <asp:ListItem>1992</asp:ListItem>
                            <asp:ListItem>1993</asp:ListItem>
                             <asp:ListItem>1994</asp:ListItem>
                            <asp:ListItem>1995</asp:ListItem>
                             <asp:ListItem>1996</asp:ListItem>
                            <asp:ListItem>1997</asp:ListItem>
                             <asp:ListItem>1998</asp:ListItem>
                            <asp:ListItem>1999</asp:ListItem>
                             <asp:ListItem>2000</asp:ListItem>
                            <asp:ListItem>2001</asp:ListItem>
                            <asp:ListItem>2002</asp:ListItem>
			                <asp:ListItem>2003</asp:ListItem>
			                <asp:ListItem>2004</asp:ListItem>
			                <asp:ListItem>2005</asp:ListItem>
			                <asp:ListItem>2006</asp:ListItem>
			                <asp:ListItem>2007</asp:ListItem>
			                <asp:ListItem>2008</asp:ListItem>
			                <asp:ListItem>2009</asp:ListItem>
			                <asp:ListItem>2010</asp:ListItem>
			                <asp:ListItem>2011</asp:ListItem>
			                <asp:ListItem>2012</asp:ListItem>
			                <asp:ListItem>2013</asp:ListItem>
			                <asp:ListItem>2014</asp:ListItem>
			                <asp:ListItem>2015</asp:ListItem>
			                <asp:ListItem>2016</asp:ListItem>
			                <asp:ListItem>2017</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="lbl">
                        Mobile  </td>
                    <td>
                        <asp:TextBox ID="txtmobile" runat="server" CssClass="txt" MaxLength="10"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server"
                            ControlToValidate="txtmobile" ErrorMessage="Mobile number is required." ForeColor="Red"
                            SetFocusOnError="True"></asp:RequiredFieldValidator>
                        <asp:RangeValidator ID="RangeValidator1" runat="server" 
                            ControlToValidate="txtmobile" ErrorMessage="Invalid mobile no." ForeColor="Red" 
                            MaximumValue="9999999999" MinimumValue="1000000000" SetFocusOnError="True" 
                            Type="Double"></asp:RangeValidator>
                        </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="lbl">
                        Address 1 </td>
                    <td>
                        <asp:TextBox ID="txtaddress1" runat="server" CssClass="txt"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                 <tr>
                    <td class="lbl">
                        Address 2 </td>
                    <td>
                        <asp:TextBox ID="txtaddress2" runat="server" CssClass="txt"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="lbl">
                        City  </td>
                    <td>
                        <asp:TextBox ID="txtcity" runat="server" CssClass="txt"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="lbl">
                        Pincode  </td>
                    <td>
                        <asp:TextBox ID="txtpincode" runat="server" CssClass="txt" MaxLength="6" ToolTip="Please enter 6 digit pincode."></asp:TextBox>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="lbl">
                        Email  </td>
                    <td>
                        <asp:TextBox ID="txtemail" runat="server" CssClass="txt"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                                ControlToValidate="txtemail" ErrorMessage="??" ForeColor="Red" 
                                SetFocusOnError="True"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                            ControlToValidate="txtemail" ErrorMessage="??" ForeColor="Red" 
                            SetFocusOnError="True" 
                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                        </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                    <td>
                        <asp:Button ID="btnSubmit" CssClass="btn" class="btn btn-default" runat="server" Text="Submit" OnClick="btnSubmit_Click" />  
                        <asp:Button ID="btnUpdate" CssClass="btn" class="btn btn-default" runat="server" Text="Update" Visible="false"  OnClick="btnUpdate_Click" /> 
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
            </table>
        </td>
    </tr>
    </table>
   </div>

    <div style="padding: 10px; margin: 0px; width: 100%;">  
        <p>  
            No of Active Users : <asp:Label ID="lbltotalcount" runat="server" Font-Bold="true"></asp:Label>  
        </p>  
        <asp:GridView ID="GridViewUser" runat="server" OnRowEditing="GridViewUser_SelectedIndexChanged"  OnRowDeleting="GridViewUser_RowDeleting">
            <Columns>
                <asp:CommandField ShowEditButton="True"></asp:CommandField>
                <asp:CommandField ShowDeleteButton="True"></asp:CommandField>
            </Columns>
        </asp:GridView>
    </div>  
</asp:Content>
