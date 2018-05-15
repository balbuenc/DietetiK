using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DietetiK
{
    public partial class Sales : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["venta"] != null)
            {
                ddlClientes.SelectedValue = ObtenerClientID(Convert.ToInt32(Request.QueryString["venta"])).ToString();

                //if (IsPostBack)
                ObtenerTotal();

            }


            txtCodigoProducto.Focus();


        }

        protected void ObtenerTotal()
        {
            SqlConnection sqlConnection1 = new SqlConnection(SaleDetailsDataSource.ConnectionString);
            SqlCommand cmd = new SqlCommand();
            decimal retval = 0;

            try
            {
                cmd.CommandText = "sp_get_sale_total";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = sqlConnection1;

                SqlParameter outParam = new SqlParameter();
                outParam.SqlDbType = System.Data.SqlDbType.BigInt;
                outParam.ParameterName = "@total";
                outParam.Direction = System.Data.ParameterDirection.Output;

                SqlParameter total_usd = new SqlParameter();
                total_usd.SqlDbType = System.Data.SqlDbType.Decimal;
                total_usd.Precision = 18;
                total_usd.Scale = 2;
                total_usd.ParameterName = "@total_usd";
                total_usd.Direction = System.Data.ParameterDirection.Output;

                SqlParameter total_brl = new SqlParameter();
                total_brl.SqlDbType = System.Data.SqlDbType.Decimal;
                total_brl.Precision = 18;
                total_brl.Scale = 2;
                total_brl.ParameterName = "@total_brl";
                total_brl.Direction = System.Data.ParameterDirection.Output;

                if (Request.QueryString["venta"] != null)
                {
                    cmd.Parameters.AddWithValue("@id_venta", Request.QueryString["venta"]);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@id_venta", DBNull.Value);
                }


                cmd.Parameters.Add(outParam);
                cmd.Parameters.Add(total_usd);
                cmd.Parameters.Add(total_brl);

                sqlConnection1.Open();
                cmd.ExecuteNonQuery();

                retval = Convert.ToInt32(cmd.Parameters["@total"].Value);
                TotalPYG.Text = retval.ToString();

                retval = Convert.ToDecimal(cmd.Parameters["@total_usd"].Value);
                TotalUSD.Text = retval.ToString();

                retval = Convert.ToDecimal(cmd.Parameters["@total_brl"].Value);
                TotalBRL.Text = retval.ToString();

                sqlConnection1.Close();

            }
            catch (Exception exp)
            {
                sqlConnection1.Close();
                ErrorLabel.Text = "Error al obtener Cliente desde venta .. : " + exp.Message;
                ErrorLabel.Visible = true;
                retval = -1;
            }

        }


        protected string ObtenerCodigoProducto(int id_producto)
        {
            SqlConnection sqlConnection1 = new SqlConnection(SaleDetailsDataSource.ConnectionString);

            SqlCommand cmd = new SqlCommand();
            string retval = "-1";

            try
            {
                cmd.CommandText = "sp_get_codigo_producto_by_id";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = sqlConnection1;

                SqlParameter outParam = new SqlParameter();
                outParam.SqlDbType = System.Data.SqlDbType.VarChar;
                outParam.Size = -1;
                outParam.ParameterName = "@codigo";
                outParam.Direction = System.Data.ParameterDirection.Output;

                cmd.Parameters.AddWithValue("@id_producto", id_producto);
                cmd.Parameters.Add(outParam);

                sqlConnection1.Open();
                cmd.ExecuteNonQuery();

                retval = cmd.Parameters["@codigo"].Value.ToString();

                sqlConnection1.Close();

            }
            catch (Exception exp)
            {
                sqlConnection1.Close();
                ErrorLabel.Text = "Error al obtener Codigo de producto .. : " + exp.Message;
                ErrorLabel.Visible = true;
                retval = "-1";
            }

            return retval;
        }

        protected int ObtenerClientID(int id_venta)
        {
            SqlConnection sqlConnection1 = new SqlConnection(SaleDetailsDataSource.ConnectionString);

            SqlCommand cmd = new SqlCommand();
            int retval = -1;

            try
            {
                cmd.CommandText = "sp_get_id_cliente_by_sale";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = sqlConnection1;

                SqlParameter outParam = new SqlParameter();
                outParam.SqlDbType = System.Data.SqlDbType.BigInt;
                outParam.ParameterName = "@id_cliente";
                outParam.Direction = System.Data.ParameterDirection.Output;

                cmd.Parameters.AddWithValue("@id_venta", id_venta);
                cmd.Parameters.Add(outParam);

                sqlConnection1.Open();
                cmd.ExecuteNonQuery();

                retval = Convert.ToInt32(cmd.Parameters["@id_cliente"].Value);

                sqlConnection1.Close();

            }
            catch (Exception exp)
            {
                sqlConnection1.Close();
                ErrorLabel.Text = "Error al obtener Cliente desde venta .. : " + exp.Message;
                ErrorLabel.Visible = true;
                retval = -1;
            }

            return retval;
        }

        protected void AgregarProducto_Click(object sender, EventArgs e)
        {
            SqlConnection sqlConnection1 = new SqlConnection(SaleDetailsDataSource.ConnectionString);

            SqlCommand cmd = new SqlCommand();
            int retval = -1;

            try
            {
                cmd.CommandText = "sp_venta_producto";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = sqlConnection1;

                if (Request.QueryString["venta"] != null)
                {
                    cmd.Parameters.AddWithValue("@id_venta", Request.QueryString["venta"]);
                }
                else
                {
                    cmd.Parameters.AddWithValue("@id_venta", DBNull.Value);
                }

                cmd.Parameters.AddWithValue("@codigo", txtCodigoProducto.Text);
                cmd.Parameters.AddWithValue("@cantidad", 1);
                cmd.Parameters.AddWithValue("@id_cliente", ddlClientes.SelectedValue);

                SqlParameter outParam = new SqlParameter();
                outParam.SqlDbType = System.Data.SqlDbType.BigInt;
                outParam.ParameterName = "@idv";
                outParam.Direction = System.Data.ParameterDirection.Output;

                cmd.Parameters.Add(outParam);

                sqlConnection1.Open();
                cmd.ExecuteNonQuery();

                retval = Convert.ToInt32(cmd.Parameters["@idv"].Value);

                sqlConnection1.Close();

                Response.Redirect("Sales.aspx?venta=" + retval.ToString());

            }
            catch (Exception exp)
            {
                sqlConnection1.Close();
                ErrorLabel.Text = "Error al Agregar producto .. : " + exp.Message;
                ErrorLabel.Visible = true;
            }


        }

        protected void FacturarBTN_Click(object sender, EventArgs e)
        {

        }

        protected void ddlProductos_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtCodigoProducto.Text = "";
            txtCodigoProducto.Text = ObtenerCodigoProducto(Convert.ToInt32(ddlProductos.SelectedValue));
        }


    }
}