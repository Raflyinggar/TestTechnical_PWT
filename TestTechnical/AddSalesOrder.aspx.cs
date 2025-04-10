using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
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

		protected void Page_Load(object sender, EventArgs e)
		{
			conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnections"].ToString());

			if (!Page.IsPostBack)
			{
				
			}
		}


		protected void btn_addNewItem_Click(object sender, EventArgs e)
		{
			if (!string.IsNullOrWhiteSpace(tb_so_number.Text) && !string.IsNullOrWhiteSpace(tb_orderDate.Text))
			{
				insertData_SO();

				Order_Id_So.Text = GetIdSalesOrders();

				insertItem_SO(Order_Id_So.Text);
			
				gv_so_item.DataBind();


			}
			else
			{
				Response.Write("<script>alert('ORDER NO dan ORDER DATE Wajib Di isi !!');</script>");
			}

		}

		private string GetIdSalesOrders()
		{
			string soOrderId = string.Empty;
			string query = "SELECT [SO_ORDER_ID] FROM [Test_Profescipta].[dbo].[SO_ORDER] WHERE ORDER_NO = @salesOrderNo";

			using (SqlCommand cmd = new SqlCommand(query, conn))
			{
				cmd.Parameters.AddWithValue("@salesOrderNo", tb_so_number.Text.Trim());

				try
				{
					conn.Open();
					object result = cmd.ExecuteScalar();
					conn.Close();

					if (result != null)
					{
						soOrderId = result.ToString();
					}
				}
				catch (Exception ex)
				{
					throw new Exception("Error saat mengambil SO_ORDER_ID: " + ex.Message);
				}
				finally
				{
					if (conn.State == ConnectionState.Open)
						conn.Close();
				}
			}

			return soOrderId;
		}


		//Function Insert Item Sales Order
		private void insertItem_SO(string soId)
		{
			
			try
			{
				string updateSO = @"INSERT INTO SO_ITEM (SO_ORDER_ID)
                         VALUES (@soOrderId)";
				cmd = new SqlCommand(updateSO, conn);
				cmd.Parameters.AddWithValue("@soOrderId", soId);


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
				cmd.Parameters.AddWithValue("@orderDate", Convert.ToDateTime(tb_orderDate.Text));
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

		protected void btn_saveAll_Click(object sender, EventArgs e)
		{
			if (!string.IsNullOrWhiteSpace(tb_so_number.Text) && !string.IsNullOrWhiteSpace(tb_orderDate.Text))
			{
				insertData_SO();
				Response.Redirect("Dashboard.aspx");

			}
			else
			{
				Response.Write("<script>alert('ORDER NO dan ORDER DATE Wajib Di isi !!');</script>");
			}
		}

		protected void btn_cancelAll_Click(object sender, EventArgs e)
		{
			Response.Redirect("Dashboard.aspx");
		}
	}
}