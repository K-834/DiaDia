/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import Config.db;
import Entity.Categoria;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Dayanna
 */
public class CategoriaModel {
    
    private Connection connection;

    public CategoriaModel() {
        db con = new db();
        connection = con.Conexion();
    }

    public List<Categoria> obtenerCategorias() {
        List<Categoria> categorias = new ArrayList<>();
        String sql = "SELECT * FROM categoria"; 

        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Categoria categoria = new Categoria();
                categoria.setId(resultSet.getInt("id")); 
                categoria.setNombre(resultSet.getString("nombre"));
                categoria.setDescripcion(resultSet.getString("descripcion")); 
                categorias.add(categoria);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return categorias;
    }

    public Categoria obtenerCategoria(int id) {
        String sql = "SELECT * FROM categoria WHERE id = ? LIMIT 1"; 
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, Integer.toString(id));
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                Categoria categoria = new Categoria();
                categoria.setId(resultSet.getInt("id")); 
                categoria.setNombre(resultSet.getString("nombre"));
                categoria.setDescripcion(resultSet.getString("descripcion")); 
                return categoria;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean agregarCategoria(String nombre, String descripcion) {
        String sql = "INSERT INTO categoria (nombre, descripcion) VALUES(?, ?)";
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, nombre);
            statement.setString(2, descripcion);
            return statement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    


    public boolean editarCategoria(int id, String nombre, String descripcion) {
        String sql = "UPDATE categoria SET nombre = ?, descripcion = ? WHERE id = ?"; // Cambiado a 'categorias' y 'id_categoria'
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, nombre);
            statement.setString(2, descripcion);
            statement.setInt(3, id);
            return statement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean eliminarCategoria(int id) {
        String sql = "DELETE FROM categoria WHERE id = ?"; // Cambiado a 'categorias' y 'id_categoria'
        try {
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            return statement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

   
}
