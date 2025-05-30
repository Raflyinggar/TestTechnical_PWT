﻿using System;
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
	public partial class EditSalesOrder : System.Web.UI.Page
	{
		private SqlCommand cmd;
		private SqlConnection conn;
		string ID_ORDER;

		protected void Page_Load(object sender, EventArgs e)
		{
			conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnections"].ToString());

			ID_ORDER = Request.QueryString["salesOrdersId"];

			if (!Page.IsPostBack)
			{

				if (ID_ORDER != null)
				{
					GetDataSales(ID_ORDER);
				}
				else
				{
					tb_so_number.Text = null;
					tb_orderDate.Text = null;
					tb_address.Text = null;
				}

			}
		}

		public void GetDataSales(string soId)
		{
			using (conn)
			{
				using (SqlCommand cmd = new SqlCommand())
				{
					cmd.CommandText = @"SELECT A.[SO_ORDER_ID]
      ,A.[ORDER_NO]
      ,A.[ORDER_DATE]
      ,A.[COM_CUSTOMER_ID]
      ,A.[ADDRESS]
  FROM [Test_Profescipta].[dbo].[SO_ORDER] A
  LEFT JOIN [Test_Profescipta].[dbo].[SO_ITEM] B ON A.[SO_ORDER_ID] = B.[SO_ORDER_ID]
  WHERE A.[SO_ORDER_ID] = @orderId";
					cmd.Connection = conn;
					cmd.Parameters.AddWithValue("@orderId", soId);

					conn.Open();
					using (SqlDataReader sdr = cmd.ExecuteReader())
					{
						if (sdr.Read())
						{
							tb_so_number.Text = sdr["ORDER_NO"].ToString();

							string dt_order = sdr["ORDER_DATE"].ToString();
							DateTime OrderDate = DateTime.Parse(dt_order);
							tb_orderDate.Text = OrderDate.ToString("yyyy-MM-dd HH:mm:ss");

							tb_address.Text = sdr["ADDRESS"].ToString();

							Order_Id_So.Text = sdr["SO_ORDER_ID"].ToString();

						}
						else
						{
							tb_so_number.Text = null;
							tb_orderDate.Text = null;
							tb_address.Text = null;
						}

					}
				}

			}
		}


		private void addItemNew()
		{
			try
			{
				string query = @"INSERT INTO [dbo].[SO_ITEM]
           ([SO_ORDER_ID]) VALUES (@soOrderId)";

				cmd = new SqlCommand(query, conn);

				cmd.Parameters.AddWithValue("@soOrderId", ID_ORDER);


				conn.Open();
				cmd.ExecuteNonQuery();

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

		protected void btn_addNewItem_Click(object sender, EventArgs e)
		{
			addItemNew();
			gv_so_item.DataBind();
		}



		protected void gv_so_item_RowEditing(object sender, GridViewEditEventArgs e)
		{
			gv_so_item.EditIndex = e.NewEditIndex;
			gv_so_item.DataBind();
		}

		protected void gv_so_item_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
		{
			gv_so_item.EditIndex = -1;
			gv_so_item.DataBind();
		}

		protected void gv_so_item_RowUpdating(object sender, GridViewUpdateEventArgs e)
		{
			gv_so_item.EditIndex = -1;
			gv_so_item.DataBind();
		}
	}
}