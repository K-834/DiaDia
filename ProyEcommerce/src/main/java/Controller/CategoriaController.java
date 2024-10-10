/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Entity.Categoria;
import Entity.Producto;
import Entity.Usuario;
import Model.CategoriaModel;
import Model.ProductoModel;
import java.io.ByteArrayOutputStream;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Dayanna
 */
@WebServlet(name = "CategoriaController", urlPatterns = {"/CategoriaController"})
public class CategoriaController extends HttpServlet {

    CategoriaModel model = new CategoriaModel();
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = (String) request.getParameter("action");
        String categoriaid = request.getParameter("categoriaid");

        switch (action) {
            case "load":
                List<Categoria> listaCategorias = model.obtenerCategorias(); 
                HttpSession misesion = request.getSession();
                misesion.setAttribute("listaCategorias", listaCategorias); 
                request.getRequestDispatcher("categorias.jsp").forward(request, response); 
                break;
            case "delete":
   
              if (model.eliminarCategoria(Integer.parseInt(categoriaid))) {
                    request.getRequestDispatcher("admin/admin_categorias.jsp").forward(request, response);
                } else {
                    request.getRequestDispatcher("admin/admin_categorias.jsp").forward(request, response);
                }   
    break;

        }
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
             try {
        String action = request.getParameter("action");
        int id = Integer.parseInt(request.getParameter("categoria-id") != null ? request.getParameter("categoria-id") : "0");
        String nombre = request.getParameter("categoria-nombre");
        String descripcion = request.getParameter("categoria-descripcion");

        switch (action) {
            case "agregar-categoria":
                if (model.agregarCategoria(nombre, descripcion)) {
                    request.getRequestDispatcher("admin/admin_categorias.jsp").forward(request, response);
                } else {
                    request.getRequestDispatcher("admin/admin_categorias_agregar.jsp").forward(request, response);
                }
                break;

            case "editar-categoria":
                if (model.editarCategoria(id, nombre, descripcion)) {
                    request.getRequestDispatcher("admin/admin_categorias.jsp").forward(request, response);
                } else {
                    request.getRequestDispatcher("admin/admin_categorias_editar.jsp?categoriaid=" + id).forward(request, response);
                }
                break;
        }
    } catch (Exception e) {
        response.getWriter().write("Error en el procesamiento del formulario: " + e.getMessage());
    }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    public Categoria obtenerCategoria(int id) {
        return (model.obtenerCategoria(id) != null) ? model.obtenerCategoria(id) : null;
    }

    public List<Categoria> obtenerCategorias() {
        return model.obtenerCategorias();
    }

}
