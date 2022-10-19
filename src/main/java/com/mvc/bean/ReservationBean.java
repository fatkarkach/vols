package com.mvc.bean;

public class ReservationBean {
    private static int idBooking;
    private static int idVol;
    private static int nb_places;
    private static String typeBooking;

    private static String classe;



    public ReservationBean() {
        super();
    }



    public ReservationBean(int idBooking ,int idVol,int nb_places, String typeBooking,String classe) {
        this.idVol=idVol;
        this.idBooking = idBooking;
        this.nb_places = nb_places;
        this.typeBooking = typeBooking;
        this.classe = classe;
    }

    public static int getIdBooking() {
        return idBooking;
    }

    public void setIdBooking(int idBooking) {
        this.idBooking = idBooking;
    }

    public static int getidVol() {
        return idVol;
    }

    public void setidVol(int idVol) {
        this.idVol = idVol;
    }
    public static int getNb_places() {
        return nb_places;
    }

    public void setNb_places(int nb_places) {
        this.nb_places = nb_places;
    }

    public static String getTypeBooking() {
        return typeBooking;
    }

    public void setTypeBooking(String typeBooking) {
        this.typeBooking = typeBooking;
    }

    public static String getClasse() {
        return classe;
    }

    public void setClasse(String classe) {
        this.classe = classe;
    }


}
