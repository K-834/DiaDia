package Controller;

import Entity.Categoria;
import Entity.Producto;
import Entity.Usuario;
import Model.ProductoModel;
import java.io.ByteArrayOutputStream;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "ProductoController", urlPatterns = {"/ProductoController"})
public class ProductoController extends HttpServlet {

    ProductoModel model = new ProductoModel();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = (String) request.getParameter("action");
        String productoid = request.getParameter("productoid");
        String categoriaNombre = request.getParameter("categoriaNombre");

        switch (action) {
            case "load":
                List<Producto> listaProductos = model.obtenerProductos();
                List<Categoria> listaCategorias = model.obtenerCategorias();

                request.setAttribute("listaCategorias", listaCategorias);
                HttpSession misesion = request.getSession();

                misesion.setAttribute("listaProductos", listaProductos);
                request.getRequestDispatcher("productos.jsp").forward(request, response);
                break;
            case "delete":
                if (model.eliminarProducto(Integer.parseInt(productoid))) {
                    request.getRequestDispatcher("admin/admin_productos.jsp").forward(request, response);
                } else {
                    request.getRequestDispatcher("admin/admin_productos.jsp").forward(request, response);
                }
                break;
            case "filtrarPorCategoria":
                // Filtra productos por categoría
                List<Producto> productosFiltrados = model.obtenerProductosPorCategoria(categoriaNombre);

                request.setAttribute("listaProductos", productosFiltrados);
                request.setAttribute("listaCategorias", model.obtenerCategorias());

                // Redirigir
                request.getRequestDispatcher("productosFiltrados.jsp").forward(request, response);
            break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        if (ServletFileUpload.isMultipartContent(request)) {
            try {
                DiskFileItemFactory factory = new DiskFileItemFactory();
                ServletFileUpload upload = new ServletFileUpload(factory);

                List<FileItem> items = upload.parseRequest(request);

                String action = "";
                int id = 0;
                String nombre = "";
                String descripcion = "";
                String categoria = "";
                byte[] imagen = null;
                String proveedor = "";
                double precio = 0.00;
                int stock = 0;

                for (FileItem item : items) {
                    switch (item.getFieldName()) {
                        case "action":
                            action = item.getString();
                            break;
                        case "producto-id":
                            id = Integer.parseInt(item.getString());
                            break;
                        case "producto-nombre":
                            nombre = item.getString();
                            break;
                        case "producto-descripcion":
                            descripcion = item.getString();
                            break;
                        case "producto-categoria":
                            categoria = item.getString();
                            break;
                        case "producto-imagen":
                            InputStream imageStream = item.getInputStream();
                            ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
                            byte[] buffer = new byte[4096];
                            int bytesRead;
                            while ((bytesRead = imageStream.read(buffer)) != -1) {
                                byteArrayOutputStream.write(buffer, 0, bytesRead);
                            }
                            imagen = byteArrayOutputStream.toByteArray();

                            break;
                        case "producto-proveedor":
                            proveedor = item.getString();
                            break;
                        case "producto-precio":
                            precio = Double.parseDouble(item.getString());
                            break;
                        case "producto-stock":
                            stock = Integer.parseInt(item.getString());
                            break;
                    }
                }

                switch (action) {
                    case "agregar-producto":
                        for (FileItem item : items) {
                            if (!item.isFormField()) {
                                if (model.agregarProducto(nombre, categoria, imagen,
                                        descripcion, proveedor, precio, stock)) {
                                    request.getRequestDispatcher("admin/admin_productos.jsp").forward(request, response);
                                } else {
                                    request.getRequestDispatcher("admin/admin_productos_agregar.jsp").forward(request, response);
                                }
                            }
                        }
                        break;
                    case "editar-producto":
                        for (FileItem item : items) {
                            if (!item.isFormField()) {

                                if (model.editarProducto(id, nombre, categoria, imagen,
                                        descripcion, proveedor, precio, stock)) {

                                    request.getRequestDispatcher("admin/admin_productos.jsp").forward(request, response);
                                } else {
                                    CategoriaController categoriaController = new CategoriaController();
                                    List<Categoria> listaCategorias = categoriaController.obtenerCategorias();

                                    
                                    request.setAttribute("listaCategorias", listaCategorias);

                                    request.getRequestDispatcher("admin/admin_productos_editar.jsp?productoid=" + id).forward(request, response);
                                }
                            }
                        }
                        break;
                }
            } catch (Exception e) {
                response.getWriter().write("Error en la subida del archivo: " + e.getMessage());
            }
        } else {
            response.getWriter().write("Este formulario NO admite la carga de archivos.");
        }

    }

    public void eliminarImagen(String rutaImagen) {
        String filePath = getServletContext().getRealPath("/assets/img/productos/") + rutaImagen;
        File file = new File(filePath);
        if (file.exists()) {
            file.delete();
        }
    }
    
     

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    public Producto obtenerProducto(int id) {
        return (model.obtenerProducto(id) != null) ? model.obtenerProducto(id) : null;
    }

    public List<Producto> obtenerProductos() {
        return model.obtenerProductos();
    }
}
