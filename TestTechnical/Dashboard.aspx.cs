using System;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TestTechnical
{
	public partial class Dashboard : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
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

		void ExportGridToExcel()
		{
			Response.Clear();
			Response.Buffer = true;
			Response.ClearContent();
			Response.ClearHeaders();
			Response.Charset = "";
			string FileName = "ReportSalesOrder_" + DateTime.Now + ".xlsx";



			StringWriter strwritter = new StringWriter();
			HtmlTextWriter htmltextwrtter = new HtmlTextWriter(strwritter);



			Response.ContentType = "application/vnd.ms-excel";
			Response.AddHeader("Content-Disposition", "attachment;filename=" + FileName);
			gv_salesOrder.GridLines = GridLines.Both;
			gv_salesOrder.HeaderStyle.Font.Bold = true;



			gv_salesOrder.RenderControl(htmltextwrtter);
			Response.Write(strwritter.ToString());
			Response.End();

		}
	}
}
