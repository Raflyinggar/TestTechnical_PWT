using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TestTechnical
{
	public partial class AddSalesOrders : System.Web.UI.Page
	{
		private SqlCommand cmd;
		private SqlConnection conn;


		//if (!string.IsNullOrWhiteSpace(tb_so_number.Text))
		//{

		//}
		//else
		//{
		//	Response.Write("<script>alert('Please fill in the Sales Order Number');</script>");
		//}

		protected void Page_Load(object sender, EventArgs e)
		{
			conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnections"].ToString());

			if (!Page.IsPostBack)
			{
				
			}
		}


		protected void btn_addNewItem_Click(object sender, EventArgs e)
		{
			insertItem_SO();

			gv_so_item.DataSourceID = "SDS_SO_Item";
			gv_so_item.DataBind();

		}

		//Function Insert Item Sales Order
		private void insertItem_SO()
		{
			
			try
			{
				string updateSO = @"INSERT INTO SO_ITEM (SO_ORDER_ID)
                         VALUES (@soOrderId)";
				cmd = new SqlCommand(updateSO, conn);
				cmd.Parameters.AddWithValue("@soOrderId", 0);


				conn.Open();
				cmd.ExecuteNonQuery();

				conn.Close();
				cmd.Dispose();

			}

			catch (SqlException sqlEx)
			{
				throw new Exception(sqlEx.Message);
			}
			catch (Exception ex)
			{
				throw new Exception(ex.Message);
			}
			finally
			{
				conn.Close();
				cmd.Dispose();

			}
		}

		//Function Insert Data Sales Order
		private int insertData_SO()
		{
			int soOrderId = 0;
			try
			{
				string updateSO = @"INSERT INTO [dbo].[SO_ORDER]
           ([ORDER_NO]
           ,[ORDER_DATE]
           ,[COM_CUSTOMER_ID]
           ,[ADDRESS])
			VALUES
		   (@soNumber
		   ,@orderDate
		   ,@customerId
		   ,@address)";
				cmd = new SqlCommand(updateSO, conn);
				cmd.Parameters.AddWithValue("@soNumber", tb_so_number.Text);
				cmd.Parameters.AddWithValue("@orderDate", tb_orderDate.Text);
				cmd.Parameters.AddWithValue("@customerId", dd_customer.SelectedValue);
				cmd.Parameters.AddWithValue("@address", tb_address.Text);

				conn.Open();
				cmd.ExecuteNonQuery();
				conn.Close();
				cmd.Dispose();

			}

			catch (SqlException sqlEx)
			{
				throw new Exception(sqlEx.Message);
			}
			catch (Exception ex)
			{
				throw new Exception(ex.Message);
			}
			finally
			{
				conn.Close();
				cmd.Dispose();

			}
			return soOrderId;
		}

	}
}