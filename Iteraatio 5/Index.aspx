<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="Iteraatio_5.Index" %>

<!DOCTYPE html>
<%@ Import Namespace="System.IO"%>
<%@ Import Namespace="System.Net"%>
<%@ Import Namespace="System.Xml"%>

    <html lang ="en">
        <head>
            <link rel ="stylesheet" href ="index.css">
            <title> Document </title>
        </head>
        <body>
            <form id="form2" runat="server" method="post" action="Index.aspx">
            <div class="toimialaDiv">
         
            <label id="toimiala" for="SelectToimiala">TOIMIALA</label>
                <select id="toimi" name="toimi" class="toimi" value="<%=Convert.ToString(Request.Form["toimi"])%>">
                    <!--toimialan IDt-->
                    <option value="0">Valitse</option>
                    <option value="85">Koulutus</option>
                    <option value="86">Terveydenhuolto-ja sosiaalipalvelut</option>
                    <option value="68">Kiinteistöalan palvelut</option>
                    <option value="41">Rakentaminen</option>
                    <option value="55">Majoitus- ja ravitsemistoiminta</option>
                </select>
            </div>
          
            <div class="kuntaDiv">
            <label id="kunta" for="SelectKunta">KUNTA</label>
                <select id="kunnat" name="kunnat" class="kunnat" value="<% =Convert.ToString(Request.Form["kunnat"])%>">
                    <!--kunnan IDt-->
                    <option value="0">Valitse</option>
                    <option value="Oulu">Oulu</option>
                    <option value="Lahti">Lahti</option>
                    <option value="Helsinki">Helsinki</option>
                    <option value="Tampere">Tampere</option>
                    <option value="Turku">Turku</option>
                </select>
                <button type="submit">HAE TIEDOT</button>
            </div>
            </form>
        <%
            string toimialaKoodi = Convert.ToString(Request.Form["toimi"]);
            string paikkakunta = Convert.ToString(Request.Form["kunnat"]);
            
            StringWriter writer = new StringWriter();
            WebRequest myRequest = WebRequest.Create(@"https://avoindata.prh.fi/bis/v1?totalResults=false&maxResults=11&resultsFrom=0&registeredOffice=" + paikkakunta + "&businessLineCode=" + toimialaKoodi + "&companyRegistrationFrom=2014-02-28");
            WebResponse response = myRequest.GetResponse();
            Stream dataStream = response.GetResponseStream();
            StreamReader reader = new StreamReader(dataStream);
            string responseFromServer = reader.ReadToEnd();

            string[] tiedot = responseFromServer.Split('{');
            for (int i = 2; i < tiedot.Length; i++)
            {
                int nimi = tiedot[i].IndexOf("name");
                int data = tiedot[i].IndexOf("registrationDate");
                Console.WriteLine(tiedot[i].Substring(nimi + 7, data - 36));
            }

            string[] businessId = responseFromServer.Split('{');
            for (int i = 2; i < tiedot.Length; i++)
            {
                int nimi = businessId[i].IndexOf("Id");
                int name = businessId[i].LastIndexOf("name");
                Console.WriteLine(businessId[i].Substring(nimi + 5, name - 17));
            }

            int nimet = tiedot[2].IndexOf("name");
            int päivä = tiedot[2].IndexOf("registrationDate");
            int id = businessId[2].IndexOf("Id");
            int names = businessId[2].LastIndexOf("name");
            
            int nimetA = tiedot[3].IndexOf("name");
            int päiväA = tiedot[3].IndexOf("registrationDate");
            int idA = businessId[3].IndexOf("Id");
            int nameA = businessId[3].LastIndexOf("name");

            int nimetB = tiedot[4].IndexOf("name");
            int päiväB = tiedot[4].IndexOf("registrationDate");
            int idB = businessId[4].IndexOf("Id");
            int nameB = businessId[4].LastIndexOf("name");

            int nimetC = tiedot[5].IndexOf("name");
            int päiväC = tiedot[5].IndexOf("registrationDate");
            int idC = businessId[5].IndexOf("Id");
            int nameC = businessId[5].LastIndexOf("name");

            int nimetD = tiedot[6].IndexOf("name");
            int päiväD = tiedot[6].IndexOf("registrationDate");
            int idD = businessId[6].IndexOf("Id");
            int nameD = businessId[6].LastIndexOf("name");

            int nimetE = tiedot[7].IndexOf("name");
            int päiväE = tiedot[7].IndexOf("registrationDate");
            int idE = businessId[7].IndexOf("Id");
            int nameE = businessId[7].LastIndexOf("name");

            int nimetF = tiedot[8].IndexOf("name");
            int päiväF = tiedot[8].IndexOf("registrationDate");
            int idF = businessId[8].IndexOf("Id");
            int nameF = businessId[8].LastIndexOf("name");

            int nimetG = tiedot[9].IndexOf("name");
            int päiväG = tiedot[9].IndexOf("registrationDate");
            int idG = businessId[9].IndexOf("Id");
            int nameG = businessId[9].LastIndexOf("name");

            int nimetH = tiedot[10].IndexOf("name");
            int päiväH = tiedot[10].IndexOf("registrationDate");
            int idH = businessId[10].IndexOf("Id");
            int nameH = businessId[10].LastIndexOf("name");

            int nimetI = tiedot[11].IndexOf("name");
            int päiväI = tiedot[11].IndexOf("registrationDate");
            int idI = businessId[11].IndexOf("Id");
            int nameI = businessId[11].LastIndexOf("name");
          %>

            <div class="taulu">
                <table>
                <tr>
                    <th>Y-TUNNUS</th>
                    <th>YRITYS</th>
                </tr>
                <tr>
                    <td>
                    <%
                        Response.Write(tiedot[2].Substring(id + 5, names - 17));
                    %>
                    </td>
                    <td>
                    <%
                        Response.Write(tiedot[2].Substring(nimet + 7, päivä - 36));
                    %>
                    </td>
                </tr>
                <tr>
                    <td>
                    <%
                        Response.Write(tiedot[3].Substring(idA + 5, nameA - 17));
                    %>
                    </td>
                    <td>
                    <%
                        Response.Write(tiedot[3].Substring(nimetA + 7, päiväA - 36));
                    %>
                    </td>
                </tr>
                <tr>
                    <td>
                    <%
                        Response.Write(tiedot[4].Substring(idB + 5, nameB - 17));
                    %>
                    </td>
                    <td>
                    <%
                        Response.Write(tiedot[4].Substring(nimetB + 7, päiväB - 36));
                    %>
                    </td>
                </tr>
                <tr>
                    <td>
                    <%
                        Response.Write(tiedot[5].Substring(idC + 5, nameC - 17));
                    %>
                    </td>
                    <td>
                    <%
                        Response.Write(tiedot[5].Substring(nimetC + 7, päiväC - 36));
                    %>
                    </td>
                </tr>
                <tr>
                    <td>
                    <%
                        Response.Write(tiedot[6].Substring(idD + 5, nameD - 17));
                    %>
                    </td>
                    <td>
                    <%
                        Response.Write(tiedot[6].Substring(nimetD + 7, päiväD - 36));
                    %>
                    </td>
                </tr>
                <tr>
                    <td>
                    <%
                        Response.Write(tiedot[7].Substring(idE + 5, nameE - 17));
                    %>
                    </td>
                    <td>
                    <%
                        Response.Write(tiedot[7].Substring(nimetE + 7, päiväE - 36));
                    %>
                    </td>
                </tr>
                <tr>
                    <td>
                    <%
                        Response.Write(tiedot[8].Substring(idF + 5, nameF - 17));
                    %>
                    </td>
                    <td>
                    <%
                        Response.Write(tiedot[8].Substring(nimetF + 7, päiväF - 36));
                    %>
                    </td>
                </tr>
                <tr>
                    <td>
                    <%
                        Response.Write(tiedot[9].Substring(idG + 5, nameG - 17));
                    %>
                    </td>
                    <td>
                    <%
                        Response.Write(tiedot[9].Substring(nimetG + 7, päiväG - 36));
                    %>
                    </td>
                </tr>
                <tr>
                    <td>
                    <%
                        Response.Write(tiedot[10].Substring(idH + 5, nameH - 17));
                    %>
                    </td>
                    <td>
                    <%
                        Response.Write(tiedot[10].Substring(nimetH + 7, päiväH - 36));
                    %>
                    </td>
                </tr>
                <tr>
                    <td>
                    <%
                        Response.Write(tiedot[11].Substring(idI + 5, nameI - 17));
                    %>
                    </td>
                    <td>
                    <%
                        Response.Write(tiedot[11].Substring(nimetI + 7, päiväI - 36));
                    %>
                    </td>
                </tr>
                </table>
            </div>
        </body>
    </html>