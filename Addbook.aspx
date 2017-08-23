<%@ Page Title="LMS  Books" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Addbook.aspx.cs" Inherits="Addbook" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        input[type=Button], input[type=Text],input[type=Textarea] select {
            width: 100%;
            padding: 5px 10px;
            margin: 4px 0;
            display: inline-block;
            border: 0.5px solid #ccc;
            border-radius: 1px;
            box-sizing: border-box;
        }

        input[type=submit]:hover {
            background-color: #45a049;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <table>
        <tr>
            <td><h3>ADD NEW BOOK<h3/></td>
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                <table class="style1">
                    <tr>
                        <td class="lbl">
                            Book Name
                        </td>
                        <td>
                            <asp:TextBox ID="txtbname" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                ControlToValidate="txtbname" ErrorMessage="Name is Required!" ForeColor="Red" 
                                SetFocusOnError="True"></asp:RequiredFieldValidator>
                        </td>
                        <td>
                            <asp:Label ID="lblID" runat="server" Visible="false"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="lbl">
                            Notes
                        </td>
                        <td>
                            <asp:TextBox ID="txtdetail" runat="server" TextMode="MultiLine" Height="50px" Width="200px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="lbl">
                            Autor 
                        </td>
                        <td>
                            <asp:TextBox ID="txtauthor" runat="server" CssClass="txt"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                ControlToValidate="txtauthor" ErrorMessage="??." ForeColor="Red" 
                                SetFocusOnError="True"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="lbl">
                            Publication
                        </td>
                        <td>
                            <asp:TextBox ID="txtpublication" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                ControlToValidate="txtpublication" ErrorMessage="??" ForeColor="Red" 
                                SetFocusOnError="True"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="lbl">
                            Price &nbsp;
                        </td>
                        <td>
                            <asp:TextBox ID="txtprice" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                                ControlToValidate="txtprice" ErrorMessage="??" ForeColor="Red" 
                                SetFocusOnError="True"></asp:RequiredFieldValidator>
                            <asp:RangeValidator ID="RangeValidator2" runat="server" 
                                ControlToValidate="txtprice" ErrorMessage="??" ForeColor="Red" 
                                MaximumValue="9999999999" MinimumValue="0" SetFocusOnError="True" Type="Double"></asp:RangeValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="lbl">
                            Quantity&nbsp;
                        </td>
                        <td>
                            <asp:TextBox ID="txtqnt" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                                ControlToValidate="txtqnt" ErrorMessage="??" ForeColor="Red" 
                                SetFocusOnError="True"></asp:RequiredFieldValidator>
                            <asp:RangeValidator ID="RangeValidator1" runat="server" 
                                ControlToValidate="txtqnt" ErrorMessage="??" ForeColor="Red" 
                                MaximumValue="9999999999" MinimumValue="0" SetFocusOnError="True" Type="Double"></asp:RangeValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>
                            <asp:Button ID="btnadd" runat="server" CssClass="btn" class="btn btn-default" Text="Save" />
                            <asp:Button ID="btnUpdate" CssClass="btn" class="btn btn-default" runat="server" Text="Update" Visible="false"  OnClick="btnUpdate_Click" /> 
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
        <div style="padding: 10px; margin: 0px; width: 100%;">  
        <p>  
            No of Books : <asp:Label ID="lbltotalcount" runat="server" Font-Bold="true"></asp:Label>  
        </p>  
            <asp:GridView ID="GridViewBooks" runat="server" OnRowEditing="GridViewBooks_EditIndexChanged"  OnRowDeleting="GridViewBooks_RowDeleting" >
                <Columns>
                    <asp:CommandField ShowEditButton="True"></asp:CommandField>
                    <asp:CommandField ShowDeleteButton="True"></asp:CommandField>
                </Columns>
            </asp:GridView>
    </div>  
</asp:Content>
