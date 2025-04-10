using System;
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
	}
}
