<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@page import="com.mvc.bean.Vol"%>
<%@page import="com.mvc.dao.VolDao"%>
<%@page isELIgnored="false" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.min.js" integrity="sha384-IDwe1+LCz02ROU9k972gdyvl+AESN10+x7tBKgc9I5HFtuNz0wWnPclzo6p9vxnk" crossorigin="anonymous"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
  <title>User Page</title>
</head>
<% //In case, if User session is not set, redirect to Login page.
  if((request.getSession(false).getAttribute("User")== null) )
  {
%>
<jsp:forward page="/index.jsp"></jsp:forward>
<%} %>
<body>
<center><h2>User's Home</h2></center>

<div style="text-align: right"><a href="LogoutServle">Logout</a></div>
<div>vols</div>
<div class="container d-flex justify-content-center m-8" >
  <div class="flex flex-col">
    <div class="overflow-x-auto sm:-mx-6 lg:-mx-8">
      <div class="py-2 inline-block min-w-full sm:px-6 lg:px-8">
        <div class="overflow-x-auto">
          <table class="min-w-full">
            <thead class="border-b">
            <tr>
              <th scope="col" class="text-sm font-medium text-gray-900 px-6 py-4 text-left">
                ID
              </th>
              <th scope="col" class="text-sm font-medium text-gray-900 px-6 py-4 text-left">
                Départ
              </th>
              <th scope="col" class="text-sm font-medium text-gray-900 px-6 py-4 text-left">
                Arrivée
              </th>
              <th scope="col-2" class="text-sm font-medium text-gray-900 px-6 py-4 text-left">
                Date/Heure départ
              </th>
              <th scope="col-2" class="text-sm font-medium text-gray-900 px-6 py-4 text-left">
                Date/Heure arrivée
              </th>
              <th scope="col" class="text-sm font-medium text-gray-900 px-6 py-4 text-left">
                escale
              </th>
              <th scope="col" class="text-sm font-medium text-gray-900 px-6 py-4 text-left">
                Prix
              </th>
              <th scope="col" class="text-sm font-medium text-gray-900 px-6 py-4 text-left">
                options
              </th>

            </tr>
            </thead>
            <tbody>
            <%
              VolDao dao = new VolDao();
              List<Vol> list = dao.getVols();
              for(Vol v : list) {
            %>

            <tr class="border-b">
              <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">
                <%=v.getIdVol() %>
              </td>
              <td class="text-sm text-gray-900 font-light px-6 py-4 whitespace-nowrap">
                <%=v.getStart_city() %>
              </td>
              <td class="text-sm text-gray-900 font-light px-6 py-4 whitespace-nowrap">
                <%=v.getEnd_city() %>
              </td>
              <td class="text-sm text-gray-900 font-light px-6 py-4 whitespace-nowrap">
                <%=v.getStart_date_time() %>
              </td>
              <td class="text-sm text-gray-900 font-light px-6 py-4 whitespace-nowrap">
                <%=v.getEnd_date_time() %>
              </td>
              <td class="text-sm text-gray-900 font-light px-6 py-4 whitespace-nowrap">
                <%=v.getEscale() %>
              </td>

              <td class="text-lg text-gray-900 font-light px-6 py-4 whitespace-nowrap">
                <%=v.getPrix() %> MAD
              </td>
<%--              <td class="text-sm text-gray-900 font-light px-6 py-4 whitespace-nowrap">--%>
<%--                <a href="edit_vol.jsp?idVol=<%=v.getIdVol() %>" class="text-gray-900 hover:text-gray-600"><i class="fas fa-edit"></i></a>--%>
<%--                <a href="delete?idVol=<%=v.getIdVol() %>" class="text-gray-900 hover:text-gray-600"><i class="fa fa-trash"></i></a>--%>
<%--              </td>--%>
              <td><button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal<%=v.getIdVol()%>">
                Réserver
              </button>
                <!-- Modal -->
                <div class="modal fade" id="exampleModal<%=v.getIdVol()%>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                  <div class="modal-dialog">
                    <div class="modal-content">
                      <div class="modal-header">
                        <h1 class="modal-title fs-5 text-center" id="exampleModalLabel">Réservation</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                      </div>
                      <div class="modal-body">
                        <form name="form" action="ResServlet" method="post">
                          <!-- nbre place input -->
                          <div class="form-outline mb-4">
                            <label class="form-label" for="form2Example1">Nombre de places:</label>
                            <input type="number" id="form2Example1" class="form-control"  name="nb_places"/>
                           </div>

                          <!-- type input -->
                          <div class="form-outline mb-4">
                            <select class="form-select" aria-label="Default select example" name="typeBooking">
                              <option selected>Saisir votre Choix</option>
                              <option value="Aller">Aller</option>
                              <option value="Aller-Retour">Aller-Retour</option>
                            </select>
                          </div>
                          <!--  classe input -->
                          <div class="form-outline mb-4">
                            <select class="form-select" aria-label="Default select example" name="classe">
                              <option selected>Saisir Classe :</option>
                              <option value="economique">economique</option>
                              <option value="Affaire">Affaire</option>
                              <option value="Premier">Premier</option>
                            </select>
                          </div>

                      <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Fermer</button>
                        <input type="hidden" name="idVol" value="<%=v.getIdVol() %>" />
                        <input type="submit" value="reserve">
                      </div>
                        </form>
                      </div>
                    </div>
                  </div>
                </div>
              </td>

            </tr>
            <%
              }
            %>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>
</div>

</body>
</html>