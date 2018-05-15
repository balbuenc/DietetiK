using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DietetiK
{
    public partial class Products : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ProductsListView_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
           
            DropDownList ddlTipoProducto;
            DropDownList ddlUnidadMedida;

            string txtnombre;
            string txtdescripcion;
            string txtcosto;
            string txtporcentaje_ganancia;
            string txtcodigo_barra;
            string txtid_producto;

            try
            {
                if (e.CommandName == "Agregar")
                {
                    try
                    {
                        ddlTipoProducto = (ProductsListView.InsertItem.FindControl("ddlTipoProducto") as DropDownList);
                        ddlUnidadMedida = (ProductsListView.InsertItem.FindControl("ddlUnidadMedida") as DropDownList);

                        txtnombre = (ProductsListView.InsertItem.FindControl("txtnombre") as TextBox).Text;
                        txtdescripcion = (ProductsListView.InsertItem.FindControl("txtdescripcion") as TextBox).Text;
                        txtcosto = (ProductsListView.InsertItem.FindControl("txtcosto") as TextBox).Text;
                        txtporcentaje_ganancia = (ProductsListView.InsertItem.FindControl("txtporcentaje_ganancia") as TextBox).Text;
                        txtcodigo_barra = (ProductsListView.InsertItem.FindControl("txtcodigo_barra") as TextBox).Text;


                        ProductDataSource.InsertParameters["nombre"].DefaultValue = txtnombre;
                        ProductDataSource.InsertParameters["descripcion"].DefaultValue = txtdescripcion;
                        ProductDataSource.InsertParameters["costo"].DefaultValue = txtcosto;
                        ProductDataSource.InsertParameters["porcentaje_ganancia"].DefaultValue = txtporcentaje_ganancia;
                        ProductDataSource.InsertParameters["codigo_barra"].DefaultValue = txtcodigo_barra;

                        ProductDataSource.InsertParameters["id_tipo_producto"].DefaultValue = ddlTipoProducto.SelectedValue;
                        ProductDataSource.InsertParameters["id_unidad_medida"].DefaultValue = ddlUnidadMedida.SelectedValue;

                        ProductDataSource.Insert();

                    }
                    catch (Exception exp)
                    {
                        ErrorLabel.Text = exp.Message;
                        ErrorLabel.Visible = true;
                    }
                }
                else if (e.CommandName == "Actualizar")
                {
                    try
                    {
                        ddlTipoProducto = (e.Item.FindControl("ddlTipoProducto") as DropDownList);
                        ddlUnidadMedida = (e.Item.FindControl("ddlUnidadMedida") as DropDownList);

                        txtnombre = (e.Item.FindControl("txtnombre") as TextBox).Text;
                        txtdescripcion = (e.Item.FindControl("txtdescripcion") as TextBox).Text;
                        txtcosto = (e.Item.FindControl("txtcosto") as TextBox).Text;
                        txtporcentaje_ganancia = (e.Item.FindControl("txtporcentaje_ganancia") as TextBox).Text;
                        txtcodigo_barra = (e.Item.FindControl("txtcodigo_barra") as TextBox).Text;
                        txtid_producto = (e.Item.FindControl("txtid_producto") as Label).Text;

                        ProductDataSource.UpdateParameters["id_producto"].DefaultValue = txtid_producto;
                        ProductDataSource.UpdateParameters["nombre"].DefaultValue = txtnombre;
                        ProductDataSource.UpdateParameters["descripcion"].DefaultValue = txtdescripcion;
                        ProductDataSource.UpdateParameters["costo"].DefaultValue = txtcosto;
                        ProductDataSource.UpdateParameters["porcentaje_ganancia"].DefaultValue = txtporcentaje_ganancia;
                        ProductDataSource.UpdateParameters["codigo_barra"].DefaultValue = txtcodigo_barra;

                        ProductDataSource.UpdateParameters["id_tipo_producto"].DefaultValue = ddlTipoProducto.SelectedValue;
                        ProductDataSource.UpdateParameters["id_unidad_medida"].DefaultValue = ddlUnidadMedida.SelectedValue;



                        ProductDataSource.Update();
                        Response.Redirect("/Products.aspx");
                    }
                    catch (Exception exp)
                    {
                        ErrorLabel.Text = exp.Message;
                        ErrorLabel.Visible = true;
                    }
                }

                
            }
            catch (Exception)
            {
                throw;
            }

        }
    }

}