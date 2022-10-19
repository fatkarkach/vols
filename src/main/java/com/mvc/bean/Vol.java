package com.mvc.bean;

public class Vol {
    private int idVol;
    private String start_date_time;
    private String end_date_time;
    private String start_city;
    private String end_city;
    private String escale;
    private int prix;


    public Vol() {
        super();
    }

    public Vol(int idVol, String start_city, String end_city,  String escale, int prix, String start_date_time, String end_date_time) {
        this.idVol = idVol;
        this.start_date_time = start_date_time;
        this.end_date_time = end_date_time;
        this.start_city = start_city;
        this.end_city = end_city;
        this.escale = escale;
        this.prix = prix;
    }


    public Vol(String start_city, String end_city,  String escale, int prix, String start_date_time, String end_date_time) {

        this.start_date_time = start_date_time;
        this.end_date_time = end_date_time;
        this.start_city = start_city;
        this.end_city = end_city;
        this.escale = escale;
        this.prix = prix;
    }


    public int getIdVol() {
        return idVol;
    }

    public void setIdVol(int idVol) {
        this.idVol = idVol;
    }

    public String getStart_date_time() {
        return start_date_time;
    }

    public void setStart_date_time(String start_date_time) {
        this.start_date_time = start_date_time;
    }

    public String getEnd_date_time() {
        return end_date_time;
    }

    public void setEnd_date_time(String end_date_time) {
        this.end_date_time = end_date_time;
    }

    public String getStart_city() {
        return start_city;
    }

    public void setStart_city(String start_city) {
        this.start_city = start_city;
    }

    public String getEnd_city() {
        return end_city;
    }

    public void setEnd_city(String end_city) {
        this.end_city = end_city;
    }


    public String getEscale() {
        return escale;
    }

    public void setEscale(String escale) {
        this.escale = escale;
    }

    public int getPrix() {
        return prix;
    }

    public void setPrix(int prix) {
        this.prix = prix;
    }

}
