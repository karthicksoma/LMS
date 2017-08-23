<%@ Page Title="LMS - Return" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Return.aspx.cs" Inherits="Return" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        input[type=Button], input[type=Text], select {
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
            <td >
                <h3>
                    BOOK RETURN FORM
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
                    <td>
                        <asp:Label ID="lblmsg" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Button ID="btnsearch" runat="server" CssClass="btn" Text="Search" OnClick="btnSearch_Click" class="btn btn-default" />
                        <asp:Button ID="btnreturn" runat="server" CssClass="btn" Text="Take Return" OnClick="btnReturn_Click" Visible="false" class="btn btn-default"/>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                </table>
            </td>
        </tr>
    </table>
    <div ID="totalbook" visible="false">
    <p>
        <asp:Label ID="lbltotalbooks" runat="server" Font-Bold="true"></asp:Label>  
    </p>
    </div>
    <asp:GridView ID="GridViewbooklist" runat="server"></asp:GridView>
</asp:Content>
