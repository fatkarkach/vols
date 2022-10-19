package com.mvc.dao;

import com.mvc.bean.RegisterBean;
import com.mvc.bean.ReservationBean;
import com.mvc.bean.Vol;
import com.mvc.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class VolDao {
    public  static int id_vols;
    public  List<Vol> getVols() {
        List<Vol> list = new ArrayList<>();
        Vol  v= null;

        try{
            Connection connection =  DBConnection.createConnection();
            String sql = "SELECT * FROM vols";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while(rs.next()){
                v = new Vol();
                v.setIdVol(rs.getInt(1));
                v.setStart_city(rs.getString(2));
                v.setEnd_city(rs.getString(3));
                v.setEscale(rs.getString(4));
                v.setPrix(rs.getInt(5));
                v.setStart_date_time(rs.getString(6));
                v.setEnd_date_time(rs.getString(7));
                list.add(v);
            }

        }catch(Exception e){
            e.getMessage();
        }

        return list;
    }
    //add res
    public static String registerres(ReservationBean reservationBean)
    {
        int nb_places = reservationBean.getNb_places();
        int idVol = reservationBean.getidVol();
        String typeBooking = reservationBean.getTypeBooking();
        String classe = reservationBean.getClasse();

        Connection con = null;
        PreparedStatement preparedStatement = null;
        try
        {
            LoginDao loginDao=new LoginDao();
           int  iduser=loginDao.id_user;
            con = DBConnection.createConnection();
            String query = "insert into bookings(idBooking ,iduser ,idvol,nb_places,typeBooking,status,classe) values (NULL,?,?,?,?,?,?)"; //Insert user details into the table 'USERS'
            preparedStatement = con.prepareStatement(query);
            preparedStatement.setInt(1, iduser);
            preparedStatement.setInt(2, idVol);
            preparedStatement.setInt(3, nb_places);
            preparedStatement.setString(4, typeBooking);
            preparedStatement.setString(5, "Confirmé");
            preparedStatement.setString(6, classe);

            int i= preparedStatement.executeUpdate();

            if (i!=0)  //Just to ensure data has been inserted into the database
                return "SUCCESS";
        }
        catch(SQLException e)
        {
            e.printStackTrace();
        }
        return "Oops.. Something went wrong there..!";  // On failure, send a message from here.
    }
}
