using System;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TestTechnical
{
	public partial class Dashboard : System.Web.UI.Page
	{
		private SqlCommand cmd;
		private SqlConnection conn;
		protected void Page_Load(object sender, EventArgs e)
		{
			conn = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnections"].ToString());

			if (!IsPostBack)
			{
				gv_salesOrder.DataBind();
			}
		}

		protected void btn_search_Click(object sender, EventArgs e)
		{
			gv_salesOrder.DataBind();
		}

		protected void btn_addNewSales_Click(object sender, EventArgs e)
		{
			Response.Redirect("AddSalesOrder.aspx");
		}

		protected void btn_exportToExcel_Click(object sender, EventArgs e)
		{
			ExportGridToExcel();
		}

		public override void VerifyRenderingInServerForm(Control control)
		{
			/* Confirms that an HtmlForm control is rendered for the specified ASP.NET
			   server control at run time. */
		}

		void ExportGridToExcel()
		{
			Response.Clear();
			Response.Buffer = true;
			Response.ClearContent();
			Response.ClearHeaders();
			Response.Charset = "";
			string FileName = "ReportSalesOrder_" + DateTime.Now + ".xls";



			StringWriter strwritter = new StringWriter();
			HtmlTextWriter htmltextwrtter = new HtmlTextWriter(strwritter);



			Response.ContentType = "application/vnd.ms-excel";
			Response.AddHeader("Content-Disposition", "attachment;filename=" + FileName);
			gv_print_salesOrder.GridLines = GridLines.Both;
			gv_print_salesOrder.HeaderStyle.Font.Bold = true;



			gv_print_salesOrder.RenderControl(htmltextwrtter);
			Response.Write(strwritter.ToString());
			Response.End();

		}

		// This is a method to delete a sales order
		protected void gv_salesOrder_RowCommand(object sender, GridViewCommandEventArgs e)
		{
			if (e.CommandName == "DeleteSalesOrder")
			{
				int index = Convert.ToInt32(e.CommandArgument);
				GridViewRow row = gv_salesOrder.Rows[index];
				int salesOrderId = Convert.ToInt32(gv_salesOrder.DataKeys[index].Value);
				// Call the method to delete the sales order
				DeleteSalesOrder(salesOrderId);
				// Rebind the grid to reflect the changes
				gv_salesOrder.DataBind();
			}
		}

		private void DeleteSalesOrder(int salesOrderId)
		{
			string deleteSO = "DELETE FROM [Test_Profescipta].[dbo].[SO_ORDER] WHERE SO_ORDER_ID = @SalesOrderId";

			cmd = new SqlCommand(deleteSO, conn);
			cmd.Parameters.AddWithValue("@SalesOrderId", salesOrderId);

			try
			{
				conn.Open();
				cmd.ExecuteNonQuery();
			}
			catch (Exception ex)
			{
				// Handle exception (e.g., log it)
				throw new Exception("Error deleting sales order: " + ex.Message);
			}
			finally
			{
				conn.Close();

			}
		}
	}
}
