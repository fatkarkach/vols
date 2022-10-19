package com.mvc.controller;

import com.mvc.bean.ReservationBean;
import com.mvc.dao.VolDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "ResServlet", value = "/ResServlet")
public class ResServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //Copying all the input parameters in to local variables
        int idVol = Integer.parseInt(request.getParameter("idVol"));
        System.out.println(idVol);
        int nb_places = Integer.parseInt(request.getParameter("nb_places"));
        System.out.println(nb_places);
        String typeBooking = request.getParameter("typeBooking");
        System.out.println(typeBooking);
        String classe = request.getParameter("classe");
        System.out.println(classe);

        ReservationBean reservationBean = new ReservationBean();
        reservationBean.setidVol(idVol);
        reservationBean.setNb_places(nb_places);
        reservationBean.setTypeBooking(typeBooking);
        reservationBean.setClasse(classe);

        VolDao volDao = new VolDao();

        //The core Logic of the Registration application is present here. We are going to insert user data in to the database.
        String userRe = volDao.registerres(reservationBean);
        System.out.println(userRe);

        if(userRe.equals("SUCCESS"))   //On success, you can display a message to user on Home page
        {
            request.getRequestDispatcher("/User.jsp").forward(request, response);
        }
        else   //On Failure, display a meaningful message to the User.
        {
            request.setAttribute("errMessage", userRe);
            request.getRequestDispatcher("/User.jsp").forward(request, response);
        }
    }
}
