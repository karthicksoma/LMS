<%@ Page Title="LMS - Issue" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        input[type=Button], select {
            width: 100%;
            padding: 12px 20px;
            margin: 8px 0;
            display: inline-block;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        input[type=submit]:hover {
            background-color: #45a049;
        }
    </style>
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
   <table class="tbl">
        <tr>
            <td>
                <h3>
                    BOOK ISSUE FORM
                </h3>
            </td>
        </tr>
        <tr>
            <td>
            <table align="center"  class="style1">
                <tr>
                    <td class="lbl"> 
                        Select User:
                    </td>
                    <td>
                        <asp:DropDownList ID="drpuser" runat="server" CssClass="txt" AutoPostBack="True">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="lbl">
                        Select Book :
                    </td>
                    <td>
                        <asp:DropDownList ID="drpbook" runat="server" CssClass="txt">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <br />
                </tr>
                <tr>
                    <td>
                    </td>
                    <td>
                        <asp:Button ID="btnsearch" runat="server" CssClass="btn" Text="Search" OnClick="btnSearch_Click"  class="btn btn-default"/>
                        <asp:Button ID="btnissue" runat="server" CssClass="btn" Text="Save" Visible="false" OnClick="btnIssue_Click" class="btn btn-default"/>
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                </table>
            </td>
        </tr>
    </table>
    <p>
        <asp:Label ID="lbltotalbooks" runat="server" Font-Bold="true"></asp:Label>  
    </p>
</asp:Content>