/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelDAO;

import configuration.Conexion;
import interfaces.CRUDGeneros;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Generos;

/**
 *
 * @author user
 */
public class GeneroDAO implements CRUDGeneros {

    Conexion conect = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    Generos nGenero = new Generos();


    @Override
    public List<Generos> listarGeneros() {
        ArrayList<Generos> listaGenero = new ArrayList<Generos>();
        String sql = "select * from Generos";
        try {
            con = conect.getConnection();
            ps = con.prepareCall(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Generos nuevoGenero = new Generos();
                nuevoGenero.setCodigoGenero(rs.getInt("codigoGenero"));
                nuevoGenero.setNombreGenero(rs.getString("nombreGenero"));
                nuevoGenero.setOrigen(rs.getString("origen"));
                nuevoGenero.setDescripcion(rs.getString("descripcion"));
                listaGenero.add(nuevoGenero);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listaGenero;
    }

    @Override
    public Generos buscarGenero(int id) {
        String sql = "select * from Generos where codigoGenero =" + id;
        try {
            con = conect.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                nGenero.setCodigoGenero(rs.getInt("codigoGenero"));
                nGenero.setNombreGenero(rs.getString("nombreGenero"));
                nGenero.setOrigen(rs.getString("origen"));
                nGenero.setDescripcion(rs.getString("descripcion"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return nGenero;
    }

    @Override
    public boolean eliminarGenero(int id) {
        String sql = "delete from Generos where codigoPersona =" + id;
        try {
            con = conect.getConnection();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
